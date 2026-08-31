#!/usr/local/bin/wolframscript -script

root = DirectoryName[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

getArg[name_, default_] := Module[{pos = FirstPosition[$ScriptCommandLine, name, Missing["NotFound"]]},
  If[MissingQ[pos] || pos[[1]] >= Length[$ScriptCommandLine], default, ToExpression[$ScriptCommandLine[[pos[[1]] + 1]]]]
];

simulationCount = getArg["--simulations", 200];
retainCount = getArg["--retain", 40];
cvSimulationCount = getArg["--cv-simulations", 80];

Print["Ensuring project layout..."];
LactasePersistenceSpatial`EnsureProjectLayout[root];

Print["Retrieving raw data if needed..."];
raw = LactasePersistenceSpatial`RetrieveRawData[root, False];
If[raw === $Failed, Exit[1]];

Print["Parsing and processing rs4988235 sample data..."];
processed = LactasePersistenceSpatial`WriteProcessedData[root, raw];
samples = processed["CalledSamples"];
Print["Called samples with age/location: " <> ToString[Length[samples]]];

Print["Fitting published-style regional logistic trajectories..."];
fits = LactasePersistenceSpatial`FitAllRegionalLogistics[samples];
regionalOutputs = LactasePersistenceSpatial`ExportRegionalFitOutputs[root, samples, fits];

Print["Building coarse Europe grid and running ABC spatial inference..."];
grid = LactasePersistenceSpatial`BuildEuropeGrid[];
abc = LactasePersistenceSpatial`RunABC[samples, grid,
  "SimulationCount" -> simulationCount,
  "RetainCount" -> retainCount,
  "Seed" -> 20260831
];
abcOutputs = LactasePersistenceSpatial`ExportABCOutputs[root, samples, grid, abc];

Print["Running held-out-region cross-validation..."];
cv = LactasePersistenceSpatial`RunCrossValidation[samples, grid,
  "SimulationCount" -> cvSimulationCount,
  "RetainCount" -> Min[25, retainCount],
  "Seed" -> 260831
];
cvFile = FileNameJoin[{root, "data", "processed", "cross_validation_by_region.csv"}];
LactasePersistenceSpatial`Private`ExportRows[cvFile, cv];

Print["Rendering spatial maps and calibrated uncertainty animation..."];
spatialOutputs = LactasePersistenceSpatial`ExportSpatialVisualizations[root, samples, grid, abc["Posterior"]];

summaryFile = LactasePersistenceSpatial`WriteRunSummary[
  root,
  Join[
    KeyDrop[processed, {"Samples", "CalledSamples", "BinnedFrequencies"}],
    regionalOutputs,
    KeyDrop[abcOutputs, {"PosteriorPredictive"}],
    spatialOutputs,
    <|"CrossValidationFile" -> cvFile|>
  ]
];

Print["Pipeline complete."];
Print["Summary: " <> summaryFile];
Exit[0];

