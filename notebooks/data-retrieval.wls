#!/usr/local/bin/wolframscript -script

(* Data retrieval notebook script.
   Open this file in Wolfram Desktop or run it with:
   wolframscript -file notebooks/data-retrieval.wls
*)

root = DirectoryName[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

Print["Authoritative data source:"];
Print[LactasePersistenceSpatial`$GLADAncientGenotypesURL];
Print["The workbook is the GLAD LP Ancient Genotypes 2022 data table, derived from AADR v44.3 and used for Evershed et al. 2022."];

file = LactasePersistenceSpatial`RetrieveRawData[root, False];
If[file === $Failed,
  Print["Download failed."];
  Exit[1],
  Print["Raw file: " <> file];
  Print["SHA-256: " <> LactasePersistenceSpatial`Sha256File[file]];
  Print["Manifest: " <> FileNameJoin[{root, "data", "raw", "manifest.json"}]];
  Exit[0]
];

