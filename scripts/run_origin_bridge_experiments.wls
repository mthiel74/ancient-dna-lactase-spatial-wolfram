#!/usr/bin/env wolframscript
(* Assumption-bridging experiments for the origin model: which single
   assumption moves our origin posterior toward Itan et al. 2009's
   central-European mode?  Each variant refits the v2 origin model on the
   AADR v66 data with ONE prior changed (plus one combined variant), then
   summarises mode, regional mass, and overlap with the digitised Itan
   posterior.  Writes data/processed/origin_bridge_<name>_particles.csv and
   a combined data/processed/origin_bridge_summary.csv. *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

samples = LoadProcessedSamples[root];
grid = BuildEuropeGrid[2];
Print["samples: ", Length[samples], ", grid: ", Length[grid], ", ", DateString[]];

baseSpec = LactasePersistenceSpatial`Private`$OriginPriorSpec;
variants = <|
  "trust_early_calls" -> <|"CallErrorRate" -> {0., 0.001}|>,
  "tight_coupling"    -> <|"DairyingLeadYears" -> {0., 200.}|>,
  "slow_mixing"       -> <|"Migration" -> {0.02, 0.08}|>,
  "itan_like"         -> <|"DairyingLeadYears" -> {0., 200.}, "Migration" -> {0.02, 0.08}|>
|>;

(* Itan comparison machinery *)
itan = ImportItanFig3Density[root];
lons = itan["Lons"]; lats = itan["Lats"];
land = Map[NumericQ, itan["Values"], {2}];
areaW = Table[Cos[la Degree], {la, lats}, {lo, lons}];
pI = MapThread[If[#3, #1 #2, 0.] &, {itan["Values"] /. _Missing -> 0., areaW, land}, 2];
pI = pI/Total[pI, 2];
itanMask50 = LactasePersistenceSpatial`Private`HPDIndicatorMask[pI, 0.5];
itanMask95 = LactasePersistenceSpatial`Private`HPDIndicatorMask[pI, 0.95];

summarise[name_, smc_] := Module[{plat, plon, w, pO, bc, m50, m95, mode, regMass, q, qOf},
  plat = smc["ParticleVectors"][[All, 1]]; plon = smc["ParticleVectors"][[All, 2]];
  w = smc["Weights"];
  pO = Table[
    If[land[[i, j]],
      areaW[[i, j]] Total[w Exp[-0.5 (((lons[[j]] - plon)/2.6)^2 + ((lats[[i]] - plat)/2.0)^2)]], 0.],
    {i, Length[lats]}, {j, Length[lons]}];
  pO = pO/Total[pO, 2];
  bc = Total[Sqrt[pI pO], 2];
  m50 = Total[pO itanMask50, 2];
  m95 = Total[pO itanMask95, 2];
  mode = Module[{pos = First@Position[pO, Max[pO]]}, {lats[[pos[[1]]]], lons[[pos[[2]]]]}];
  regMass[f_] := Total[Pick[w, MapThread[f, {plat, plon}]]];
  q = PosteriorParameterQuantiles[smc];
  qOf[p_] := With[{r = SelectFirst[q, #["Parameter"] === p &]},
    If[AssociationQ[r], {r["Lower95"], r["Median"], r["Upper95"]}, {"", "", ""}]];
  <|"Variant" -> name,
    "ESS" -> Last[smc["ESSHistory"]],
    "PriorViolationRate" -> Lookup[smc, "PriorViolationRate", ""],
    "ModeLat" -> mode[[1]], "ModeLon" -> mode[[2]],
    "MedianLat" -> qOf["OriginLatitude"][[2]], "MedianLon" -> qOf["OriginLongitude"][[2]],
    "TimeLo" -> qOf["OriginTimeBP"][[1]], "TimeMed" -> qOf["OriginTimeBP"][[2]],
    "TimeHi" -> qOf["OriginTimeBP"][[3]],
    "MassWestOf5E" -> regMass[#2 < 5 &],
    "MassCentral" -> regMass[46 < #1 < 53 && 8 <= #2 < 20 &],
    "MassCarpathian" -> regMass[45 < #1 < 49 && 16 <= #2 < 23 &],
    "MassScandinavia" -> regMass[#1 > 55 &],
    "Bhattacharyya" -> bc,
    "MassInItan50" -> m50, "MassInItan95" -> m95|>
];

rows = {};
Do[
  Module[{spec, smc, t0 = AbsoluteTime[], pf},
    spec = Join[baseSpec, variants[name]];
    Print["=== variant ", name, " : ", Normal[variants[name]]];
    pf = Function[{g, eps, acc, ess},
      Print["  gen ", g, ": eps ", NumberForm[eps, {6, 4}], " acc ",
        NumberForm[100. acc, {5, 1}], "% ESS ", NumberForm[ess, {6, 1}]]];
    smc = RunSMCABC[samples, grid, "Particles" -> 800, "Generations" -> 6,
      "Seed" -> 19470, "PriorSpec" -> spec, "ProgressFunction" -> pf];
    LactasePersistenceSpatial`Private`ExportRows[
      FileNameJoin[{root, "data", "processed",
        "origin_bridge_" <> name <> "_particles.csv"}],
      MapThread[Append[#1, "Weight" -> #2] &, {smc["Particles"], smc["Weights"]}]];
    AppendTo[rows, summarise[name, smc]];
    Print["  done in ", NumberForm[(AbsoluteTime[] - t0)/60., {5, 1}], " min; ",
      "mode ", rows[[-1, "ModeLat"]], "N ", rows[[-1, "ModeLon"]], "E; BC ",
      NumberForm[rows[[-1, "Bhattacharyya"]], {4, 3}]];
  ],
  {name, Keys[variants]}
];

(* also summarise the v2 baseline from its cache for the same table *)
base = LoadOrRunOriginSMCABC[root, samples, grid];
PrependTo[rows, summarise["v2_baseline", base]];

LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_bridge_summary.csv"}], rows];
Print["BRIDGE EXPERIMENTS DONE ", DateString[]];
Do[Print[r], {r, rows}];
