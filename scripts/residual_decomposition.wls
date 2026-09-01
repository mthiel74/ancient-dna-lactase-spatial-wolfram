#!/usr/bin/env wolframscript
(* Where does the spatial point-source model lose against five independent
   regional logistic curves?  Per-region and per-millennium log-likelihood
   deficit of the MAP spatial model relative to the regional-logistic MLE,
   on the same in-era samples.  Writes data/processed/origin_mcmc_residuals.csv *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];
proc = FileNameJoin[{root, "data", "processed"}];

samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
lidx = LikelihoodIndex[samples, grid];
k = lidx["Derived"]; n = lidx["Called"];
regionOf = #["Region"] & /@ grid;
posReg = regionOf[[#[[2]]]] & /@ lidx["Positions"];
posT = $LikelihoodTimes[[#[[1]]]] & /@ lidx["Positions"];

files = Join[{FileNameJoin[{proc, "origin_mcmc_chain.csv"}]}, FileNames["origin_mcmc_chain_seed*.csv", proc]];
chains = Flatten[Map[Association, Normal[Import[#, "Dataset", HeaderLines -> 1]]] & /@ files, 1];
best = KeyDrop[First[MaximalBy[chains, #["LogPosterior"] &]], "LogPosterior"];
traj = SimulateSpatialTrajectory[best, grid];
p = Extract[traj["Frequencies"], lidx["Positions"]];
e = best["CallErrorRate"];
qModel = Clip[p (1 - 2 e) + e, {10.^-9, 1 - 10.^-9}];
llModel = k Log[qModel] + (n - k) Log[1 - qModel];

(* regional logistic MLE, per sample predicted q *)
qReg = ConstantArray[0., Length[k]]; regFit = <||>;
Do[Module[{sel = Flatten[Position[posReg, r]], kk, nn, tt, a, b, sol, nll},
   kk = k[[sel]]; nn = n[[sel]]; tt = posT[[sel]]/1000.;
   nll[a_?NumericQ, b_?NumericQ] := -Total[kk Log[LogisticSigmoid[a - b tt]] + (nn - kk) Log[1 - LogisticSigmoid[a - b tt]]];
   sol = Quiet[FindMinimum[nll[a, b], {{a, -2}, {b, 0.5}}]];
   regFit[r] = {a, b} /. sol[[2]];
   qReg[[sel]] = LogisticSigmoid[regFit[r][[1]] - regFit[r][[2]] tt]],
  {r, Union[posReg]}];
llReg = k Log[qReg] + (n - k) Log[1 - qReg];

kyr = Floor[posT/1000];
rows = Flatten[Table[Module[{sel = Flatten[Position[Transpose[{posReg, kyr}], {r, t}]]},
   If[sel === {}, Nothing,
    <|"Region" -> r, "MillenniumBP" -> t, "Samples" -> Length[sel],
      "Called" -> Total[n[[sel]]], "Derived" -> Total[k[[sel]]],
      "ObservedFreq" -> N[Total[k[[sel]]]/Total[n[[sel]]]],
      "ModelFreq" -> N[Total[n[[sel]] qModel[[sel]]]/Total[n[[sel]]]],
      "RegionalLogisticFreq" -> N[Total[n[[sel]] qReg[[sel]]]/Total[n[[sel]]]],
      "LLModelMinusLogistic" -> Total[llModel[[sel]]] - Total[llReg[[sel]]]|>]],
  {r, Union[posReg]}, {t, 0, 9}]];
LactasePersistenceSpatial`Private`ExportRows[FileNameJoin[{proc, "origin_mcmc_residuals.csv"}], rows];
Print["total deficit (model - logistic): ", Total[llModel] - Total[llReg]];
Print["by region:"];
Do[Print["  ", r, ": ", Total[Select[rows, #["Region"] === r &][[All, "LLModelMinusLogistic"]]],
   "   slope/kyr ", regFit[r][[2]], "   midpoint kyr BP ", regFit[r][[1]]/regFit[r][[2]]], {r, Union[posReg]}];
Print["worst 12 cells:"];
Do[Print["  ", r["Region"], " ", r["MillenniumBP"], "k: n=", r["Called"], " obs ", NumberForm[r["ObservedFreq"], 3],
   " model ", NumberForm[r["ModelFreq"], 3], " logistic ", NumberForm[r["RegionalLogisticFreq"], 3],
   " dLL ", NumberForm[r["LLModelMinusLogistic"], 4]], {r, Take[SortBy[rows, #["LLModelMinusLogistic"] &], 12]}];
