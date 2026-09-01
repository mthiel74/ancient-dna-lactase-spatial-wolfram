#!/usr/bin/env wolframscript
(* v3 model comparison: exact-likelihood MCMC for the STANDING-VARIATION model
   (allele present everywhere at 10,000 BP with a smooth gradient, no point
   source).  The Migration prior is widened to the origin model's range so the
   two models differ only in how the allele enters.  Writes
     data/processed/main_mcmc_chain_seed<seed>.csv
   Usage: wolframscript -file scripts/run_main_mcmc.wls <seed> [iterations] [burn] *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

seed = If[Length[$ScriptCommandLine] >= 2, ToExpression[$ScriptCommandLine[[2]]], 314159];
iters = If[Length[$ScriptCommandLine] >= 3, ToExpression[$ScriptCommandLine[[3]]], 30000];
burn = If[Length[$ScriptCommandLine] >= 4, ToExpression[$ScriptCommandLine[[4]]], 10000];

samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
spec = LactasePersistenceSpatial`Private`$PriorSpec;
spec["Migration"] = LactasePersistenceSpatial`Private`$OriginPriorSpec["Migration"];
Print["seed ", seed, "  params ", Keys[spec], "  start ", DateString[]];
mcmc = RunMCMC[samples, grid, "PriorSpec" -> spec, "Iterations" -> iters, "Burn" -> burn,
  "Thin" -> 5, "Seed" -> seed,
  "ProgressFunction" -> (Print[DateString["Time"], "  it ", #1, "  acc ", #2, "  logpost ", #3] &)];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "main_mcmc_chain_seed" <> ToString[seed] <> ".csv"}],
  MapThread[Append[#1, "LogPosterior" -> #2] &, {mcmc["Particles"], mcmc["LogPosterior"]}]];
Print["acceptance ", mcmc["AcceptanceHistory"], "  min ESS ", mcmc["ESSHistory"]];
Do[Print[r], {r, PosteriorParameterQuantiles[mcmc]}];
lidx = LikelihoodIndex[samples, grid];
best = mcmc["Particles"][[First[Ordering[mcmc["LogPosterior"], -1]]]];
Print["MAP log-likelihood: ", SampleLogLikelihood[best, grid, lidx], "  at ", best];
