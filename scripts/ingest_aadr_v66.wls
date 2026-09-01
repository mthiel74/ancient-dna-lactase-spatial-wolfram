#!/usr/bin/env wolframscript
(* Ingest the AADR v66.p1 rs4988235 extraction (data/raw/aadr_v66_rs4988235_raw.csv,
   produced by scripts/extract_aadr_v66_rs4988235.py) into the processed-sample
   schema used throughout the package.  Depth is unavailable in the packed
   AADR genotype format and is left blank. *)

root = If[StringQ[$ScriptCommandLine] || Length[$ScriptCommandLine] < 2,
  ParentDirectory[DirectoryName[$InputFileName]], $ScriptCommandLine[[2]]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

raw = Import[FileNameJoin[{root, "data", "raw", "aadr_v66_rs4988235_raw.csv"}], "CSV"];
hdr = First[raw];
rows = AssociationThread[hdr, #] & /@ Rest[raw];
Print["raw rows: ", Length[rows]];

toNum[x_] := If[NumericQ[x], N[x], Missing["NA"]];

processed = Map[
  Module[{lat = toNum[#["Latitude"]], lon = toNum[#["Longitude"]],
      bp = toNum[#["MeanDateBP"]], called = toNum[#["CalledAlleles"]],
      derived = toNum[#["DerivedAlleles"]], region},
    region = AssignRegion[ToString[#["Country"]], lat, lon];
    <|
      "VersionID" -> #["GeneticID"], "SampleID" -> #["SampleID"],
      "Publication" -> #["Publication"], "PublicationYear" -> #["PublicationYear"],
      "DataGroupID" -> #["GroupID"], "Locality" -> #["Locality"],
      "Country" -> #["Country"], "Latitude" -> lat, "Longitude" -> lon,
      "MeanDateBP" -> bp, "DateRange" -> #["DateRange"],
      "RS4988235Depth" -> "", "RS4988235Genotype" -> #["RS4988235Genotype"],
      "CalledAlleles" -> called, "DerivedAlleles" -> derived,
      "DerivedAlleleFrequency" -> If[called > 0, N[derived/called], ""],
      "Region" -> region, "DairyingOnsetBP" -> DairyingOnsetBP[region],
      "HasCall" -> True
    |>] &,
  rows];

outFile = FileNameJoin[{root, "data", "processed", "aadr_v66_rs4988235_called_samples.csv"}];
keys = Keys[First[processed]];
Export[outFile, Prepend[Values /@ processed, keys], "CSV"];
Print["wrote ", outFile, " (", Length[processed], " samples)"];

samples = LoadProcessedSamples[root];
Print["loader picks up: ", Length[samples], " samples; regions: ",
  Sort[Tally[#["Region"] & /@ samples]]];
