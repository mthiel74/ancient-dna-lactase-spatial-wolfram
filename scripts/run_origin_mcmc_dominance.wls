#!/usr/bin/env wolframscript
(* v3b: origin model with diploid dominance h (fitnesses 1, 1+hs, 1+s).
   Lactase persistence is phenotypically dominant, so h near 1 lets the
   frequency plateau below 1 without abusing the genotype-error channel.
   Writes data/processed/origin_mcmc_dominance_seed<seed>.csv
   Usage: wolframscript -file scripts/run_origin_mcmc_dominance.wls <seed> [iterations] [burn] *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

seed = If[Length[$ScriptCommandLine] >= 2, ToExpression[$ScriptCommandLine[[2]]], 314159];
iters = If[Length[$ScriptCommandLine] >= 3, ToExpression[$ScriptCommandLine[[3]]], 30000];
burn = If[Length[$ScriptCommandLine] >= 4, ToExpression[$ScriptCommandLine[[4]]], 10000];

samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
spec = LactasePersistenceSpatial`Private`$OriginPriorSpec;
spec["SelectionDairying"] = {0., 0.12};   (* homozygote s; additive-equivalent is s/2 *)
spec["SelectionBase"] = {0., 0.03};
spec["Dominance"] = {0., 1.};
Print["seed ", seed, "  params ", Keys[spec], "  start ", DateString[]];
mcmc = RunMCMC[samples, grid, "PriorSpec" -> spec, "Iterations" -> iters, "Burn" -> burn,
  "Thin" -> 5, "Seed" -> seed,
  "ProgressFunction" -> (Print[DateString["Time"], "  it ", #1, "  acc ", #2, "  logpost ", #3] &)];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_mcmc_dominance_seed" <> ToString[seed] <> ".csv"}],
  MapThread[Append[#1, "LogPosterior" -> #2] &, {mcmc["Particles"], mcmc["LogPosterior"]}]];
Print["acceptance ", mcmc["AcceptanceHistory"], "  min ESS ", mcmc["ESSHistory"]];
Do[Print[r], {r, PosteriorParameterQuantiles[mcmc]}];
lidx = LikelihoodIndex[samples, grid];
best = mcmc["Particles"][[First[Ordering[mcmc["LogPosterior"], -1]]]];
Print["MAP log-likelihood: ", SampleLogLikelihood[best, grid, lidx], "  at ", best];
