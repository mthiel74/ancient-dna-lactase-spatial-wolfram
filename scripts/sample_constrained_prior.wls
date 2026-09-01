#!/usr/bin/env wolframscript
(* Sample the CONSTRAINED origin prior (land restriction + dairying-lead
   support), which is the correct baseline for every origin posterior claim:
   a posterior statement only carries information to the extent it differs
   from this distribution.  No forward simulations are needed - the support
   constraints are geometric.  Writes:
     data/processed/origin_constrained_prior_draws.csv     (10,000 draws)
     data/processed/origin_constrained_prior_quantiles.csv (per parameter)
     data/processed/origin_constrained_prior_regions.csv   (region masses) *)

root = ParentDirectory[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

grid = BuildEuropeGrid[2];
spec = LactasePersistenceSpatial`Private`$OriginPriorSpec;
keys = Keys[spec];

gridPts = ({#["Latitude"], #["Longitude"] Cos[#["Latitude"] Degree]} & /@ grid);
nf = Nearest[gridPts -> "Index"];
onsets = #["DairyingOnsetBP"] & /@ grid;

validQ[p_Association] := Module[{pt, idx, d},
  pt = {p["OriginLatitude"], p["OriginLongitude"] Cos[p["OriginLatitude"] Degree]};
  idx = First[nf[pt]];
  d = EuclideanDistance[pt, gridPts[[idx]]];
  d <= 1.6 && p["OriginTimeBP"] - onsets[[idx]] - p["DairyingLeadYears"] <= 0
];

SeedRandom[271828];
draws = {}; tries = 0;
While[Length[draws] < 10000 && tries < 400000,
  Module[{v, p},
    v = RandomReal /@ Values[spec]; tries++;
    p = AssociationThread[keys, v];
    If[validQ[p], AppendTo[draws, p]]]];
Print["accepted ", Length[draws], " of ", tries,
  " (violation rate ", NumberForm[100. (1 - Length[draws]/tries), {4, 1}], "%)"];

LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_constrained_prior_draws.csv"}], draws];

qrows = Table[
  Module[{vals = #[k] & /@ draws},
    <|"Parameter" -> k, "Lower95" -> Quantile[vals, 0.025],
      "Median" -> Quantile[vals, 0.5], "Upper95" -> Quantile[vals, 0.975]|>],
  {k, keys}];
(* the sum that the notebook compares to published selection coefficients *)
sTot = (#["SelectionBase"] + #["SelectionDairying"]) & /@ draws;
AppendTo[qrows, <|"Parameter" -> "SelectionTotalDairying",
  "Lower95" -> Quantile[sTot, 0.025], "Median" -> Quantile[sTot, 0.5],
  "Upper95" -> Quantile[sTot, 0.975]|>];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_constrained_prior_quantiles.csv"}], qrows];

regions = {
  <|"Region" -> "WestOf5E", "Test" -> (#["OriginLongitude"] < 5 &)|>,
  <|"Region" -> "CentralEurope", "Test" -> (46 < #["OriginLatitude"] < 53 && 8 <= #["OriginLongitude"] < 20 &)|>,
  <|"Region" -> "Carpathian", "Test" -> (45 < #["OriginLatitude"] < 49 && 16 <= #["OriginLongitude"] < 23 &)|>,
  <|"Region" -> "Scandinavia", "Test" -> (#["OriginLatitude"] > 55 &)|>};
rrows = Map[<|"Region" -> #["Region"],
    "ConstrainedPriorMass" -> N[Count[draws, d_ /; #["Test"][d]]/Length[draws]]|> &, regions];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_constrained_prior_regions.csv"}], rrows];

Print["P(OriginTimeBP < 6000) under constrained prior: ",
  N[Count[draws, d_ /; d["OriginTimeBP"] < 6000]/Length[draws]]];
Do[Print[r], {r, rrows}];
Print["sTotal constrained prior: ", Quantile[sTot, {0.025, 0.5, 0.975}]];
