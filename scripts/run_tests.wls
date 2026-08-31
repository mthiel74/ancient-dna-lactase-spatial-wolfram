#!/usr/local/bin/wolframscript -script

root = DirectoryName[DirectoryName[$InputFileName]];
testFiles = FileNames["*.wlt", FileNameJoin[{root, "tests"}]];

If[testFiles === {},
  Print["No test files found."];
  Exit[1]
];

report = TestReport[testFiles];
Print[report];

If[TrueQ[report["AllTestsSucceeded"]],
  Exit[0],
  Exit[1]
];

