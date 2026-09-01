#!/usr/bin/env wolframscript
(* v3: exact per-sample binomial likelihood + adaptive Metropolis MCMC for the
   point-source origin model.  Replaces summary-statistic ABC for the origin
   question.  Writes
     data/processed/origin_mcmc_chain.csv (+ .meta.json)  thinned post-burn chain
     data/processed/origin_mcmc_summary.csv                quantiles per parameter
     data/processed/origin_mcmc_regions.csv                region masses vs constrained prior
   Usage: wolframscript -file scripts/run_origin_mcmc.wls [iterations] [burn] *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

iters = If[Length[$ScriptCommandLine] >= 2, ToExpression[$ScriptCommandLine[[2]]], 30000];
burn = If[Length[$ScriptCommandLine] >= 3, ToExpression[$ScriptCommandLine[[3]]], 10000];

samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
Print["samples: ", Length[samples], "  grid cells: ", Length[grid]];
Print["iterations ", iters, "  burn ", burn, "  start ", DateString[]];

t0 = AbsoluteTime[];
mcmc = LoadOrRunOriginMCMC[root, samples, grid, "Iterations" -> iters, "Burn" -> burn,
  "Thin" -> 5,
  "ProgressFunction" -> (Print[DateString["Time"], "  it ", #1, "  acc ", NumberForm[#2, 3],
     "  logpost ", NumberForm[#3, 7]] &)];
Print["done in ", Round[AbsoluteTime[] - t0], " s;  acceptance ", mcmc["AcceptanceHistory"],
  "  min autocorr ESS ", mcmc["ESSHistory"], "  draws ", Length[mcmc["Particles"]]];

q = PosteriorParameterQuantiles[mcmc];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_mcmc_summary.csv"}], q];
Do[Print[r], {r, q}];

parts = mcmc["Particles"];
regions = {
  <|"Region" -> "WestOf5E", "Test" -> (#["OriginLongitude"] < 5 &)|>,
  <|"Region" -> "CentralEurope", "Test" -> (46 < #["OriginLatitude"] < 53 && 8 <= #["OriginLongitude"] < 20 &)|>,
  <|"Region" -> "Carpathian", "Test" -> (45 < #["OriginLatitude"] < 49 && 16 <= #["OriginLongitude"] < 23 &)|>,
  <|"Region" -> "Scandinavia", "Test" -> (#["OriginLatitude"] > 55 &)|>};
priorFile = FileNameJoin[{root, "data", "processed", "origin_constrained_prior_regions.csv"}];
priorMass = If[FileExistsQ[priorFile],
  Association[(#["Region"] -> #["ConstrainedPriorMass"]) & /@
    Map[Association, Normal[Import[priorFile, "Dataset", HeaderLines -> 1]]]], <||>];
rrows = Map[<|"Region" -> #["Region"],
    "PosteriorMass" -> N[Count[parts, d_ /; #["Test"][d]]/Length[parts]],
    "ConstrainedPriorMass" -> Lookup[priorMass, #["Region"], Missing["NotAvailable"]]|> &, regions];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_mcmc_regions.csv"}], rrows];
Do[Print[r], {r, rrows}];
Print["P(T<6000) posterior: ", N[Count[parts, d_ /; d["OriginTimeBP"] < 6000]/Length[parts]]];
Print["log posterior quantiles: ", Quantile[mcmc["LogPosterior"], {0.025, 0.5, 0.975}]];
