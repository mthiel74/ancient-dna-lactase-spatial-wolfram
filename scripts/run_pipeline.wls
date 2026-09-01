#!/usr/bin/env wolframscript

root = DirectoryName[DirectoryName[$InputFileName]];
Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];

getArg[name_, default_] := Module[{pos = FirstPosition[$ScriptCommandLine, name, Missing["NotFound"]]},
  If[MissingQ[pos] || pos[[1]] >= Length[$ScriptCommandLine], default, ToExpression[$ScriptCommandLine[[pos[[1]] + 1]]]]
];

particles = getArg["--particles", 400];
generations = getArg["--generations", 5];
posteriorDraws = getArg["--posterior-draws", 100];
cvParticles = getArg["--cv-particles", 150];
cvGenerations = getArg["--cv-generations", 4];
runSensitivity = getArg["--sensitivity", 1];

Print["Ensuring project layout..."];
LactasePersistenceSpatial`EnsureProjectLayout[root];

Print["Retrieving raw data if needed..."];
raw = LactasePersistenceSpatial`RetrieveRawData[root, False];
If[raw === $Failed, Exit[1]];

Print["Parsing and processing rs4988235 sample data..."];
processed = LactasePersistenceSpatial`WriteProcessedData[root, raw];
(* prefer the AADR v66 dataset when its processed file is present; the GLAD
   pipeline above still runs so both processed files stay reproducible *)
samples = LactasePersistenceSpatial`LoadProcessedSamples[root];
Print["Active dataset samples (AADR v66 preferred): " <> ToString[Length[samples]]];

Print["Fitting regional binomial logistic trajectories..."];
fits = LactasePersistenceSpatial`FitAllRegionalLogistics[samples];
regionalOutputs = LactasePersistenceSpatial`ExportRegionalFitOutputs[root, samples, fits];

Print["Building coarse Europe grid..."];
grid = LactasePersistenceSpatial`BuildEuropeGrid[];

Print["Running SMC-ABC (" <> ToString[particles] <> " particles, " <>
  ToString[generations] <> " generations)..."];
smcStart = AbsoluteTime[];
smc = LactasePersistenceSpatial`RunSMCABC[samples, grid,
  "Particles" -> particles,
  "Generations" -> generations,
  "Seed" -> 20260831,
  "ProgressFunction" -> Function[{g, eps, acc, ess},
    Print["  generation " <> ToString[g] <> ": epsilon " <> ToString[NumberForm[eps, {6, 4}]] <>
      ", acceptance " <> ToString[NumberForm[100. acc, {5, 1}]] <> "%, ESS " <>
      ToString[NumberForm[ess, {6, 1}]]]]
];
Print["  total simulations: " <> ToString[smc["TotalSimulations"]] <>
  " in " <> ToString[NumberForm[AbsoluteTime[] - smcStart, {7, 1}]] <> " s"];
If[TrueQ[smc["GenerationShortfall"]],
  Print["  note: a generation hit its simulation budget; tolerance schedule stopped early."]];

draws = LactasePersistenceSpatial`ResamplePosterior[smc, posteriorDraws];
smcOutputs = LactasePersistenceSpatial`ExportSMCOutputs[root, samples, grid, smc, draws];

Print["Running held-out-region cross-validation..."];
cv = LactasePersistenceSpatial`RunSMCCrossValidation[samples, grid,
  "Particles" -> cvParticles, "Generations" -> cvGenerations];
cvFile = FileNameJoin[{root, "data", "processed", "cross_validation_by_region.csv"}];
LactasePersistenceSpatial`Private`ExportRows[cvFile, cv];

Print["Running time-slice validation (train > 2500 BP, predict <= 2500 BP)..."];
timeSlice = LactasePersistenceSpatial`RunTimeSliceValidation[samples, grid,
  "Particles" -> cvParticles, "Generations" -> cvGenerations];
timeSliceFile = FileNameJoin[{root, "data", "processed", "time_slice_validation.csv"}];
LactasePersistenceSpatial`Private`ExportRows[timeSliceFile, {KeyDrop[timeSlice, "PosteriorPredictive"]}];
timeSlicePPCFile = FileNameJoin[{root, "data", "processed", "time_slice_posterior_predictive.csv"}];
LactasePersistenceSpatial`Private`ExportRows[timeSlicePPCFile, timeSlice["PosteriorPredictive"]];

sensitivityOutputs = <||>;
If[runSensitivity =!= 0,
  Print["Running prior and dairying-onset sensitivity analysis..."];
  sensitivityRows = LactasePersistenceSpatial`RunSensitivityAnalysis[samples,
    "Particles" -> cvParticles, "Generations" -> cvGenerations];
  sensitivityOutputs = LactasePersistenceSpatial`ExportSensitivityOutputs[root, sensitivityRows];
];

Print["Fitting point-source origin model (or loading cached posterior)..."];
originSmc = LactasePersistenceSpatial`LoadOrRunOriginSMCABC[root, samples, grid];
originQuantiles = LactasePersistenceSpatial`PosteriorParameterQuantiles[originSmc];
LactasePersistenceSpatial`Private`ExportRows[
  FileNameJoin[{root, "data", "processed", "origin_posterior_quantiles.csv"}], originQuantiles];
Export[FileNameJoin[{root, "figures", "generated", "origin_posterior_density.png"}],
  LactasePersistenceSpatial`OriginDensityMap[originSmc], ImageResolution -> 160];
Print["Rendering origin spread animation..."];
LactasePersistenceSpatial`ExportOriginSpread[root, samples, grid, originSmc];

Print["Rendering spatial maps and calibrated uncertainty animation..."];
spatialOutputs = LactasePersistenceSpatial`ExportSpatialVisualizations[root, samples, grid, draws];

summaryFile = LactasePersistenceSpatial`WriteRunSummary[
  root,
  Join[
    KeyDrop[processed, {"Samples", "CalledSamples", "BinnedFrequencies"}],
    regionalOutputs,
    KeyDrop[smcOutputs, {"PosteriorPredictive"}],
    spatialOutputs,
    sensitivityOutputs,
    <|
      "CrossValidationFile" -> cvFile,
      "TimeSliceFile" -> timeSliceFile,
      "InferenceNote" -> "SMC-ABC: " <> ToString[particles] <> " particles, " <>
        ToString[Length[smc["EpsilonHistory"]]] <> " tolerance generations, final epsilon " <>
        ToString[NumberForm[Last[smc["EpsilonHistory"]], {6, 4}]] <> ", final ESS " <>
        ToString[NumberForm[Last[smc["ESSHistory"]], {7, 1}]] <> ", " <>
        ToString[smc["TotalSimulations"]] <> " total simulations."
    |>
  ]
];

Print["Pipeline complete."];
Print["Summary: " <> summaryFile];
Exit[0];
