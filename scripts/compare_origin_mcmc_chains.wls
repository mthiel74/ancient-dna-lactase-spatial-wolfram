#!/usr/bin/env wolframscript
(* Convergence diagnostics for the v3 origin MCMC: split-Rhat and pooled ESS
   over the main chain (origin_mcmc_chain.csv) and every
   origin_mcmc_chain_seed*.csv found.  Also computes the deviance ladder:
   saturated (one free p per occupied (time, cell)), regional-logistic
   (no space) and the fitted spatial model, on the same 6,184 samples.
   Writes data/processed/origin_mcmc_convergence.csv *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];
proc = FileNameJoin[{root, "data", "processed"}];

files = Join[{FileNameJoin[{proc, "origin_mcmc_chain.csv"}]},
  FileNames["origin_mcmc_chain_seed*.csv", proc]];
chains = Map[Association, Normal[Import[#, "Dataset", HeaderLines -> 1]]] & /@ files;
Print["chains: ", Length[chains], "  lengths: ", Length /@ chains];
keys = DeleteCases[Keys[First[First[chains]]], "LogPosterior"];

(* split-Rhat (Gelman et al. 2013): split every chain in halves *)
splitRhat[series_List] := Module[{halves, n, m, means, vars, w, b, varHat},
  halves = Flatten[Map[{#[[;; Floor[Length[#]/2]]], #[[Floor[Length[#]/2] + 1 ;;]]} &, series], 1];
  n = Min[Length /@ halves]; halves = Take[#, n] & /@ halves; m = Length[halves];
  means = Mean /@ halves; vars = Variance /@ halves;
  w = Mean[vars]; b = n Variance[means];
  varHat = (n - 1)/n w + b/n;
  Sqrt[varHat/w]];

rows = Table[Module[{series = Map[#[[All, k]] &, chains]},
  <|"Parameter" -> k,
    "Rhat" -> splitRhat[series],
    "PooledESS" -> Total[AutocorrelationESS /@ series],
    "ChainMedians" -> StringRiffle[ToString[NumberForm[Median[#], {6, 3}]] & /@ series, " | "]|>],
  {k, keys}];
Do[Print[r], {r, rows}];

regions = {
  <|"Region" -> "WestOf5E", "Test" -> (#["OriginLongitude"] < 5 &)|>,
  <|"Region" -> "CentralEurope", "Test" -> (46 < #["OriginLatitude"] < 53 && 8 <= #["OriginLongitude"] < 20 &)|>,
  <|"Region" -> "Carpathian", "Test" -> (45 < #["OriginLatitude"] < 49 && 16 <= #["OriginLongitude"] < 23 &)|>,
  <|"Region" -> "Scandinavia", "Test" -> (#["OriginLatitude"] > 55 &)|>};
Do[Print[r["Region"], ": ", Map[N[Count[#, d_ /; r["Test"][d]]/Length[#]] &, chains]], {r, regions}];

(* deviance ladder *)
samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
lidx = LikelihoodIndex[samples, grid];
k = lidx["Derived"]; n = lidx["Called"];
agg = GroupBy[Transpose[{lidx["Positions"], k, n}], First -> Rest, Total];
satLL = Total[Map[Function[{kn}, With[{kk = kn[[1]], nn = kn[[2]]},
  If[kk == 0 || kk == nn, 0., kk Log[kk/nn] + (nn - kk) Log[1 - kk/nn]]]], Values[agg]]];
constLL = With[{pbar = Total[k]/Total[n]}, Total[k] Log[pbar] + (Total[n] - Total[k]) Log[1 - pbar]];
(* regional logistic in time: fit per region by maximum likelihood on the same samples *)
regionOf = #["Region"] & /@ grid;
posReg = regionOf[[#[[2]]]] & /@ lidx["Positions"];
posT = $LikelihoodTimes[[#[[1]]]] & /@ lidx["Positions"];
regLL = Total[Table[Module[{sel = Flatten[Position[posReg, r]], kk, nn, tt, a, b, nll},
   kk = k[[sel]]; nn = n[[sel]]; tt = posT[[sel]]/1000.;
   nll[a_?NumericQ, b_?NumericQ] := -Total[kk Log[LogisticSigmoid[a - b tt]] + (nn - kk) Log[1 - LogisticSigmoid[a - b tt]]];
   -First[FindMinimum[nll[a, b], {{a, -2}, {b, 0.5}}]]], {r, Union[posReg]}]];
best = Max[Flatten[#[[All, "LogPosterior"]] & /@ chains]];
bestRow = First[MaximalBy[Flatten[chains, 1], #["LogPosterior"] &]];
bestParams = KeyDrop[bestRow, "LogPosterior"];
modelLL = SampleLogLikelihood[bestParams, grid, lidx];
Print["log-likelihood ladder on ", lidx["SampleCount"], " samples:"];
Print["  constant p:          ", constLL];
Print["  regional logistic:   ", regLL, "  (", 2 Length[Union[posReg]], " free params)"];
Print["  spatial model (MAP): ", modelLL, "  (", Length[keys], " params)"];
Print["  saturated:           ", satLL, "  (", Length[agg], " occupied (time,cell) bins)"];
Print["  deviance explained (model vs const, relative to saturated): ",
  N[(modelLL - constLL)/(satLL - constLL)]];
Print["MAP params: ", bestParams];

LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{proc, "origin_mcmc_convergence.csv"}], rows];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{proc, "origin_mcmc_deviance.csv"}],
  {<|"Model" -> "constant", "LogLikelihood" -> constLL, "FreeParameters" -> 1|>,
   <|"Model" -> "regional logistic", "LogLikelihood" -> regLL, "FreeParameters" -> 2 Length[Union[posReg]]|>,
   <|"Model" -> "spatial point-source (MAP)", "LogLikelihood" -> modelLL, "FreeParameters" -> Length[keys]|>,
   <|"Model" -> "saturated", "LogLikelihood" -> satLL, "FreeParameters" -> Length[agg]|>}];
