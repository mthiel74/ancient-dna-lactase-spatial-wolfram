#!/usr/bin/env wolframscript
(* Convergence check for the v3 origin MCMC: run one extra chain from a
   different seed and store it as data/processed/origin_mcmc_chain_seed<seed>.csv.
   Usage: wolframscript -file scripts/run_origin_mcmc_chain.wls <seed> [iterations] [burn] *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

seed = ToExpression[$ScriptCommandLine[[2]]];
iters = If[Length[$ScriptCommandLine] >= 3, ToExpression[$ScriptCommandLine[[3]]], 30000];
burn = If[Length[$ScriptCommandLine] >= 4, ToExpression[$ScriptCommandLine[[4]]], 10000];

samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
Print["seed ", seed, "  iterations ", iters, "  burn ", burn, "  start ", DateString[]];
mcmc = RunOriginMCMC[samples, grid, "Iterations" -> iters, "Burn" -> burn, "Thin" -> 5,
  "Seed" -> seed,
  "ProgressFunction" -> (Print[DateString["Time"], "  it ", #1, "  acc ", #2, "  logpost ", #3] &)];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_mcmc_chain_seed" <> ToString[seed] <> ".csv"}],
  MapThread[Append[#1, "LogPosterior" -> #2] &, {mcmc["Particles"], mcmc["LogPosterior"]}]];
Print["acceptance ", mcmc["AcceptanceHistory"], "  min ESS ", mcmc["ESSHistory"]];
Do[Print[r], {r, PosteriorParameterQuantiles[mcmc]}];
