#!/usr/local/bin/wolframscript -script

root = DirectoryName[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

overwrite = MemberQ[$ScriptCommandLine, "--overwrite"];
file = LactasePersistenceSpatial`RetrieveRawData[root, overwrite];

If[file === $Failed,
  Print["Data retrieval failed."];
  Exit[1],
  Print["Raw data ready: " <> file];
  Exit[0]
];

