#!/usr/bin/env wolframscript
(* Export the v3 (exact-likelihood) figures for the README:
     figures/generated/origin_mcmc_density.png        exact-likelihood origin posterior map
     figures/generated/likelihood_residual_heatmap.png region x millennium residual decomposition
   plus data/processed/origin_mcmc_deviance.csv (ladder) *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];
proc = FileNameJoin[{root, "data", "processed"}];
fig = FileNameJoin[{root, "figures", "generated"}];

samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
mcmc = LoadOrRunOriginMCMC[root, samples, grid];
Export[FileNameJoin[{fig, "origin_mcmc_density.png"}], OriginDensityMap[mcmc], ImageResolution -> 110];

mapOf[files_] := KeyDrop[First[MaximalBy[Flatten[Map[Association,
  Normal[Import[#, "Dataset", HeaderLines -> 1]]] & /@ files, 1], #["LogPosterior"] &]], "LogPosterior"];
originFiles = Join[{FileNameJoin[{proc, "origin_mcmc_chain.csv"}]}, FileNames["origin_mcmc_chain_seed*.csv", proc]];
mainFiles = FileNames["main_mcmc_chain_seed*.csv", proc];
domFiles = FileNames["origin_mcmc_dominance_seed*.csv", proc];
models = <|"spatial standing variation (MAP)" -> mapOf[mainFiles], "spatial point source (MAP)" -> mapOf[originFiles]|>;
If[domFiles =!= {}, models["spatial point source + dominance h (MAP)"] = mapOf[domFiles]];
ladder = DevianceLadder[samples, grid, models];
LactasePersistenceSpatial`Private`ExportRows[FileNameJoin[{proc, "origin_mcmc_deviance.csv"}], ladder];
Do[Print[r], {r, ladder}];
resid = LikelihoodResidualTable[samples, grid, models["spatial point source (MAP)"]];
LactasePersistenceSpatial`Private`ExportRows[FileNameJoin[{proc, "origin_mcmc_residuals.csv"}], resid];
Export[FileNameJoin[{fig, "likelihood_residual_heatmap.png"}], ResidualHeatmap[resid], ImageResolution -> 110];
conv = McmcConvergenceTable[originFiles];
LactasePersistenceSpatial`Private`ExportRows[FileNameJoin[{proc, "origin_mcmc_convergence.csv"}],
  Map[Append[KeyDrop[#, "ChainMedians"], "ChainMedians" -> StringRiffle[ToString /@ #["ChainMedians"], " | "]] &, conv]];
Print["done"];
