BeginPackage["LactasePersistenceSpatial`"];

$GLADAncientGenotypesURL::usage = "Public URL for the GLAD ancient lactase-persistence genotype workbook.";
$GLADAncientGenotypesFileName::usage = "Raw GLAD ancient genotype workbook filename.";
MajorRegions::usage = "MajorRegions[] returns the four regional groups used for the published regional reproduction.";
EnsureProjectLayout::usage = "EnsureProjectLayout[root] creates the expected project folders.";
Sha256File::usage = "Sha256File[file] returns a lowercase SHA-256 checksum string.";
RetrieveRawData::usage = "RetrieveRawData[root] downloads the GLAD ancient genotype workbook into data/raw and records provenance.";
NormalizeGenotype::usage = "NormalizeGenotype[call] normalizes a genotype call at rs4988235.";
DerivedAlleleCopies::usage = "DerivedAlleleCopies[genotype] counts LP-derived A/T alleles.";
CalledAlleleCount::usage = "CalledAlleleCount[genotype] returns the number of called alleles.";
AssignRegion::usage = "AssignRegion[country, latitude, longitude] assigns a sample or grid cell to a coarse analysis region.";
DairyingOnsetBP::usage = "DairyingOnsetBP[region] returns a coarse regional dairying-onset time in years BP.";
CleanSampleRow::usage = "CleanSampleRow[rowAssociation] normalizes one raw GLAD row.";
ParseGLADWorkbook::usage = "ParseGLADWorkbook[file] parses the GLAD XLSX workbook into normalized sample associations.";
WriteProcessedData::usage = "WriteProcessedData[root, rawFile] writes processed sample, binned-frequency, and provenance files.";
LoadProcessedSamples::usage = "LoadProcessedSamples[rootOrFile] loads processed samples from CSV.";
RegionalBinnedFrequencies::usage = "RegionalBinnedFrequencies[samples] computes time-binned regional allele frequencies.";
LogisticProbability::usage = "LogisticProbability[alpha, beta, bp] evaluates the regional logistic trajectory.";
FitRegionLogistic::usage = "FitRegionLogistic[samples, region] fits a binomial regional logistic trajectory.";
FitAllRegionalLogistics::usage = "FitAllRegionalLogistics[samples] fits all major regional trajectories.";
ExportRegionalFitOutputs::usage = "ExportRegionalFitOutputs[root, samples, fits] writes regional fit tables and figures.";
BuildEuropeGrid::usage = "BuildEuropeGrid[] returns a coarse European grid with regional annotations.";
BuildNeighborList::usage = "BuildNeighborList[grid] returns adjacency lists for the grid.";
SimulateSpatialTrajectory::usage = "SimulateSpatialTrajectory[parameters, grid] simulates spatial LP frequency through time.";
RunABC::usage = "RunABC[samples, grid] runs rejection ABC for the spatial model.";
PosteriorPredictiveRegional::usage = "PosteriorPredictiveRegional[posterior, grid, observedSummaries] computes predictive intervals.";
ExportABCOutputs::usage = "ExportABCOutputs[root, samples, grid, abc] writes ABC posterior, PPC, and parameter figures.";
RunCrossValidation::usage = "RunCrossValidation[samples, grid] runs held-out-region posterior predictive checks.";
ExportSpatialVisualizations::usage = "ExportSpatialVisualizations[root, samples, grid, posterior] writes spatial maps and animation.";
OrdinaryKrigingPredictor::usage = "OrdinaryKrigingPredictor[coords, values] returns an ordinary-kriging predictor over projected coordinates.";
ICloudCodexDirectory::usage = "ICloudCodexDirectory[] returns Marco's iCloud Codex drop-zone directory.";
WriteRunSummary::usage = "WriteRunSummary[root, outputs] writes a Markdown run summary.";

RunSMCABC::usage = "RunSMCABC[samples, grid] runs sequential Monte Carlo ABC with adaptive tolerances, Gaussian perturbation kernels, importance weights, and spatial-gradient summary statistics.";
ResamplePosterior::usage = "ResamplePosterior[smc, n] draws n equally weighted posterior parameter sets from a weighted SMC result.";
PosteriorCellStats::usage = "PosteriorCellStats[posterior, grid, times] returns per-cell posterior mean and 95% band of the simulated allele frequency at each requested time BP.";
PosteriorParameterQuantiles::usage = "PosteriorParameterQuantiles[smc] returns weighted posterior quantiles for every model parameter.";
ExportSMCOutputs::usage = "ExportSMCOutputs[root, samples, grid, smc, draws] writes SMC posterior tables, diagnostics, and figures.";
RunSMCCrossValidation::usage = "RunSMCCrossValidation[samples, grid] reruns SMC-ABC with each analysis region held out and scores held-out predictions.";
RunTimeSliceValidation::usage = "RunTimeSliceValidation[samples, grid] trains on older samples only and predicts the held-out most recent time bins.";
RunSensitivityAnalysis::usage = "RunSensitivityAnalysis[samples] reruns SMC-ABC under alternative priors and dairying-onset shifts.";
ExportSensitivityOutputs::usage = "ExportSensitivityOutputs[root, rows] writes the sensitivity quantile table and figure.";
WilsonInterval::usage = "WilsonInterval[derived, called] returns the 95% Wilson score interval for a binomial proportion.";
ExtendedObservedData::usage = "ExtendedObservedData[samples, grid] builds binned and spatial-gradient summary data for ABC distances.";
ExtendedDistance::usage = "ExtendedDistance[obsData, trajectory, grid] evaluates the weighted summary distance including spatial-gradient terms.";
BuildObservationIndex::usage = "BuildObservationIndex[samples, grid] links called samples to grid cells and times for like-for-like summaries.";

ExportHeroAnimation::usage = "ExportHeroAnimation[root, samples, grid, posterior] renders the single-panel cinematic hero time-lapse with year badge, uncertainty inset, and progress bar, exporting MP4 and GIF.";
LoadOrRunSMCABC::usage = "LoadOrRunSMCABC[root, samples, grid] reloads the stored SMC posterior from data/processed if present, otherwise runs RunSMCABC.";

LogisticExplorer::usage = "LogisticExplorer[samples] returns a self-contained Manipulate: regional binned data with Wilson intervals against an adjustable logistic trajectory.";
DairyingCovariateExplorer::usage = "DairyingCovariateExplorer[] returns a Manipulate exploring the smooth dairying-onset covariate D(t).";
SpatialTimeExplorer::usage = "SpatialTimeExplorer[samples, grid, posterior] returns a Manipulate stepping through posterior-mean maps with embedded frames.";

RunOriginSMCABC::usage = "RunOriginSMCABC[samples, grid] fits the point-source origin model (origin latitude, longitude, time, injection frequency, plus selection and migration) with SMC-ABC.";
LoadOrRunOriginSMCABC::usage = "LoadOrRunOriginSMCABC[root, samples, grid] reloads the stored origin-model posterior or fits and stores it.";
OriginDensityMap::usage = "OriginDensityMap[smc] renders the Itan-style posterior density map of the allele's origin with the weighted median starred.";
ExportOriginSpread::usage = "ExportOriginSpread[root, samples, grid, smc] renders the forward-simulated spread animation from the fitted origin (MP4 + GIF).";

OriginFitSurface::usage = "OriginFitSurface[samples, grid, smc] returns the ABC distance obtained by placing the point source in each land cell with all other parameters at their posterior medians.";
OriginFitSurfaceMap::usage = "OriginFitSurfaceMap[samples, grid, smc] maps the conditional origin fit-quality scan (yellow/red where the data prefer the origin).";

Begin["`Private`"];

$GLADAncientGenotypesURL =
  "https://www.ucl.ac.uk/biosciences/sites/biosciences/files/glad_adna_15-8-22.xlsx";

$GLADAncientGenotypesFileName = "glad_adna_15-8-22.xlsx";

$AnalysisRegions = {"British Isles", "Rhine-Danube", "Mediterranean", "Baltic"};

MajorRegions[] := $AnalysisRegions;

ValueMissingQ[x_] := MissingQ[x] || x === Null || x === "" || x === Indeterminate;

CleanString[x_] := Module[{s},
  Which[
    ValueMissingQ[x], "",
    StringQ[x], StringTrim[x],
    True,
      s = ToString[x, InputForm];
      StringTrim[StringReplace[s, {StartOfString ~~ "\"" -> "", "\"" ~~ EndOfString -> ""}]]
  ]
];

NormalizeHeader[x_] := StringReplace[
  ToLowerCase[CleanString[x]],
  {" " -> "_", "-" -> "_", "." -> "_", "/" -> "_", "(" -> "", ")" -> "", ":" -> ""}
];

ParseNumber[x_] := Module[{s = CleanString[x], y},
  Which[
    ValueMissingQ[x] || s == "", Missing["NotAvailable"],
    NumericQ[x], N[x],
    True,
      y = Quiet@Check[ToExpression[StringReplace[s, "," -> "."]], $Failed];
      If[NumericQ[y], N[y], Missing["NotAvailable"]]
  ]
];

NumericValueQ[x_] := NumericQ[x] && x =!= Indeterminate;

NormalizeCoordinate[x_, limit_] := Module[{y = x, k = 0},
  If[! NumericValueQ[y], Return[y]];
  y = N[y];
  If[Abs[y] >= 1000, y = y/1000.0];
  While[Abs[y] > limit && k < 8,
    y = y/10.0;
    k++;
  ];
  y
];

NormalizeLatitude[x_] := NormalizeCoordinate[x, 90];
NormalizeLongitude[x_] := NormalizeCoordinate[x, 180];

EnsureProjectLayout[root_String] := Module[
  {dirs},
  dirs = FileNameJoin[{root, #}] & /@
    {"data/raw", "data/processed", "notebooks", "src", "tests", "tests/fixtures",
     "figures", "figures/generated", "docs", "scripts", ".github/workflows"};
  Scan[If[! DirectoryQ[#], CreateDirectory[#, CreateIntermediateDirectories -> True]] &, dirs];
  dirs
];

ICloudCodexDirectory[] := FileNameJoin[
  {$HomeDirectory, "Library", "Mobile Documents", "com~apple~CloudDocs", "Documents", "Codex"}
];

CopyVersionToICloud[sourceFile_String, label_String] := Module[
  {dir = ICloudCodexDirectory[], extension, stamp, base, destination, version = 1},
  If[! FileExistsQ[sourceFile], Return[Missing["SourceMissing", sourceFile]]];
  If[! DirectoryQ[dir], CreateDirectory[dir, CreateIntermediateDirectories -> True]];
  extension = FileExtension[sourceFile];
  stamp = DateString[Now, {"Year", "Month", "Day", "_", "Hour", "Minute", "Second"}];
  base = stamp <> "_" <> label;
  destination = FileNameJoin[{dir, base <> "." <> extension}];
  While[FileExistsQ[destination],
    version++;
    destination = FileNameJoin[{dir, base <> "_" <> ToString[version] <> "." <> extension}]
  ];
  CopyFile[sourceFile, destination];
  destination
];

FindFFmpeg[] := SelectFirst[
  {"/opt/homebrew/bin/ffmpeg", "/usr/local/bin/ffmpeg", "/usr/bin/ffmpeg"},
  FileExistsQ,
  Missing["NotFound"]
];

ExportMP4FromFrames[mp4File_String, frames_List, secondsPerFrame_: 0.7] := Module[
  {ffmpeg, frameDir, exitCode, fallback},
  ffmpeg = FindFFmpeg[];
  If[! MissingQ[ffmpeg],
    If[FileExistsQ[mp4File], DeleteFile[mp4File]];
    frameDir = CreateDirectory[];
    MapIndexed[
      Export[FileNameJoin[{frameDir, "frame_" <> IntegerString[First[#2], 10, 4] <> ".png"}], #1] &,
      frames
    ];
    exitCode = Quiet@RunProcess[
      {ffmpeg, "-y",
       "-framerate", ToString[N[1/secondsPerFrame]],
       "-i", FileNameJoin[{frameDir, "frame_%04d.png"}],
       "-vf", "scale=trunc(iw/2)*2:trunc(ih/2)*2,fps=30",
       "-c:v", "libx264", "-crf", "18", "-preset", "medium",
       "-pix_fmt", "yuv420p", "-movflags", "faststart",
       mp4File},
      "ExitCode"
    ];
    Quiet@Check[DeleteDirectory[frameDir, DeleteContents -> True], Null];
    If[exitCode === 0 && FileExistsQ[mp4File], Return[mp4File]]
  ];
  fallback = Quiet@Check[Export[mp4File, frames, "FrameRate" -> 1], $Failed];
  If[fallback === $Failed || ! FileExistsQ[mp4File],
    Missing["MP4ExportFailed", mp4File],
    mp4File
  ]
];

Sha256File[file_String] := ToLowerCase[IntegerString[FileHash[file, "SHA256"], 16, 64]];

FileSizeBytes[file_String] := Quiet@Check[QuantityMagnitude[FileByteCount[file]], Missing["NotAvailable"]];

RetrieveRawData[root_String, overwrite_: False] := Module[
  {rawDir, file, manifest, downloaded = False, checksum, result},
  EnsureProjectLayout[root];
  rawDir = FileNameJoin[{root, "data", "raw"}];
  file = FileNameJoin[{rawDir, $GLADAncientGenotypesFileName}];
  manifest = FileNameJoin[{rawDir, "manifest.json"}];

  If[FileExistsQ[file] && ! TrueQ[overwrite],
    Null,
    If[FileExistsQ[file], DeleteFile[file]];
    result = URLDownload[$GLADAncientGenotypesURL, file];
    If[result === $Failed || ! FileExistsQ[file],
      Message[RetrieveRawData::download, $GLADAncientGenotypesURL];
      Return[$Failed]
    ];
    downloaded = True;
  ];

  checksum = Sha256File[file];
  Quiet@Check[SetPermissions[file, "ReadOnly"], Null];
  If[$OperatingSystem =!= "Windows",
    Quiet@Check[RunProcess[{"/bin/chmod", "444", file}], Null]
  ];
  Export[
    manifest,
    <|
      "dataset" -> "GLAD LP Ancient Genotypes 2022",
      "description" -> "Ancient rs4988235 genotype workbook derived from AADR v44.3 and used for Evershed et al. 2022.",
      "source_url" -> $GLADAncientGenotypesURL,
      "downloaded_this_run" -> downloaded,
      "retrieved_at" -> DateString[Now, "ISODateTime"],
      "raw_file" -> FileNameTake[file],
      "sha256" -> checksum,
      "bytes" -> FileSizeBytes[file],
      "read_only" -> True,
      "primary_reference" -> "Evershed et al. 2022, Nature, Dairying, diseases and the evolution of lactase persistence in Europe",
      "aadr_reference" -> "Allen Ancient DNA Resource v44.3"
    |>,
    "JSON"
  ];
  file
];

RetrieveRawData::download = "Could not download raw data from `1`.";

NormalizeGenotype[x_] := Module[{s = ToUpperCase[StringReplace[CleanString[x], WhitespaceCharacter .. -> ""]]},
  If[s == "" || s == "NA" || s == "NAN" || s == "NULL", Missing["NotCalled"], s]
];

DerivedAlleleCopies[gt_] := Module[{g = NormalizeGenotype[gt]},
  If[MissingQ[g], Missing["NotCalled"], Count[Characters[g], "A" | "T"]]
];

CalledAlleleCount[gt_] := Module[{g = NormalizeGenotype[gt]},
  If[MissingQ[g], 0, Count[Characters[g], "A" | "T" | "G" | "C"]]
];

GenotypeFrequency[gt_] := Module[{n = CalledAlleleCount[gt], d = DerivedAlleleCopies[gt]},
  If[n > 0 && NumericQ[d], N[d/n], Missing["NotCalled"]]
];

AssignRegion[country_, lat_, lon_] := Module[
  {c = ToLowerCase[CleanString[country]], la = lat, lo = lon},
  If[! NumericValueQ[la] || ! NumericValueQ[lo], Return["Unplaced"]];
  Which[
    MemberQ[{"united kingdom", "england", "scotland", "wales", "ireland", "northern ireland", "isle of man", "jersey", "guernsey"}, c] ||
      (-11 <= lo <= 2 && 49 <= la <= 60), "British Isles",

    MemberQ[{"estonia", "latvia", "lithuania", "finland", "sweden", "denmark", "poland"}, c] && la >= 53 ||
      (10 <= lo <= 32 && 53 <= la <= 62), "Baltic",

    MemberQ[{"germany", "netherlands", "belgium", "luxembourg", "switzerland", "austria", "czech republic", "czechia", "slovakia", "hungary", "romania", "slovenia"}, c] ||
      (-1 <= lo <= 23 && 45 <= la <= 53.5), "Rhine-Danube",

    MemberQ[{"spain", "portugal", "italy", "greece", "croatia", "bosnia and herzegovina", "serbia", "montenegro", "albania", "north macedonia", "malta", "cyprus"}, c] ||
      (-10 <= lo <= 30 && 35 <= la < 45), "Mediterranean",

    -12 <= lo <= 35 && 35 <= la <= 62, "Other Europe",
    True, "Outside Europe"
  ]
];

$DairyingAnchors = {
  {40., 15., 8200.},
  {38., -4., 7700.},
  {46., 27., 8000.},
  {49., 10., 7600.},
  {53., -2., 6100.},
  {57., 22., 5600.}
};

SmoothDairyingOnsetBP[lat_?NumericQ, lon_?NumericQ] := Module[{d2, w},
  d2 = Max[(lat - #[[1]])^2 + ((lon - #[[2]]) Cos[lat Degree])^2, 0.25] & /@ $DairyingAnchors;
  w = 1/d2;
  Total[w $DairyingAnchors[[All, 3]]]/Total[w]
];

DairyingOnsetBP[region_String] := Switch[region,
  "Mediterranean", 8200,
  "Rhine-Danube", 7600,
  "British Isles", 6100,
  "Baltic", 5600,
  "Other Europe", 6500,
  _, 6500
];

CleanSampleRow[row_Association] := Module[
  {gt, called, derived, lat, lon, bp, depth, region},
  gt = NormalizeGenotype[Lookup[row, "rs4988235_most_likely_genotype", ""]];
  called = CalledAlleleCount[gt];
  derived = DerivedAlleleCopies[gt];
  lat = NormalizeLatitude[ParseNumber[Lookup[row, "lat", ""]]];
  lon = NormalizeLongitude[ParseNumber[Lookup[row, "long", ""]]];
  bp = ParseNumber[Lookup[row, "mean_date", ""]];
  depth = ParseNumber[Lookup[row, "rs4988235_depth", ""]];
  region = AssignRegion[Lookup[row, "country", ""], lat, lon];
  <|
    "VersionID" -> CleanString[Lookup[row, "version_id", ""]],
    "SampleID" -> CleanString[Lookup[row, "master_id", ""]],
    "Publication" -> CleanString[Lookup[row, "publication", ""]],
    "PublicationYear" -> ParseNumber[Lookup[row, "publication_year", ""]],
    "DataGroupID" -> CleanString[Lookup[row, "dr_group_id", ""]],
    "Locality" -> CleanString[Lookup[row, "locality", ""]],
    "Country" -> CleanString[Lookup[row, "country", ""]],
    "Latitude" -> lat,
    "Longitude" -> lon,
    "MeanDateBP" -> bp,
    "DateRange" -> CleanString[Lookup[row, "date_range", ""]],
    "RS4988235Depth" -> depth,
    "RS4988235Genotype" -> If[MissingQ[gt], "", gt],
    "CalledAlleles" -> called,
    "DerivedAlleles" -> If[MissingQ[derived], 0, derived],
    "DerivedAlleleFrequency" -> If[called > 0 && NumericQ[derived], N[derived/called], Missing["NotCalled"]],
    "Region" -> region,
    "DairyingOnsetBP" -> DairyingOnsetBP[region],
    "HasCall" -> called > 0
  |>
];

ParseGLADWorkbook[file_String] := Module[
  {data, headers, rows},
  data = Import[file, {"Data", 1}];
  If[! ListQ[data] || Length[data] < 2, Return[{}]];
  headers = NormalizeHeader /@ First[data];
  rows = AssociationThread[headers, #] & /@ Rest[data];
  CleanSampleRow /@ rows
];

ExportRows[file_String, rows_List] := Module[{headers, table},
  If[rows === {}, Return[$Failed]];
  headers = Keys[First[rows]];
  table = Prepend[(Replace[Lookup[#, headers], m_Missing :> ""] & /@ rows), headers];
  Export[file, table, "CSV"]
];

BinStartBP[bp_, binSize_] := binSize Floor[N[bp]/binSize];
BinMidBP[bp_, binSize_] := BinStartBP[bp, binSize] + binSize/2;

RegionalBinnedFrequencies[samples_List, binSize_: 1000] := Module[
  {called, groups},
  called = Select[
    samples,
    TrueQ[#["HasCall"]] && NumericValueQ[#["MeanDateBP"]] &&
      MemberQ[Append[$AnalysisRegions, "Other Europe"], #["Region"]] &
  ];
  groups = GatherBy[called, {#["Region"], BinStartBP[#["MeanDateBP"], binSize]} &];
  SortBy[
    Map[
      With[
        {g = #, key = {#[[1, "Region"]], BinStartBP[#[[1, "MeanDateBP"]], binSize]}},
        <|
          "Region" -> key[[1]],
          "TimeBinStartBP" -> key[[2]],
          "TimeBinMidBP" -> key[[2]] + binSize/2,
          "CalledAlleles" -> Total[g[[All, "CalledAlleles"]]],
          "DerivedAlleles" -> Total[g[[All, "DerivedAlleles"]]],
          "Frequency" -> N[Total[g[[All, "DerivedAlleles"]]]/Total[g[[All, "CalledAlleles"]]]],
          "SampleCount" -> Length[g]
        |>
      ] &,
      groups
    ],
    {#Region &, #TimeBinMidBP &}
  ]
];

WriteProcessedData[root_String, rawFile_: Automatic] := Module[
  {raw, processedDir, samples, called, binned, samplesFile, calledFile, binnedFile, provenanceFile},
  EnsureProjectLayout[root];
  raw = If[rawFile === Automatic, FileNameJoin[{root, "data", "raw", $GLADAncientGenotypesFileName}], rawFile];
  processedDir = FileNameJoin[{root, "data", "processed"}];
  samples = ParseGLADWorkbook[raw];
  called = Select[samples, TrueQ[#["HasCall"]] && NumericValueQ[#["Latitude"]] &&
      NumericValueQ[#["Longitude"]] && NumericValueQ[#["MeanDateBP"]] &];
  binned = RegionalBinnedFrequencies[called];
  samplesFile = FileNameJoin[{processedDir, "glad_rs4988235_samples.csv"}];
  calledFile = FileNameJoin[{processedDir, "glad_rs4988235_called_samples.csv"}];
  binnedFile = FileNameJoin[{processedDir, "regional_time_binned_frequencies.csv"}];
  provenanceFile = FileNameJoin[{processedDir, "provenance.json"}];
  ExportRows[samplesFile, samples];
  ExportRows[calledFile, called];
  ExportRows[binnedFile, binned];
  Export[
    provenanceFile,
    <|
      "created_at" -> DateString[Now, "ISODateTime"],
      "raw_file" -> FileNameTake[raw],
      "raw_sha256" -> Sha256File[raw],
      "parser" -> "LactasePersistenceSpatial` ParseGLADWorkbook",
      "source_url" -> $GLADAncientGenotypesURL,
      "total_rows" -> Length[samples],
      "called_rows_with_age_location" -> Length[called],
      "time_bin_years" -> 1000,
      "region_assignment" -> "Coarse country and latitude/longitude heuristic matching Evershed et al. four-region framing."
    |>,
    "JSON"
  ];
  <|
    "SamplesFile" -> samplesFile,
    "CalledSamplesFile" -> calledFile,
    "BinnedFrequenciesFile" -> binnedFile,
    "ProvenanceFile" -> provenanceFile,
    "Samples" -> samples,
    "CalledSamples" -> called,
    "BinnedFrequencies" -> binned
  |>
];

RestoreSampleTypes[row_Association] := Module[{numeric, bool},
  numeric = {"PublicationYear", "Latitude", "Longitude", "MeanDateBP", "RS4988235Depth",
    "CalledAlleles", "DerivedAlleles", "DerivedAlleleFrequency", "DairyingOnsetBP"};
  bool = {"HasCall"};
  Join[
    KeyDrop[row, Join[numeric, bool]],
    AssociationThread[numeric, ParseNumber /@ Lookup[row, numeric, ""]],
    AssociationThread[bool, MemberQ[{"True", "true", "1", True}, #] & /@ Lookup[row, bool, ""]]
  ]
];

LoadProcessedSamples[rootOrFile_String] := Module[{file, data, headers},
  file = If[DirectoryQ[rootOrFile],
    FileNameJoin[{rootOrFile, "data", "processed", "glad_rs4988235_called_samples.csv"}],
    rootOrFile
  ];
  data = Import[file, "CSV"];
  If[! ListQ[data] || Length[data] < 2, Return[{}]];
  headers = First[data];
  RestoreSampleTypes /@ (AssociationThread[headers, #] & /@ Rest[data])
];

BoundedProbability[p_] := Min[1 - 10^-9, Max[10^-9, N[p]]];

LogisticProbability[alpha_?NumericQ, beta_?NumericQ, bp_?NumericQ] :=
  BoundedProbability[1/(1 + Exp[-(alpha + beta ((10000 - bp)/1000.0))])];

FitRegionLogistic[samples_List, region_String] := Module[
  {data, objective, sol, alpha, beta, ll, ses, atBound},
  data = Select[samples, #["Region"] == region && TrueQ[#["HasCall"]] &&
      NumericValueQ[#["MeanDateBP"]] && #["CalledAlleles"] > 0 &];
  If[Length[data] < 4 || Total[data[[All, "CalledAlleles"]]] < 8,
    Return[<|"Region" -> region, "Status" -> "InsufficientData", "SampleCount" -> Length[data]|>]
  ];
  objective[a_?NumericQ, b_?NumericQ] := Total[
    With[{p = LogisticProbability[a, b, #["MeanDateBP"]]},
      #["DerivedAlleles"] Log[p] + (#["CalledAlleles"] - #["DerivedAlleles"]) Log[1 - p]
    ] & /@ data
  ];
  sol = Quiet@Check[
    NMaximize[{objective[a, b], -24 <= a <= 2 && -2 <= b <= 8}, {a, b},
      Method -> {"NelderMead", "RandomSeed" -> 123}],
    $Failed
  ];
  If[sol === $Failed,
    <|"Region" -> region, "Status" -> "Failed", "SampleCount" -> Length[data]|>,
    ll = sol[[1]];
    alpha = a /. sol[[2]];
    beta = b /. sol[[2]];
    ses = Quiet@Check[
      LogisticFitStandardErrors[objective, alpha, beta],
      {Missing["NotAvailable"], Missing["NotAvailable"]}
    ];
    atBound = Abs[alpha - (-24)] < 0.01 || Abs[alpha - 2] < 0.01 ||
      Abs[beta - (-2)] < 0.01 || Abs[beta - 8] < 0.01;
    <|
      "Region" -> region,
      "Status" -> "OK",
      "SampleCount" -> Length[data],
      "CalledAlleles" -> Total[data[[All, "CalledAlleles"]]],
      "DerivedAlleles" -> Total[data[[All, "DerivedAlleles"]]],
      "Alpha" -> N[alpha],
      "BetaPerKyrTowardPresent" -> N[beta],
      "SelectionPerGenerationApprox" -> N[beta*28/1000],
      "LogLikelihood" -> N[ll],
      "AlphaSE" -> ses[[1]],
      "BetaSE" -> ses[[2]],
      "AtParameterBound" -> atBound,
      "FrequencyAt8000BP" -> LogisticProbability[alpha, beta, 8000],
      "FrequencyAt3000BP" -> LogisticProbability[alpha, beta, 3000],
      "FrequencyAtPresent" -> LogisticProbability[alpha, beta, 0]
    |>
  ]
];

FitAllRegionalLogistics[samples_List] := FitRegionLogistic[samples, #] & /@ $AnalysisRegions;

ExportRegionalFitOutputs[root_String, samples_List, fits_List] := Module[
  {processedDir, figDir, binned, fitFile, figFile, plots, fitAssoc, regions},
  processedDir = FileNameJoin[{root, "data", "processed"}];
  figDir = FileNameJoin[{root, "figures", "generated"}];
  fitFile = FileNameJoin[{processedDir, "regional_logistic_fits.csv"}];
  figFile = FileNameJoin[{figDir, "regional_logistic_reproduction.png"}];
  ExportRows[fitFile, fits];
  binned = Select[RegionalBinnedFrequencies[samples], #CalledAlleles >= 2 && MemberQ[$AnalysisRegions, #Region] &];
  fitAssoc = AssociationThread[fits[[All, "Region"]], fits];
  regions = $AnalysisRegions;
  plots = Table[
    Module[{sub, fit, curve, intervals, points, color},
      sub = Select[binned, #Region == region &];
      color = Lookup[$RegionColors, region, Black];
      intervals = Table[
        Module[{ci = WilsonInterval[b["DerivedAlleles"], b["CalledAlleles"]]},
          {Directive[color, Opacity[0.55], AbsoluteThickness[1.4]],
           Line[{{b["TimeBinMidBP"], ci[[1]]}, {b["TimeBinMidBP"], ci[[2]]}}]}
        ],
        {b, sub}
      ];
      points = Table[
        {Directive[color, Opacity[0.95]],
         PointSize[0.010 + 0.012 Sqrt[b["CalledAlleles"]/250.]],
         Point[{b["TimeBinMidBP"], b["Frequency"]}]},
        {b, sub}
      ];
      fit = Lookup[fitAssoc, region, <|"Status" -> "Missing"|>];
      curve = If[Lookup[fit, "Status", ""] == "OK",
        Plot[
          LogisticProbability[fit["Alpha"], fit["BetaPerKyrTowardPresent"], bp],
          {bp, 0, 10000},
          PlotStyle -> Directive[GrayLevel[0.25], AbsoluteThickness[1.8]],
          PlotRange -> {0, 1}
        ],
        Graphics[{}]
      ];
      Show[
        Graphics[
          Join[intervals, points],
          Frame -> True, Axes -> False,
          AspectRatio -> 1/GoldenRatio,
          PlotRange -> {{0, 10000}, {-0.03, 1}},
          FrameLabel -> {"years BP", "LP-derived allele frequency"},
          PlotLabel -> Style[
            region <> If[TrueQ[Lookup[fit, "AtParameterBound", False]], " (fit at bound)", ""], 12],
          LabelStyle -> Directive[Black, 10.5],
          ImageSize -> 440
        ],
        curve
      ]
    ],
    {region, regions}
  ];
  Export[figFile, GraphicsGrid[Partition[plots, 2], Spacings -> {0.5, 0.8}], ImageResolution -> 160];
  <|"RegionalFitFile" -> fitFile, "RegionalFigure" -> figFile|>
];

FilterLandCells[cells_List] := Module[{elevations},
  elevations = Quiet@Check[
    QuantityMagnitude[GeoElevationData[GeoPosition[{#["Latitude"], #["Longitude"]} & /@ cells]]],
    ConstantArray[1., Length[cells]]
  ];
  If[! ListQ[elevations] || Length[elevations] =!= Length[cells], Return[cells]];
  MapIndexed[
    Append[#1, "CellID" -> First[#2]] &,
    Pick[cells, NumericValueQ[#] && # > -10 & /@ elevations]
  ]
];

BuildEuropeGrid[step_: 2, onsetShiftYears_: 0] := Module[{cells, id = 0},
  cells = Flatten[
    Table[
      Module[{region = AssignRegion["", lat, lon]},
        If[MemberQ[Append[$AnalysisRegions, "Other Europe"], region],
          id++;
          <|
            "CellID" -> id,
            "Latitude" -> N[lat],
            "Longitude" -> N[lon],
            "Region" -> region,
            "DairyingOnsetBP" -> SmoothDairyingOnsetBP[N[lat], N[lon]] + onsetShiftYears,
            "StepDegrees" -> step
          |>,
          Nothing
        ]
      ],
      {lat, 36, 62, step},
      {lon, -10, 34, step}
    ],
    1
  ];
  FilterLandCells[cells]
];

BuildNeighborList[grid_List, step_: 4] := Module[{positions, index},
  positions = ({#["Latitude"], #["Longitude"]} & /@ grid);
  index = AssociationThread[positions, Range[Length[positions]]];
  Table[
    DeleteMissing[
      Lookup[index, ({grid[[i, "Latitude"]] + #[[1]], grid[[i, "Longitude"]] + #[[2]]} & /@
          {{step, 0}, {-step, 0}, {0, step}, {0, -step},
           {step, step}, {step, -step}, {-step, step}, {-step, -step}}), Missing["NoNeighbor"]]
    ],
    {i, Length[grid]}
  ]
];

DairyCovariate[onsetBP_?NumericQ, bp_?NumericQ, scale_: 350] := 1/(1 + Exp[(bp - onsetBP)/scale]);

RegionSelectionMultiplier[params_Association, region_String] := Switch[region,
  "British Isles", Lookup[params, "SelectionMultiplierBritishIsles", 1.0],
  "Rhine-Danube", Lookup[params, "SelectionMultiplierRhineDanube", 1.0],
  "Mediterranean", Lookup[params, "SelectionMultiplierMediterranean", 1.0],
  "Baltic", Lookup[params, "SelectionMultiplierBaltic", 1.0],
  _, 1.0
];

InitialFrequencies[grid_List, params_Association] := Module[
  {p0, latGrad, lonGrad},
  p0 = Lookup[params, "InitialFrequency", 0.004];
  latGrad = Lookup[params, "InitialLatitudeGradient", 0.0];
  lonGrad = Lookup[params, "InitialLongitudeGradient", 0.0];
  Clip[
    p0 + latGrad ((grid[[All, "Latitude"]] - 50)/20) + lonGrad ((grid[[All, "Longitude"]] - 10)/35),
    {0.00001, 0.25}
  ]
];

SpatialStep[freqs_List, grid_List, neighbors_List, params_Association, bp_?NumericQ, dtYears_?NumericQ] := Module[
  {gens, sBase, sDairy, migration, dairy, multipliers, growth, grown, alphaMix, mixed},
  gens = dtYears/28.0;
  sBase = Lookup[params, "SelectionBase", 0.0];
  sDairy = Lookup[params, "SelectionDairying", 0.02];
  migration = Lookup[params, "Migration", 0.002];
  dairy = DairyCovariate[#, bp] & /@ grid[[All, "DairyingOnsetBP"]];
  multipliers = RegionSelectionMultiplier[params, #] & /@ grid[[All, "Region"]];
  (* exact per-step logistic growth: stable and accurate for any s*gens *)
  growth = Exp[gens (sBase + sDairy dairy multipliers)];
  grown = freqs growth/(1. + freqs (growth - 1.));
  (* exponential mixing toward the neighbour mean: stable for any m*gens *)
  alphaMix = 1. - Exp[-gens migration];
  mixed = Table[
    If[neighbors[[i]] === {}, grown[[i]],
      grown[[i]] + alphaMix (Mean[grown[[neighbors[[i]]]]] - grown[[i]])],
    {i, Length[grown]}
  ];
  Clip[mixed, {0., 0.999999}]
];

Options[SimulateSpatialTrajectory] = {"StartBP" -> 10000, "EndBP" -> 0, "TimeStepYears" -> 250};

SimulateSpatialTrajectory[params_Association, grid_List, OptionsPattern[]] := Module[
  {start, end, dt, times, neighbors, freqs, snapshots, originMode, originBP,
   originCell, injectFreq, injected},
  start = OptionValue["StartBP"];
  end = OptionValue["EndBP"];
  dt = OptionValue["TimeStepYears"];
  times = Range[start, end, -dt];
  neighbors = BuildNeighborList[grid, Lookup[First[grid], "StepDegrees", 4]];
  originMode = KeyExistsQ[params, "OriginTimeBP"];
  If[originMode,
    originBP = params["OriginTimeBP"];
    injectFreq = Lookup[params, "InjectFrequency", 0.02];
    originCell = First @ Nearest[
      ({#["Latitude"], #["Longitude"]} & /@ grid) -> "Index",
      {params["OriginLatitude"], params["OriginLongitude"]}];
    freqs = ConstantArray[0., Length[grid]];
    injected = False;
    If[times[[1]] <= originBP,
      freqs[[originCell]] = injectFreq; injected = True],
    freqs = InitialFrequencies[grid, params]
  ];
  snapshots = {freqs};
  Do[
    freqs = SpatialStep[freqs, grid, neighbors, params, times[[k]], dt];
    If[originMode && ! injected && times[[k + 1]] <= originBP,
      freqs[[originCell]] = Max[freqs[[originCell]], injectFreq];
      injected = True];
    AppendTo[snapshots, freqs],
    {k, 1, Length[times] - 1}
  ];
  <|"TimesBP" -> times, "Frequencies" -> snapshots|>
];

FrequenciesAt[trajectory_Association, bp_?NumericQ] := Module[{times, idx},
  times = trajectory["TimesBP"];
  idx = First@Ordering[Abs[times - bp], 1];
  trajectory["Frequencies"][[idx]]
];

RegionMeanFrequency[grid_List, freqs_List, region_String] := Module[{idx},
  idx = Flatten@Position[grid[[All, "Region"]], region];
  If[idx === {}, Missing["NoCells"], Mean[freqs[[idx]]]]
];

ObservedSummaries[samples_List, binSize_: 1000] :=
  Select[RegionalBinnedFrequencies[samples, binSize],
    MemberQ[$AnalysisRegions, #Region] && #CalledAlleles >= 2 &
  ];

PredictedSummariesFromTrajectory[trajectory_Association, grid_List, observed_List] := Module[
  {freqs},
  Map[
    (freqs = FrequenciesAt[trajectory, #["TimeBinMidBP"]];
      <|"Region" -> #["Region"], "TimeBinMidBP" -> #["TimeBinMidBP"],
        "PredictedFrequency" -> RegionMeanFrequency[grid, freqs, #["Region"]]|>) &,
    observed
  ]
];

SummaryDistance[observed_List, predicted_List] := Module[{weights, diffs},
  weights = observed[[All, "CalledAlleles"]];
  diffs = observed[[All, "Frequency"]] - predicted[[All, "PredictedFrequency"]];
  Sqrt[Total[weights diffs^2]/Total[weights]]
];

$PriorSpec = <|
  "Log10InitialFrequency" -> {-4.2, -1.5},
  "InitialLatitudeGradient" -> {-0.008, 0.012},
  "InitialLongitudeGradient" -> {-0.008, 0.008},
  "SelectionBase" -> {0.0, 0.015},
  "SelectionDairying" -> {0.0, 0.06},
  "Migration" -> {0.0, 0.015},
  "SelectionMultiplierBritishIsles" -> {0.8, 2.2},
  "SelectionMultiplierRhineDanube" -> {0.6, 1.8},
  "SelectionMultiplierMediterranean" -> {0.4, 1.4},
  "SelectionMultiplierBaltic" -> {0.8, 2.4}
|>;

PriorVectorSample[spec_: Automatic] := Module[{s},
  s = If[spec === Automatic, $PriorSpec, spec];
  RandomReal /@ Values[s]
];

PriorInSupportQ[vector_List, spec_: Automatic] := Module[{s},
  s = If[spec === Automatic, $PriorSpec, spec];
  And @@ MapThread[#2[[1]] <= #1 <= #2[[2]] &, {vector, Values[s]}]
];

ParamsFromVector[vector_List, spec_: Automatic] := Module[{s, assoc, logKeys},
  s = If[spec === Automatic, $PriorSpec, spec];
  assoc = AssociationThread[Keys[s], vector];
  logKeys = Select[Keys[assoc], StringStartsQ[#, "Log10"] &];
  Join[
    KeyDrop[assoc, logKeys],
    Association @ Map[StringDrop[#, 5] -> 10^assoc[#] &, logKeys]
  ]
];

SamplePrior[] := ParamsFromVector[PriorVectorSample[]];

RunABCFromSummaries[observed_List, grid_List, simulationCount_Integer, retainCount_Integer, seed_Integer] := Module[
  {sims},
  BlockRandom[
    SeedRandom[seed];
    sims = Table[
      Module[{params = SamplePrior[], trajectory, predicted, distance},
        trajectory = SimulateSpatialTrajectory[params, grid];
        predicted = PredictedSummariesFromTrajectory[trajectory, grid, observed];
        distance = SummaryDistance[observed, predicted];
        Join[params, <|"Distance" -> distance|>]
      ],
      {simulationCount}
    ];
  ];
  <|"AllSimulations" -> sims, "Posterior" -> TakeSmallestBy[sims, #Distance &, Min[retainCount, Length[sims]]],
    "ObservedSummaries" -> observed|>
];

Options[RunABC] = {"SimulationCount" -> 200, "RetainCount" -> 40, "Seed" -> 20260831, "BinSizeYears" -> 1000};

RunABC[samples_List, grid_List, OptionsPattern[]] := Module[{observed},
  observed = ObservedSummaries[samples, OptionValue["BinSizeYears"]];
  RunABCFromSummaries[observed, grid, OptionValue["SimulationCount"], OptionValue["RetainCount"], OptionValue["Seed"]]
];

PosteriorPredictiveRegional[posterior_List, grid_List, observed_List] := Module[
  {trajectories},
  trajectories = SimulateSpatialTrajectory[#, grid] & /@ posterior;
  BlockRandom[
    SeedRandom[9112026];
    Map[
      Module[{obs = #, latent, predictive, called},
        called = Max[1, Round[obs["CalledAlleles"]]];
        latent = Table[
        RegionMeanFrequency[grid, FrequenciesAt[trajectories[[i]], obs["TimeBinMidBP"]], obs["Region"]],
        {i, Length[trajectories]}
        ];
        predictive = Flatten@Table[
          RandomVariate[BinomialDistribution[called, BoundedProbability[p]]]/called,
          {p, latent},
          {4}
        ];
      <|
        "Region" -> obs["Region"],
        "TimeBinMidBP" -> obs["TimeBinMidBP"],
        "ObservedFrequency" -> obs["Frequency"],
          "CalledAlleles" -> called,
          "LatentFrequencyMean" -> N[Mean[latent]],
          "PosteriorMean" -> N[Mean[predictive]],
          "PosteriorMedian" -> N[Quantile[predictive, 0.5]],
          "Lower95" -> N[Quantile[predictive, 0.025]],
          "Upper95" -> N[Quantile[predictive, 0.975]],
          "Covered95" -> (Quantile[predictive, 0.025] <= obs["Frequency"] <= Quantile[predictive, 0.975])
      |>
      ] &,
      observed
    ]
  ]
];

ExportABCOutputs[root_String, samples_List, grid_List, abc_Association] := Module[
  {processedDir, figDir, allFile, posteriorFile, ppcFile, ppc, paramFig, ppcFig},
  processedDir = FileNameJoin[{root, "data", "processed"}];
  figDir = FileNameJoin[{root, "figures", "generated"}];
  allFile = FileNameJoin[{processedDir, "abc_all_simulations.csv"}];
  posteriorFile = FileNameJoin[{processedDir, "abc_posterior.csv"}];
  ppcFile = FileNameJoin[{processedDir, "posterior_predictive_regional.csv"}];
  ppc = PosteriorPredictiveRegional[abc["Posterior"], grid, abc["ObservedSummaries"]];
  ExportRows[allFile, abc["AllSimulations"]];
  ExportRows[posteriorFile, abc["Posterior"]];
  ExportRows[ppcFile, ppc];
  paramFig = FileNameJoin[{figDir, "abc_parameter_posteriors.png"}];
  Export[
    paramFig,
    GraphicsGrid[
      Partition[
        Table[
          Histogram[abc["Posterior"][[All, param]], 12, "PDF",
            Frame -> True, Axes -> False, PlotLabel -> param, ImageSize -> 300],
          {param, {"InitialFrequency", "SelectionBase", "SelectionDairying", "Migration",
            "SelectionMultiplierBritishIsles", "SelectionMultiplierRhineDanube",
            "SelectionMultiplierMediterranean", "SelectionMultiplierBaltic"}}
        ],
        2
      ],
      Spacings -> {0.5, 0.8}
    ],
    ImageResolution -> 160
  ];
  ppcFig = FileNameJoin[{figDir, "posterior_predictive_regional.png"}];
  Export[
    ppcFig,
    Module[{colors = AssociationThread[$AnalysisRegions, ColorData[97] /@ Range[Length[$AnalysisRegions]]]},
      Graphics[
        Join[
          {{Gray, Dashed, Line[{{0, 0}, {1, 1}}]}},
          Table[
            {
              Directive[Lookup[colors, row["Region"], Black], AbsoluteThickness[1.4]],
              Line[{{row["ObservedFrequency"], row["Lower95"]}, {row["ObservedFrequency"], row["Upper95"]}}],
              Black,
              PointSize[0.013],
              Point[{row["ObservedFrequency"], row["PosteriorMedian"]}]
            },
            {row, ppc}
          ]
        ],
        Frame -> True,
        Axes -> False,
        PlotRange -> {{0, 1}, {0, 1}},
        FrameLabel -> {"observed frequency", "posterior predictive frequency"},
        ImageSize -> 700
      ]
    ],
    ImageResolution -> 160
  ];
  <|"AllSimulationsFile" -> allFile, "PosteriorFile" -> posteriorFile,
    "PosteriorPredictiveFile" -> ppcFile, "ParameterFigure" -> paramFig,
    "PosteriorPredictiveFigure" -> ppcFig, "PosteriorPredictive" -> ppc|>
];

Options[RunCrossValidation] = {"SimulationCount" -> 80, "RetainCount" -> 25, "Seed" -> 260831};

RunCrossValidation[samples_List, grid_List, OptionsPattern[]] := Module[
  {obsAll, rows},
  obsAll = ObservedSummaries[samples];
  rows = Table[
    Module[{trainObs, heldObs, abc, ppc, diffs, covered},
      trainObs = Select[obsAll, #Region =!= held &];
      heldObs = Select[obsAll, #Region === held &];
      abc = RunABCFromSummaries[trainObs, grid, OptionValue["SimulationCount"],
        OptionValue["RetainCount"], OptionValue["Seed"] + StringLength[held]];
      ppc = PosteriorPredictiveRegional[abc["Posterior"], grid, heldObs];
      diffs = ppc[[All, "ObservedFrequency"]] - ppc[[All, "PosteriorMedian"]];
      covered = Boole /@ ppc[[All, "Covered95"]];
      <|
        "HeldOutRegion" -> held,
        "HeldOutBins" -> Length[heldObs],
        "TrainingBins" -> Length[trainObs],
        "RMSE" -> If[diffs === {}, Missing["NoHeldOutBins"], Sqrt[Mean[diffs^2]]],
        "Coverage95" -> If[covered === {}, Missing["NoHeldOutBins"], N[Mean[covered]]],
        "MedianDistance" -> Median[abc["Posterior"][[All, "Distance"]]]
      |>
    ],
    {held, $AnalysisRegions}
  ];
  rows
];

CellPolygon[cell_Association] := Module[
  {lat = cell["Latitude"], lon = cell["Longitude"], h = cell["StepDegrees"]/2},
  GeoPolygon[{{lat - h, lon - h}, {lat - h, lon + h}, {lat + h, lon + h}, {lat + h, lon - h}}]
];

$EuropeGeoRange = {{34, 63}, {-12, 36}};

GeoCoordinateToKrigingPoint[{lat_?NumericQ, lon_?NumericQ}] := {N[lon Cos[50 Degree]], N[lat]};

ExponentialCovariance[a_List, b_List, range_?NumericQ] := Exp[-EuclideanDistance[a, b]/range];

OrdinaryKrigingWeights[
  dataCoords_List,
  predictionCoords_List,
  range_: 3.5,
  nugget_: 0.02
] := Module[
  {n = Length[dataCoords], covarianceMatrix, systemMatrix, solver},
  covarianceMatrix = Table[
    ExponentialCovariance[dataCoords[[i]], dataCoords[[j]], range] + If[i == j, nugget, 0],
    {i, n}, {j, n}
  ];
  systemMatrix = ArrayFlatten[
    {{covarianceMatrix, ConstantArray[1., {n, 1}]},
     {ConstantArray[1., {1, n}], {{0.}}}}
  ];
  solver = Quiet@Check[LinearSolve[systemMatrix], $Failed];
  If[solver === $Failed,
    ConstantArray[ConstantArray[1./n, n], Length[predictionCoords]],
    Table[
      With[{pred = predictionCoords[[k]]},
        Most[solver[Append[(ExponentialCovariance[#, pred, range] & /@ dataCoords), 1.]]]
      ],
      {k, Length[predictionCoords]}
    ]
  ]
];

OrdinaryKrigingPredictor[
  coords_List,
  values_List,
  range_: 3.5,
  nugget_: 0.02
] := Module[
  {numericValues = N[values], weightsFor},
  weightsFor[coord_] := First@OrdinaryKrigingWeights[coords, {coord}, range, nugget];
  Function[{coord}, Clip[weightsFor[coord].numericValues, {0, 1}]]
];

KrigingSurfaceSupport[grid_List, resolution_: 0.5] := Module[
  {latCenters, lonCenters, geoCoordinates, predictionCoords, dataCoords, landMask, domainMask},
  latCenters = Range[$EuropeGeoRange[[1, 1]] + resolution/2, $EuropeGeoRange[[1, 2]] - resolution/2, resolution];
  lonCenters = Range[$EuropeGeoRange[[2, 1]] + resolution/2, $EuropeGeoRange[[2, 2]] - resolution/2, resolution];
  geoCoordinates = Flatten[Table[{lat, lon}, {lat, latCenters}, {lon, lonCenters}], 1];
  predictionCoords = GeoCoordinateToKrigingPoint /@ geoCoordinates;
  dataCoords = GeoCoordinateToKrigingPoint /@ ({#["Latitude"], #["Longitude"]} & /@ grid);
  landMask = Quiet@Check[
    Map[If[NumericValueQ[#] && # > -10, 1., 0.] &,
      QuantityMagnitude[GeoElevationData[GeoPosition[geoCoordinates]]]],
    ConstantArray[1., Length[geoCoordinates]]
  ];
  If[! ListQ[landMask] || Length[landMask] =!= Length[geoCoordinates],
    landMask = ConstantArray[1., Length[geoCoordinates]]];
  domainMask = Module[{nfCells = Nearest[dataCoords]},
    Map[If[EuclideanDistance[#, First[nfCells[#]]] <= 3., 1., 0.] &, predictionCoords]];
  <|
    "GeoCoordinates" -> geoCoordinates,
    "HalfStep" -> resolution/2,
    "LatCount" -> Length[latCenters],
    "LonCount" -> Length[lonCenters],
    "LandMask" -> landMask,
    "DomainMask" -> domainMask,
    "Weights" -> OrdinaryKrigingWeights[dataCoords, predictionCoords]
  |>
];

KrigedSurfaceValues[support_Association, values_List] :=
  Clip[support["Weights"].N[values], {0, 1}];

GeoTile[{lat_, lon_}, value_, halfStep_, colorFunction_, opacity_, valueRange_] := {
  GeoStyling[Opacity[opacity, colorFunction[Clip[Rescale[value, valueRange], {0, 1}]^0.55]]],
  EdgeForm[None],
  GeoPolygon[{
    {lat - halfStep, lon - halfStep},
    {lat - halfStep, lon + halfStep},
    {lat + halfStep, lon + halfStep},
    {lat + halfStep, lon - halfStep}
  }]
};

KrigedSurfaceLayer[support_Association, values_List, colorFunction_, opacity_, valueRange_] := Module[
  {surfaceValues},
  surfaceValues = KrigedSurfaceValues[support, values];
  MapThread[
    GeoTile[#1, #2, support["HalfStep"], colorFunction, opacity, valueRange] &,
    {support["GeoCoordinates"], surfaceValues}
  ]
];

SamplesInWindow[samples_List, bp_?NumericQ, halfWidth_: 500] :=
  Select[samples, TrueQ[#["HasCall"]] && NumericValueQ[#["Latitude"]] && NumericValueQ[#["Longitude"]] &&
      34 <= #["Latitude"] <= 63 && -12 <= #["Longitude"] <= 36 &&
      Abs[#["MeanDateBP"] - bp] <= halfWidth &];

GeoPointLayer[samples_List] := If[samples === {},
  {},
  With[{positions = GeoPosition[({#["Latitude"], #["Longitude"]} & /@ samples)]},
    {
      White, PointSize[0.014], Point[positions],
      Black, PointSize[0.008], Point[positions]
    }
  ]
];

LandMaskImage[width_Integer, height_Integer] := LandMaskImage[width, height] = Module[
  {g, raster},
  g = GeoGraphics[{},
    GeoRange -> $EuropeGeoRange,
    GeoProjection -> "Equirectangular",
    GeoBackground -> GeoStyling[{"CountryBorders",
      "Land" -> White, "Ocean" -> Black, "Border" -> White}],
    GeoGridLines -> None, GeoRangePadding -> None,
    PlotRangePadding -> None, ImagePadding -> None, ImageMargins -> 0,
    ImageSize -> {width, height}];
  raster = Quiet@Check[
    ImageResize[Rasterize[g, "Image", RasterSize -> {width, height}], {width, height}],
    $Failed];
  If[raster === $Failed, Return[Image[ConstantArray[1., {height, width}]]]];
  Image[Round[ImageData[ColorConvert[raster, "Grayscale"]]]]
];

FieldOverlayImage[support_Association, values_List, colorFunction_, valueRange_, opacity_, width_Integer, height_Integer] := Module[
  {vals, matrix, colored, img, maskImg, domainImg},
  vals = KrigedSurfaceValues[support, values];
  matrix = Reverse[Partition[vals, support["LonCount"]]];
  colored = Map[
    List @@ ColorConvert[colorFunction[Clip[Rescale[#, valueRange], {0, 1}]^0.55], "RGB"] &,
    matrix, {2}
  ];
  img = ImageResize[Image[colored], {width, height}];
  maskImg = LandMaskImage[width, height];
  domainImg = ImageResize[
    Image[Reverse[Partition[Lookup[support, "DomainMask", ConstantArray[1., Length[vals]]], support["LonCount"]]]],
    {width, height}];
  SetAlphaChannel[img, ImageMultiply[ImageMultiply[maskImg, domainImg], opacity]]
];

$MapPixelWidth = 1152;
$MapAspect = ($EuropeGeoRange[[1, 2]] - $EuropeGeoRange[[1, 1]])/($EuropeGeoRange[[2, 2]] - $EuropeGeoRange[[2, 1]]);

BaseMapRaster[width_Integer] := BaseMapRaster[width] = Module[{h, g},
  h = Round[width $MapAspect];
  g = GeoGraphics[{},
    GeoRange -> $EuropeGeoRange,
    GeoProjection -> "Equirectangular",
    GeoBackground -> GeoStyling[{"CountryBorders",
      "Land" -> GrayLevel[0.985], "Ocean" -> RGBColor[0.82, 0.89, 0.95]}],
    GeoGridLines -> None, GeoRangePadding -> None,
    PlotRangePadding -> None, ImagePadding -> None, ImageMargins -> 0,
    ImageSize -> {width, h}];
  ImageResize[Rasterize[g, "Image", RasterSize -> {width, h}], {width, h}]
];

SamplePointsRaster[samples_List, width_Integer, height_Integer] := Module[{pts},
  If[samples === {}, Return[None]];
  pts = {#["Longitude"], #["Latitude"]} & /@ samples;
  Rasterize[
    Graphics[
      {White, PointSize[0.011], Point[pts], Black, PointSize[0.0062], Point[pts]},
      PlotRange -> {{$EuropeGeoRange[[2, 1]], $EuropeGeoRange[[2, 2]]},
        {$EuropeGeoRange[[1, 1]], $EuropeGeoRange[[1, 2]]}},
      PlotRangePadding -> None, ImagePadding -> None, ImageMargins -> 0,
      AspectRatio -> Full, Background -> None,
      ImageSize -> {width, height}],
    "Image", RasterSize -> {width, height}, Background -> None]
];

SpatialMap[grid_List, support_Association, values_List, samples_List, label_String, colorFunction_, opacity_: 0.92,
  valueRange_: {0, 1}, legendLabel_: "frequency"] := Module[
  {legendColorFunction, w, h, base, overlay, ptsImg, composed},
  legendColorFunction = (colorFunction[Clip[Rescale[#, valueRange], {0, 1}]^0.55] &);
  w = $MapPixelWidth; h = Round[w $MapAspect];
  base = BaseMapRaster[w];
  overlay = FieldOverlayImage[support, values, colorFunction, valueRange, opacity, w, h];
  composed = ImageCompose[base, overlay];
  ptsImg = SamplePointsRaster[samples, w, h];
  If[ImageQ[ptsImg], composed = ImageCompose[composed, ptsImg]];
  Framed[
    Legended[
      Labeled[
        Image[composed, ImageSize -> 640],
        Style[label, 13, Bold, Black], Top],
      Placed[
        BarLegend[
          {legendColorFunction, valueRange},
          LegendLabel -> Style[legendLabel, 11, Black],
          LabelStyle -> Directive[Black, 10],
          LegendMarkerSize -> 220,
          LegendFunction -> (Framed[#, Background -> White, FrameStyle -> None] &)
        ],
        Right
      ]
    ],
    Background -> White,
    FrameStyle -> None,
    FrameMargins -> 4
  ]
];

PosteriorCellStats[posterior_List, grid_List, times_List] := Module[
  {trajectories},
  trajectories = SimulateSpatialTrajectory[#, grid] & /@ posterior;
  Association@Table[
    Module[{matrix},
      matrix = FrequenciesAt[#, t] & /@ trajectories;
      t -> <|
        "Mean" -> Mean /@ Transpose[matrix],
        "Lower95" -> (Quantile[#, 0.025] & /@ Transpose[matrix]),
        "Upper95" -> (Quantile[#, 0.975] & /@ Transpose[matrix])
      |>
    ],
    {t, times}
  ]
];

ExportSpatialVisualizations[root_String, samples_List, grid_List, posterior_List] := Module[
  {figDir, times, stats, meanMapFile, uncertaintyMapFile, gifFile, mp4File,
   iCloudGIFFile, iCloudMP4File, frames, meanValues, uncertaintyValues, meanCF,
   uncertaintyCF, sampleWindow, krigingSupport},
  figDir = FileNameJoin[{root, "figures", "generated"}];
  times = Range[8000, 0, -500];
  stats = PosteriorCellStats[posterior, grid, times];
  krigingSupport = KrigingSurfaceSupport[grid, 1.5];
  meanCF = (ColorData["TemperatureMap"][#] &);
  uncertaintyCF = (Blend[
      {RGBColor[0.98, 0.98, 0.98], RGBColor[1.0, 0.88, 0.18],
       RGBColor[1.0, 0.42, 0.04], RGBColor[0.70, 0.0, 0.70]},
      #
    ] &);
  meanValues = stats[3000]["Mean"];
  uncertaintyValues = stats[3000]["Upper95"] - stats[3000]["Lower95"];
  sampleWindow = SamplesInWindow[samples, 3000, 500];
  meanMapFile = FileNameJoin[{figDir, "spatial_posterior_mean_3000bp.png"}];
  uncertaintyMapFile = FileNameJoin[{figDir, "spatial_uncertainty_width_3000bp.png"}];
  Export[
    meanMapFile,
    SpatialMap[grid, krigingSupport, meanValues, sampleWindow,
      "Kriged posterior mean LP frequency, 3000 BP", meanCF, 0.92, {0, 0.5}, "mean frequency"],
    ImageResolution -> 160
  ];
  Export[
    uncertaintyMapFile,
    SpatialMap[grid, krigingSupport, uncertaintyValues, sampleWindow,
      "Kriged 95% interval width, 3000 BP", uncertaintyCF, 0.92, {0, 1.0}, "95% interval width"],
    ImageResolution -> 160
  ];
  frames = Table[
    Module[{mean = stats[t]["Mean"], width = stats[t]["Upper95"] - stats[t]["Lower95"], s = SamplesInWindow[samples, t, 500]},
      Rasterize[
        GraphicsGrid[
          {{
            SpatialMap[grid, krigingSupport, mean, s, "Kriged mean frequency, " <> ToString[t] <> " BP",
              meanCF, 0.92, {0, 0.5}, "mean frequency"],
            SpatialMap[grid, krigingSupport, width, s, "Kriged uncertainty width, " <> ToString[t] <> " BP",
              uncertaintyCF, 0.92, {0, 1.0}, "95% width"]
          }},
          Spacings -> {0.2, 0.1},
          ImageSize -> 1500
        ],
        "Image",
        RasterSize -> {1500, 780},
        Background -> White
      ]
    ],
    {t, times}
  ];
  gifFile = FileNameJoin[{figDir, "lactase_persistence_spatial_posterior.gif"}];
  Export[gifFile, frames, "DisplayDurations" -> 0.7, AnimationRepetitions -> Infinity];
  mp4File = ExportMP4FromFrames[
    FileNameJoin[{figDir, "lactase_persistence_spatial_posterior.mp4"}],
    frames,
    0.7
  ];
  iCloudGIFFile = CopyVersionToICloud[gifFile, "lactase_persistence_spatial_posterior"];
  iCloudMP4File = If[StringQ[mp4File] && FileExistsQ[mp4File],
    CopyVersionToICloud[mp4File, "lactase_persistence_spatial_posterior"],
    Missing["MP4Unavailable"]
  ];
  <|
    "MeanMap" -> meanMapFile,
    "UncertaintyMap" -> uncertaintyMapFile,
    "Animation" -> gifFile,
    "MP4" -> mp4File,
    "ICloudAnimation" -> iCloudGIFFile,
    "ICloudMP4" -> iCloudMP4File
  |>
];

WriteRunSummary[root_String, outputs_Association] := Module[
  {file, lines, path, rootClean, rootPrefix, entry},
  file = FileNameJoin[{root, "docs", "run-summary.md"}];
  rootClean = If[StringEndsQ[root, $PathnameSeparator] && StringLength[root] > 1, StringDrop[root, -1], root];
  rootPrefix = rootClean <> $PathnameSeparator;
  path[key_String] := Module[{value = Lookup[outputs, key, ""]},
    If[StringQ[value],
      If[StringStartsQ[value, rootPrefix], StringDrop[value, StringLength[rootPrefix]], value],
      ToString[value, InputForm]
    ]
  ];
  entry[label_String, key_String] :=
    If[KeyExistsQ[outputs, key], {"- " <> label <> ": `" <> path[key] <> "`"}, {}];
  lines = Join[
    {"# Run Summary", "",
     "Generated: " <> DateString[Now, "ISODateTime"], "",
     "Pipeline: GLAD ancient rs4988235 genotypes (derived from AADR v44.3), regional binomial logistic reproduction, coarse spatial diffusion-selection model, SMC-ABC inference with spatial-gradient summary statistics, posterior predictive checks, held-out validation, and prior sensitivity analysis.", "",
     "## Key Outputs", ""},
    entry["Processed samples", "CalledSamplesFile"],
    entry["Regional binned frequencies", "BinnedFrequenciesFile"],
    entry["Regional logistic fits", "RegionalFitFile"],
    entry["Regional reproduction figure", "RegionalFigure"],
    entry["SMC particles with weights", "ParticlesFile"],
    entry["Resampled posterior draws", "PosteriorFile"],
    entry["SMC diagnostics", "DiagnosticsFile"],
    entry["Posterior parameter quantiles", "QuantilesFile"],
    entry["Posterior predictive checks", "PosteriorPredictiveFile"],
    entry["Parameter posterior figure", "ParameterFigure"],
    entry["Posterior predictive figure", "PosteriorPredictiveFigure"],
    entry["Held-out-region cross-validation", "CrossValidationFile"],
    entry["Time-slice validation", "TimeSliceFile"],
    entry["Sensitivity quantiles", "SensitivityFile"],
    entry["Sensitivity figure", "SensitivityFigure"],
    entry["Spatial mean map", "MeanMap"],
    entry["Spatial uncertainty map", "UncertaintyMap"],
    entry["Spatial GIF animation", "Animation"],
    entry["Spatial MP4 video", "MP4"],
    entry["iCloud GIF copy", "ICloudAnimation"],
    entry["iCloud MP4 copy", "ICloudMP4"],
    {"",
     "## Inference Notes", "",
     Lookup[outputs, "InferenceNote", "SMC-ABC settings recorded in smc_diagnostics.csv."], "",
     "## Scientific Status", "",
     "The regional logistic layer is a qualitative reproduction of the published four-region framing, not a claim of exact parameter identity with Evershed et al. 2022. The spatial model is deliberately coarse; ordinary kriging is a display layer only. Posterior uncertainty, held-out validation, and prior sensitivity are reported alongside every point summary."}
  ];
  Export[file, StringRiffle[lines, "\n"], "Text"];
  file
];


(* ------------------------------------------------------------------ *)
(* Statistical upgrade layer: Wilson intervals, logistic-fit standard *)
(* errors, spatial-gradient summary statistics, and shared styling.   *)
(* ------------------------------------------------------------------ *)

$RegionColors = <|
  "British Isles" -> RGBColor[0.20, 0.47, 0.71],
  "Rhine-Danube" -> RGBColor[0.85, 0.45, 0.11],
  "Mediterranean" -> RGBColor[0.17, 0.63, 0.37],
  "Baltic" -> RGBColor[0.62, 0.35, 0.71],
  "Other Europe" -> GrayLevel[0.45]
|>;

$PosteriorColor = RGBColor[0.20, 0.47, 0.71];
$PriorColor = RGBColor[0.85, 0.45, 0.11];

WilsonInterval[derived_?NumericQ, called_?NumericQ, z_: 1.959963984540054] := Module[
  {p, denom, center, half},
  If[called <= 0, Return[{0., 1.}]];
  p = N[derived/called];
  denom = 1 + z^2/called;
  center = (p + z^2/(2 called))/denom;
  half = (z Sqrt[p (1 - p)/called + z^2/(4 called^2)])/denom;
  {Clip[center - half, {0, 1}], Clip[center + half, {0, 1}]}
];

LogisticFitStandardErrors[objective_, alpha_?NumericQ, beta_?NumericQ, h_: 0.005] := Module[
  {faa, fbb, fab, hessian, cov},
  faa = (objective[alpha + h, beta] - 2 objective[alpha, beta] + objective[alpha - h, beta])/h^2;
  fbb = (objective[alpha, beta + h] - 2 objective[alpha, beta] + objective[alpha, beta - h])/h^2;
  fab = (objective[alpha + h, beta + h] - objective[alpha + h, beta - h] -
      objective[alpha - h, beta + h] + objective[alpha - h, beta - h])/(4 h^2);
  hessian = {{faa, fab}, {fab, fbb}};
  cov = Quiet@Check[Inverse[-hessian], $Failed];
  If[cov === $Failed || AnyTrue[Diagonal[cov], # <= 0 &],
    {Missing["NotAvailable"], Missing["NotAvailable"]},
    Sqrt[Diagonal[cov]]
  ]
];

WeightedQuantile[values_List, weights_List, q_?NumericQ] := Module[
  {order, v, w, cum, total, idx},
  order = Ordering[values];
  v = values[[order]]; w = weights[[order]];
  total = Total[w];
  If[total <= 0, Return[Missing["NoWeight"]]];
  cum = Accumulate[w]/total;
  idx = LengthWhile[cum, # < q &] + 1;
  v[[Min[idx, Length[v]]]]
];

WeightedComponentVariance[vectors_List, weights_List] := Module[
  {w = weights/Total[weights], means},
  means = w . vectors;
  w . ((# - means)^2 & /@ vectors)
];

(* --- observation index and spatial-gradient summary statistics --- *)

BuildObservationIndex[samples_List, grid_List] := Module[{coords, nf, sel},
  coords = ({#["Latitude"], #["Longitude"]} & /@ grid);
  nf = Nearest[coords -> "Index"];
  sel = Select[samples,
    TrueQ[#["HasCall"]] && NumericValueQ[#["Latitude"]] && NumericValueQ[#["Longitude"]] &&
      NumericValueQ[#["MeanDateBP"]] && #["MeanDateBP"] <= 12000 &&
      MemberQ[Append[$AnalysisRegions, "Other Europe"], #["Region"]] &
  ];
  Map[
    <|
      "CellIndex" -> First[nf[{#["Latitude"], #["Longitude"]}]],
      "TimeBP" -> N[#["MeanDateBP"]],
      "Called" -> #["CalledAlleles"],
      "Derived" -> #["DerivedAlleles"],
      "Latitude" -> #["Latitude"],
      "Longitude" -> #["Longitude"]
    |> &,
    sel
  ]
];

$GradientLateWindowBP = 4000;
$GradientWindows = {{0, 4000}, {4800, 12000}};

GradientPoolPositions[index_List, window_: {0, 4000}] := Module[{pos},
  pos = Select[Range[Length[index]],
    window[[1]] < index[[#, "TimeBP"]] <= window[[2]] &];
  <|
    "North" -> Select[pos, index[[#, "Latitude"]] >= 52 &],
    "South" -> Select[pos, index[[#, "Latitude"]] < 46 &],
    "West" -> Select[pos, index[[#, "Longitude"]] < 5 &],
    "East" -> Select[pos, index[[#, "Longitude"]] >= 15 &]
  |>
];

PooledFrequency[index_List, positions_List] := Module[{called, derived},
  If[positions === {}, Return[Missing["NoSamples"]]];
  called = Total[index[[positions, "Called"]]];
  derived = Total[index[[positions, "Derived"]]];
  If[called <= 0, Missing["NoSamples"], N[derived/called]]
];

PooledPredictedFrequency[index_List, positions_List, ps_List] := Module[{called},
  If[positions === {}, Return[Missing["NoSamples"]]];
  called = index[[positions, "Called"]];
  If[Total[called] <= 0, Missing["NoSamples"], N[Total[called ps[[positions]]]/Total[called]]]
];

ObservedGradientStatistics[index_List, window_: {0, 4000}] := Module[{pools, fN, fS, fW, fE, wNS, wWE},
  pools = GradientPoolPositions[index, window];
  fN = PooledFrequency[index, pools["North"]];
  fS = PooledFrequency[index, pools["South"]];
  fW = PooledFrequency[index, pools["West"]];
  fE = PooledFrequency[index, pools["East"]];
  wNS = If[MissingQ[fN] || MissingQ[fS], 0,
    Min[Total[index[[pools["North"], "Called"]]], Total[index[[pools["South"], "Called"]]]]];
  wWE = If[MissingQ[fW] || MissingQ[fE], 0,
    Min[Total[index[[pools["West"], "Called"]]], Total[index[[pools["East"], "Called"]]]]];
  <|
    "Pools" -> pools,
    "NorthSouth" -> If[wNS > 0, fN - fS, 0.],
    "WestEast" -> If[wWE > 0, fW - fE, 0.],
    "NorthSouthWeight" -> wNS,
    "WestEastWeight" -> wWE
  |>
];

PredictedSampleProbabilities[trajectory_Association, index_List] := Module[{times, freqs},
  times = trajectory["TimesBP"];
  freqs = trajectory["Frequencies"];
  Map[
    freqs[[First@Ordering[Abs[times - #["TimeBP"]], 1], #["CellIndex"]]] &,
    index
  ]
];

ExtendedObservedData[samples_List, grid_List, binSize_: 1000] := Module[{binned, index, gradients},
  binned = ObservedSummaries[samples, binSize];
  index = BuildObservationIndex[samples, grid];
  gradients = ObservedGradientStatistics[index, #] & /@ $GradientWindows;
  <|"Binned" -> binned, "Index" -> index,
    "Gradient" -> First[gradients], "Gradients" -> gradients|>
];

ExtendedDistance[obsData_Association, trajectory_Association, grid_List] := Module[
  {binned, predicted, binWeights, binDiffs, gradients, ps, num, den},
  binned = obsData["Binned"];
  predicted = PredictedSummariesFromTrajectory[trajectory, grid, binned];
  binWeights = binned[[All, "CalledAlleles"]];
  binDiffs = binned[[All, "Frequency"]] - predicted[[All, "PredictedFrequency"]];
  gradients = Lookup[obsData, "Gradients", {obsData["Gradient"]}];
  ps = If[AnyTrue[gradients, #["NorthSouthWeight"] > 0 || #["WestEastWeight"] > 0 &],
    PredictedSampleProbabilities[trajectory, obsData["Index"]], {}];
  num = Total[binWeights binDiffs^2];
  den = Total[binWeights];
  Do[
    Module[{pools = g["Pools"], wNS = g["NorthSouthWeight"], wWE = g["WestEastWeight"],
      gNSdiff = 0., gWEdiff = 0.},
      If[wNS > 0,
        gNSdiff = g["NorthSouth"] -
          (PooledPredictedFrequency[obsData["Index"], pools["North"], ps] -
           PooledPredictedFrequency[obsData["Index"], pools["South"], ps])];
      If[wWE > 0,
        gWEdiff = g["WestEast"] -
          (PooledPredictedFrequency[obsData["Index"], pools["West"], ps] -
           PooledPredictedFrequency[obsData["Index"], pools["East"], ps])];
      num += wNS gNSdiff^2 + wWE gWEdiff^2;
      den += wNS + wWE;
    ],
    {g, gradients}
  ];
  Sqrt[num/den]
];

(* ------------------------------------------------------------------ *)
(* SMC-ABC with adaptive tolerances and importance weights.           *)
(* ------------------------------------------------------------------ *)

SMCDistanceForVector[vector_List, obsData_Association, grid_List, spec_] := Module[
  {params, trajectory, dOrigin, originPt, gridPts, originIdx, onsetGap},
  params = ParamsFromVector[vector, spec];
  (* a point source must sit on land: origins farther than 1.6 degrees from
     any land cell centre (sea, or outside the modelled domain) are rejected
     with a large graded distance, so nearest-cell snapping cannot pile
     prior mass onto coastal cells *)
  If[KeyExistsQ[params, "OriginTimeBP"],
    originPt = {params["OriginLatitude"], params["OriginLongitude"] Cos[params["OriginLatitude"] Degree]};
    gridPts = ({#["Latitude"], #["Longitude"] Cos[#["Latitude"] Degree]} & /@ grid);
    originIdx = First @ Nearest[gridPts -> "Index", originPt];
    dOrigin = EuclideanDistance[originPt, gridPts[[originIdx]]];
    If[dOrigin > 1.6, Return[3. + dOrigin]];
    (* gene-culture coupling: the point source locates the start of the
       selection-driven rise, which presupposes dairying \[LongDash] so the
       origin may precede the local dairying onset by at most
       $OriginDairyingLeadYears.  Without this the deterministic core (no
       drift) lets a tiny injection idle for millennia in forager regions
       and the origin location decouples from the coevolution story. *)
    onsetGap = params["OriginTimeBP"] - grid[[originIdx]]["DairyingOnsetBP"] -
      $OriginDairyingLeadYears;
    If[onsetGap > 0, Return[3. + onsetGap/1000.]];
  ];
  trajectory = SimulateSpatialTrajectory[params, grid];
  ExtendedDistance[obsData, trajectory, grid]
];

GaussianKernelDensityRows[candidates_List, previous_List, sds_List] := Module[
  {invTwoVar, norm},
  invTwoVar = 1/(2 sds^2);
  norm = 1/(Sqrt[2 Pi] sds);
  Table[
    Table[
      Times @@ (norm Exp[-invTwoVar (candidates[[i]] - previous[[j]])^2]),
      {j, Length[previous]}
    ],
    {i, Length[candidates]}
  ]
];

(* SMC operates in an unbounded logit-transformed space so that Gaussian
   perturbations never leave the prior box. If x ~ Uniform(a, b) and
   y = logit((x - a)/(b - a)), then y follows a standard logistic
   distribution, giving a closed-form prior density in y-space. *)

ToUnboundedVector[vector_List, spec_] := MapThread[
  Module[{u = Clip[(#1 - #2[[1]])/(#2[[2]] - #2[[1]]), {10.^-12, 1 - 10.^-12}]},
    Log[u/(1 - u)]
  ] &,
  {vector, Values[spec]}
];

FromUnboundedVector[y_List, spec_] := MapThread[
  #2[[1]] + (#2[[2]] - #2[[1]])/(1 + Exp[-#1]) &,
  {y, Values[spec]}
];

LogisticPriorDensity[y_List] := Times @@ (Exp[-#]/(1 + Exp[-#])^2 & /@ y);

Options[RunSMCABC] = {
  "Particles" -> 400,
  "Generations" -> 5,
  "ToleranceQuantile" -> 0.5,
  "Seed" -> 20260831,
  "BinSizeYears" -> 1000,
  "MaxSimulationsPerGeneration" -> Automatic,
  "PriorSpec" -> Automatic,
  "ProgressFunction" -> None
};

RunSMCABC[samples_List, grid_List, OptionsPattern[]] := Module[
  {spec, n, gens, q, seed, obsData, maxSims, progress,
   vectors, ys, dists, weights, eps, epsHistory = {}, accHistory = {}, essHistory = {},
   totalSims = 0, generationShortfall = False},
  spec = If[OptionValue["PriorSpec"] === Automatic, $PriorSpec, OptionValue["PriorSpec"]];
  n = OptionValue["Particles"];
  gens = OptionValue["Generations"];
  q = OptionValue["ToleranceQuantile"];
  seed = OptionValue["Seed"];
  maxSims = If[OptionValue["MaxSimulationsPerGeneration"] === Automatic,
    30 n, OptionValue["MaxSimulationsPerGeneration"]];
  progress = OptionValue["ProgressFunction"];
  obsData = ExtendedObservedData[samples, grid, OptionValue["BinSizeYears"]];
  BlockRandom[
    SeedRandom[seed];
    vectors = Table[PriorVectorSample[spec], {n}];
    ys = ToUnboundedVector[#, spec] & /@ vectors;
    dists = SMCDistanceForVector[#, obsData, grid, spec] & /@ vectors;
    totalSims += n;
    weights = ConstantArray[1./n, n];
    eps = Quantile[dists, q];
    AppendTo[epsHistory, eps];
    AppendTo[accHistory, 1.];
    AppendTo[essHistory, N[n]];
    If[progress =!= None, progress[1, eps, 1., N[n]]];
    Do[
      Module[
        {prevYs = ys, prevWeights = weights, sds,
         acceptedYs = {}, acceptedXs = {}, acceptedDists = {}, attempts = 0,
         batch, batchYs, batchXs, batchDists, keepPos, kernelRows, priorDensities, newWeights},
        sds = Sqrt[2. Clip[WeightedComponentVariance[prevYs, prevWeights], {10.^-12, Infinity}]];
        While[Length[acceptedYs] < n && attempts < maxSims,
          batch = Min[2 n, maxSims - attempts];
          batchYs = Table[
            RandomChoice[prevWeights -> prevYs] +
              sds RandomVariate[NormalDistribution[0, 1], Length[sds]],
            {batch}
          ];
          attempts += batch;
          batchXs = FromUnboundedVector[#, spec] & /@ batchYs;
          batchDists = SMCDistanceForVector[#, obsData, grid, spec] & /@ batchXs;
          totalSims += batch;
          keepPos = Select[Range[Length[batchDists]], batchDists[[#]] < eps &];
          acceptedYs = Join[acceptedYs, batchYs[[keepPos]]];
          acceptedXs = Join[acceptedXs, batchXs[[keepPos]]];
          acceptedDists = Join[acceptedDists, batchDists[[keepPos]]];
        ];
        If[Length[acceptedYs] < n,
          generationShortfall = True;
          Break[]
        ];
        acceptedYs = acceptedYs[[;; n]];
        acceptedXs = acceptedXs[[;; n]];
        acceptedDists = acceptedDists[[;; n]];
        kernelRows = GaussianKernelDensityRows[acceptedYs, prevYs, sds];
        priorDensities = LogisticPriorDensity /@ acceptedYs;
        newWeights = Table[
          priorDensities[[i]]/Max[prevWeights . kernelRows[[i]], 10.^-300],
          {i, n}
        ];
        newWeights = newWeights/Total[newWeights];
        ys = acceptedYs;
        vectors = acceptedXs;
        dists = acceptedDists;
        weights = newWeights;
        eps = Quantile[dists, q];
        AppendTo[epsHistory, eps];
        AppendTo[accHistory, N[n/Max[attempts, 1]]];
        AppendTo[essHistory, 1./Total[weights^2]];
        If[progress =!= None, progress[g, eps, N[n/Max[attempts, 1]], 1./Total[weights^2]]];
      ],
      {g, 2, gens}
    ];
  ];
  <|
    "ParticleVectors" -> vectors,
    "Particles" -> MapThread[Append[ParamsFromVector[#1, spec], "Distance" -> #2] &, {vectors, dists}],
    "Weights" -> weights,
    "ParameterKeys" -> Keys[spec],
    "EpsilonHistory" -> epsHistory,
    "AcceptanceHistory" -> accHistory,
    "ESSHistory" -> essHistory,
    "TotalSimulations" -> totalSims,
    "GenerationShortfall" -> generationShortfall,
    "ObservedSummaries" -> obsData["Binned"],
    "PriorSpecUsed" -> spec
  |>
];

ResamplePosterior[smc_Association, count_Integer: 100] := BlockRandom[
  SeedRandom[420 + count];
  RandomChoice[smc["Weights"] -> smc["Particles"], count]
];

$DefaultQuantileSpec = {{"Lower95", 0.025}, {"Q25", 0.25}, {"Median", 0.5}, {"Q75", 0.75}, {"Upper95", 0.975}};

PosteriorParameterQuantiles[smc_Association, qs_: Automatic] := Module[
  {spec = smc["PriorSpecUsed"], vectors = smc["ParticleVectors"], weights = smc["Weights"],
   quantSpec, keys},
  quantSpec = If[qs === Automatic, $DefaultQuantileSpec, qs];
  keys = Keys[spec];
  Table[
    Join[
      <|"Parameter" -> keys[[k]]|>,
      AssociationThread[
        quantSpec[[All, 1]],
        WeightedQuantile[vectors[[All, k]], weights, #] & /@ quantSpec[[All, 2]]
      ]
    ],
    {k, Length[keys]}
  ]
];

(* --- SMC output export: tables, diagnostics, and figures --- *)

PosteriorPriorFigure[smc_Association] := Module[
  {spec = smc["PriorSpecUsed"], vectors = smc["ParticleVectors"], weights = smc["Weights"], panels},
  panels = Table[
    Module[{pos, vals, range, pad, priorDensity, hist, priorPlot},
      pos = Position[Keys[spec], key][[1, 1]];
      vals = vectors[[All, pos]];
      range = spec[key];
      pad = 0.03 (range[[2]] - range[[1]]);
      priorDensity = 1/(range[[2]] - range[[1]]);
      hist = Histogram[WeightedData[vals, weights], 14, "PDF",
        ChartStyle -> Directive[$PosteriorColor, Opacity[0.65], EdgeForm[None]],
        Frame -> True, Axes -> False,
        PlotLabel -> Style[key, 10.5],
        ImageSize -> 300,
        LabelStyle -> Directive[Black, 9.5]];
      priorPlot = Plot[priorDensity, {x, range[[1]], range[[2]]},
        PlotStyle -> Directive[$PriorColor, Dashed, AbsoluteThickness[1.6]]];
      Show[hist, priorPlot, PlotRange -> {{range[[1]] - pad, range[[2]] + pad}, All}]
    ],
    {key, Keys[spec]}
  ];
  Legended[
    GraphicsGrid[Partition[panels, 2], Spacings -> {0.6, 0.7}],
    LineLegend[
      {Directive[$PosteriorColor, AbsoluteThickness[6]], Directive[$PriorColor, Dashed]},
      {"weighted SMC posterior", "prior"}
    ]
  ]
];

PosteriorPredictiveFigure[ppc_List] := Module[{coverage},
  coverage = N[Mean[Boole /@ ppc[[All, "Covered95"]]]];
  Legended[
    Graphics[
      Join[
        {{GrayLevel[0.6], Dashed, AbsoluteThickness[1], Line[{{0, 0}, {1, 1}}]}},
        Table[
          {Directive[Lookup[$RegionColors, row["Region"], Black], Opacity[0.8], AbsoluteThickness[1.6]],
           Line[{{row["ObservedFrequency"], row["Lower95"]}, {row["ObservedFrequency"], row["Upper95"]}}],
           Directive[Lookup[$RegionColors, row["Region"], Black], Opacity[1]],
           PointSize[0.012], Point[{row["ObservedFrequency"], row["PosteriorMedian"]}]},
          {row, ppc}
        ]
      ],
      Frame -> True, Axes -> False,
      PlotRange -> {{-0.02, 1.02}, {-0.02, 1.02}},
      FrameLabel -> {"observed binned frequency", "posterior predictive"},
      PlotLabel -> Style[
        "Posterior predictive check, 95% intervals, empirical coverage " <>
          ToString[NumberForm[coverage, {3, 2}]], 12],
      LabelStyle -> Directive[Black, 11],
      ImageSize -> 640
    ],
    PointLegend[Values[KeyTake[$RegionColors, $AnalysisRegions]], $AnalysisRegions]
  ]
];

ExportSMCOutputs[root_String, samples_List, grid_List, smc_Association, posteriorDraws_List] := Module[
  {processedDir, figDir, particlesFile, posteriorFile, diagFile, quantFile, ppcFile,
   ppc, quantiles, paramFig, ppcFig, diag},
  processedDir = FileNameJoin[{root, "data", "processed"}];
  figDir = FileNameJoin[{root, "figures", "generated"}];
  particlesFile = FileNameJoin[{processedDir, "smc_particles.csv"}];
  posteriorFile = FileNameJoin[{processedDir, "abc_posterior.csv"}];
  diagFile = FileNameJoin[{processedDir, "smc_diagnostics.csv"}];
  quantFile = FileNameJoin[{processedDir, "posterior_parameter_quantiles.csv"}];
  ppcFile = FileNameJoin[{processedDir, "posterior_predictive_regional.csv"}];
  ExportRows[particlesFile,
    MapThread[Append[#1, "Weight" -> #2] &, {smc["Particles"], smc["Weights"]}]];
  ExportRows[posteriorFile, posteriorDraws];
  diag = Table[
    <|"Generation" -> k,
      "Epsilon" -> smc["EpsilonHistory"][[k]],
      "AcceptanceRate" -> smc["AcceptanceHistory"][[k]],
      "ESS" -> If[k <= Length[smc["ESSHistory"]], smc["ESSHistory"][[k]], Missing["NotAvailable"]]|>,
    {k, Length[smc["EpsilonHistory"]]}
  ];
  ExportRows[diagFile, diag];
  quantiles = PosteriorParameterQuantiles[smc];
  ExportRows[quantFile, quantiles];
  ppc = PosteriorPredictiveRegional[posteriorDraws, grid, smc["ObservedSummaries"]];
  ExportRows[ppcFile, ppc];
  paramFig = FileNameJoin[{figDir, "abc_parameter_posteriors.png"}];
  Export[paramFig, PosteriorPriorFigure[smc], ImageResolution -> 160];
  ppcFig = FileNameJoin[{figDir, "posterior_predictive_regional.png"}];
  Export[ppcFig, PosteriorPredictiveFigure[ppc], ImageResolution -> 160];
  <|"ParticlesFile" -> particlesFile, "PosteriorFile" -> posteriorFile,
    "DiagnosticsFile" -> diagFile, "QuantilesFile" -> quantFile,
    "PosteriorPredictiveFile" -> ppcFile, "ParameterFigure" -> paramFig,
    "PosteriorPredictiveFigure" -> ppcFig, "PosteriorPredictive" -> ppc|>
];

(* --- validation layers --- *)

Options[RunSMCCrossValidation] = {
  "Particles" -> 150, "Generations" -> 4, "Seed" -> 260831, "PosteriorDraws" -> 60
};

RunSMCCrossValidation[samples_List, grid_List, OptionsPattern[]] := Module[
  {obsAll, rows},
  obsAll = ObservedSummaries[samples];
  rows = Table[
    Module[{trainSamples, heldObs, smc, draws, ppc, diffs, covered},
      trainSamples = Select[samples, #["Region"] =!= held &];
      heldObs = Select[obsAll, #Region === held &];
      smc = RunSMCABC[trainSamples, grid,
        "Particles" -> OptionValue["Particles"],
        "Generations" -> OptionValue["Generations"],
        "Seed" -> OptionValue["Seed"] + StringLength[held]];
      draws = ResamplePosterior[smc, OptionValue["PosteriorDraws"]];
      ppc = PosteriorPredictiveRegional[draws, grid, heldObs];
      diffs = ppc[[All, "ObservedFrequency"]] - ppc[[All, "PosteriorMedian"]];
      covered = Boole /@ ppc[[All, "Covered95"]];
      <|
        "HeldOutRegion" -> held,
        "HeldOutBins" -> Length[heldObs],
        "RMSE" -> If[diffs === {}, Missing["NoHeldOutBins"], Sqrt[Mean[diffs^2]]],
        "Coverage95" -> If[covered === {}, Missing["NoHeldOutBins"], N[Mean[covered]]],
        "FinalEpsilon" -> Last[smc["EpsilonHistory"]],
        "TotalSimulations" -> smc["TotalSimulations"]
      |>
    ],
    {held, $AnalysisRegions}
  ];
  rows
];

Options[RunTimeSliceValidation] = {
  "CutBP" -> 2500, "Particles" -> 150, "Generations" -> 4, "Seed" -> 311226, "PosteriorDraws" -> 60
};

RunTimeSliceValidation[samples_List, grid_List, OptionsPattern[]] := Module[
  {cut, trainSamples, obsAll, heldObs, smc, draws, ppc, diffs, covered},
  cut = OptionValue["CutBP"];
  trainSamples = Select[samples, NumericValueQ[#["MeanDateBP"]] && #["MeanDateBP"] > cut &];
  obsAll = ObservedSummaries[samples];
  heldObs = Select[obsAll, #TimeBinMidBP <= cut &];
  smc = RunSMCABC[trainSamples, grid,
    "Particles" -> OptionValue["Particles"],
    "Generations" -> OptionValue["Generations"],
    "Seed" -> OptionValue["Seed"]];
  draws = ResamplePosterior[smc, OptionValue["PosteriorDraws"]];
  ppc = PosteriorPredictiveRegional[draws, grid, heldObs];
  diffs = ppc[[All, "ObservedFrequency"]] - ppc[[All, "PosteriorMedian"]];
  covered = Boole /@ ppc[[All, "Covered95"]];
  <|
    "CutBP" -> cut,
    "HeldOutBins" -> Length[heldObs],
    "TrainingSamples" -> Length[trainSamples],
    "RMSE" -> If[diffs === {}, Missing["NoHeldOutBins"], Sqrt[Mean[diffs^2]]],
    "Coverage95" -> If[covered === {}, Missing["NoHeldOutBins"], N[Mean[covered]]],
    "PosteriorPredictive" -> ppc,
    "TotalSimulations" -> smc["TotalSimulations"]
  |>
];

(* --- prior and dairying-onset sensitivity analysis --- *)

ModifiedPriorSpec[changes_Association] := Join[$PriorSpec, changes];

$SensitivityScenarios = <|
  "Baseline" -> <|"PriorChanges" -> <||>, "OnsetShiftYears" -> 0|>,
  "NarrowSelection" -> <|
    "PriorChanges" -> <|"SelectionBase" -> {0.0, 0.008}, "SelectionDairying" -> {0.0, 0.03}|>,
    "OnsetShiftYears" -> 0|>,
  "WideMigration" -> <|"PriorChanges" -> <|"Migration" -> {0.0, 0.03}|>, "OnsetShiftYears" -> 0|>,
  "EarlierDairying" -> <|"PriorChanges" -> <||>, "OnsetShiftYears" -> -400|>,
  "LaterDairying" -> <|"PriorChanges" -> <||>, "OnsetShiftYears" -> 400|>
|>;

Options[RunSensitivityAnalysis] = {"Particles" -> 150, "Generations" -> 4, "Seed" -> 90210};

RunSensitivityAnalysis[samples_List, OptionsPattern[]] := Module[{rows},
  rows = Flatten@Table[
    Module[{scenario, spec, scenarioGrid, smc, quantiles},
      scenario = $SensitivityScenarios[name];
      spec = ModifiedPriorSpec[scenario["PriorChanges"]];
      scenarioGrid = BuildEuropeGrid[4, scenario["OnsetShiftYears"]];
      smc = RunSMCABC[samples, scenarioGrid,
        "Particles" -> OptionValue["Particles"],
        "Generations" -> OptionValue["Generations"],
        "Seed" -> OptionValue["Seed"] + StringLength[name],
        "PriorSpec" -> spec];
      quantiles = PosteriorParameterQuantiles[smc,
        {{"Lower95", 0.025}, {"Median", 0.5}, {"Upper95", 0.975}}];
      Map[
        Join[<|"Scenario" -> name|>, #] &,
        Select[quantiles,
          MemberQ[{"Log10InitialFrequency", "SelectionBase", "SelectionDairying", "Migration"},
            #["Parameter"]] &]
      ]
    ],
    {name, Keys[$SensitivityScenarios]}
  ];
  rows
];

SensitivityFigure[rows_List] := Module[
  {params = {"SelectionBase", "SelectionDairying", "Migration"}, scenarios, panels},
  scenarios = DeleteDuplicates[rows[[All, "Scenario"]]];
  panels = Table[
    Module[{sub, xmax, xticks},
      sub = Select[rows, #["Parameter"] === p &];
      xmax = Max[sub[[All, "Upper95"]]];
      xticks = N[FindDivisions[{0, 1.05 xmax}, 4]];
      Graphics[
        Table[
          Module[{row},
            row = SelectFirst[sub, #["Scenario"] === scenarios[[k]] &, Missing["NotFound"]];
            If[MissingQ[row], {},
              {Directive[$PosteriorColor, AbsoluteThickness[2.2]],
               Line[{{row["Lower95"], k}, {row["Upper95"], k}}],
               PointSize[0.025], Point[{row["Median"], k}]}
            ]
          ],
          {k, Length[scenarios]}
        ],
        Frame -> True, Axes -> False,
        FrameTicks -> {{Table[{k, scenarios[[k]]}, {k, Length[scenarios]}], None}, {xticks, None}},
        PlotLabel -> Style[p, 11],
        PlotRange -> {{-0.02 xmax, 1.1 xmax}, {0.4, Length[scenarios] + 0.6}},
        LabelStyle -> Directive[Black, 9.5],
        ImageSize -> 400,
        AspectRatio -> 0.75
      ]
    ],
    {p, params}
  ];
  GraphicsRow[panels, Spacings -> 0.4]
];

ExportSensitivityOutputs[root_String, rows_List] := Module[{file, fig},
  file = FileNameJoin[{root, "data", "processed", "sensitivity_posterior_quantiles.csv"}];
  ExportRows[file, rows];
  fig = FileNameJoin[{root, "figures", "generated", "sensitivity_intervals.png"}];
  Export[fig, SensitivityFigure[rows], ImageResolution -> 160];
  <|"SensitivityFile" -> file, "SensitivityFigure" -> fig|>
];


(* ------------------------------------------------------------------ *)
(* Cinematic hero animation: single-panel posterior time-lapse with   *)
(* year badge, progress bar, sample dots, and an uncertainty inset.   *)
(* All frames are pure raster composition over one cached base map,   *)
(* so 80+ frames render in seconds.                                   *)
(* ------------------------------------------------------------------ *)

$UncertaintyColorFunction = (Blend[
   {RGBColor[0.98, 0.98, 0.98], RGBColor[1.0, 0.88, 0.18],
    RGBColor[1.0, 0.42, 0.04], RGBColor[0.70, 0.0, 0.70]}, #] &);

FormatYearLabel[bp_?NumericQ] := Module[{yr = Round[1950 - bp]},
  If[yr < 0, ToString[-yr] <> " BC", "AD " <> ToString[Max[yr, 1]]]
];

AugmentedCellStats[posterior_List, grid_List, knotTimes_List] := Module[{raw},
  raw = PosteriorCellStats[posterior, grid, knotTimes];
  Association @ Table[
    t -> <|
      "Mean" -> raw[t]["Mean"],
      "Width" -> raw[t]["Upper95"] - raw[t]["Lower95"]
    |>,
    {t, knotTimes}
  ]
];

InterpolatedCellStat[stats_Association, knotTimes_List, t_?NumericQ, prop_String] := Module[
  {pos, t1, t2, w},
  If[t >= First[knotTimes], Return[stats[First[knotTimes]][prop]]];
  If[t <= Last[knotTimes], Return[stats[Last[knotTimes]][prop]]];
  pos = LengthWhile[knotTimes, # > t &];
  t1 = knotTimes[[pos]]; t2 = knotTimes[[pos + 1]];
  w = (t1 - t)/(t1 - t2);
  (1 - w) stats[t1][prop] + w stats[t2][prop]
];

YearBadge[t_?NumericQ, widthPx_Integer] := Rasterize[
  Framed[
    Style[FormatYearLabel[t], White, Bold, FontSize -> 34, FontFamily -> "Helvetica"],
    Background -> GrayLevel[0.1, 0.62], RoundingRadius -> 8,
    FrameStyle -> None, FrameMargins -> {{16, 16}, {8, 8}}],
  "Image", Background -> None];

CaptionStrip[text_String] := Rasterize[
  Framed[
    Style[text, White, FontSize -> 15, FontFamily -> "Helvetica"],
    Background -> GrayLevel[0.1, 0.55], RoundingRadius -> 6,
    FrameStyle -> None, FrameMargins -> {{10, 10}, {5, 5}}],
  "Image", Background -> None];

ProgressBarImage[fraction_?NumericQ, width_Integer, barHeight_Integer: 8] := Module[
  {filled = Clip[Round[fraction width], {1, width}], row},
  row = Join[
    ConstantArray[{0.20, 0.45, 0.72}, filled],
    ConstantArray[{0.82, 0.84, 0.86}, width - filled]
  ];
  Image[ConstantArray[row, barHeight]]
];

HeroFrame[t_?NumericQ, stats_Association, knotTimes_List, support_Association,
  samples_List, w_Integer, h_Integer] := Module[
  {means, widths, base, overlay, composed, pts, inset, badge, caption, bar},
  means = InterpolatedCellStat[stats, knotTimes, t, "Mean"];
  widths = InterpolatedCellStat[stats, knotTimes, t, "Width"];
  base = BaseMapRaster[w];
  overlay = FieldOverlayImage[support, means, (ColorData["TemperatureMap"][#] &), {0, 0.5}, 0.92, w, h];
  composed = ImageCompose[base, overlay];
  pts = SamplePointsRaster[SamplesInWindow[samples, t, 400], w, h];
  If[ImageQ[pts], composed = ImageCompose[composed, pts]];
  inset = ImagePad[
    ImageResize[
      ImageCompose[base,
        FieldOverlayImage[support, widths, $UncertaintyColorFunction, {0, 1}, 0.92, w, h]],
      Round[0.28 w]],
    3, White];
  composed = ImageCompose[composed, inset,
    {w - ImageDimensions[inset][[1]]/2 - 14, ImageDimensions[inset][[2]]/2 + 26}];
  caption = CaptionStrip["95% credible-interval width"];
  composed = ImageCompose[composed, caption,
    {w - ImageDimensions[caption][[1]]/2 - 20,
     ImageDimensions[inset][[2]] + ImageDimensions[caption][[2]]/2 + 34}];
  badge = YearBadge[t, Round[0.19 w]];
  composed = ImageCompose[composed, badge,
    {ImageDimensions[badge][[1]]/2 + 20, h - ImageDimensions[badge][[2]]/2 - 18}];
  composed = RemoveAlphaChannel[composed, White];
  bar = ProgressBarImage[(8000. - t)/8000., w];
  ImageCompose[composed, bar, {w/2, 8}]
];

Options[ExportHeroAnimation] = {
  "StartBP" -> 8000, "FrameStepYears" -> 100, "Width" -> 1280,
  "SecondsPerFrame" -> 0.12, "HoldFrames" -> 10
};

ExportHeroAnimation[root_String, samples_List, grid_List, posterior_List, OptionsPattern[]] := Module[
  {figDir, knotTimes, stats, support, frameTimes, w, h, frames, gifFrames,
   mp4File, gifFile, iCloudMP4, iCloudGIF, spf, hold},
  figDir = FileNameJoin[{root, "figures", "generated"}];
  w = OptionValue["Width"]; h = Round[w $MapAspect];
  spf = OptionValue["SecondsPerFrame"];
  hold = OptionValue["HoldFrames"];
  knotTimes = Range[OptionValue["StartBP"], 0, -250];
  stats = AugmentedCellStats[posterior, grid, knotTimes];
  support = KrigingSurfaceSupport[grid];
  frameTimes = Range[OptionValue["StartBP"], 0, -OptionValue["FrameStepYears"]];
  frames = Table[HeroFrame[t, stats, knotTimes, support, samples, w, h], {t, frameTimes}];
  frames = Join[frames, ConstantArray[Last[frames], hold]];
  mp4File = FileNameJoin[{figDir, "hero_lactase_persistence.mp4"}];
  ExportMP4FromFrames[mp4File, frames, spf];
  gifFrames = ImageResize[#, 720] & /@ frames[[1 ;; ;; 2]];
  gifFile = FileNameJoin[{figDir, "hero_lactase_persistence.gif"}];
  Export[gifFile, gifFrames, "DisplayDurations" -> 2 spf, AnimationRepetitions -> Infinity];
  iCloudMP4 = CopyVersionToICloud[mp4File, "hero_lactase_persistence"];
  iCloudGIF = CopyVersionToICloud[gifFile, "hero_lactase_persistence"];
  <|"HeroMP4" -> mp4File, "HeroGIF" -> gifFile,
    "ICloudHeroMP4" -> iCloudMP4, "ICloudHeroGIF" -> iCloudGIF|>
];

(* --- reconstruct a stored SMC result so notebooks evaluate fast --- *)

LoadOrRunSMCABC[root_String, samples_List, grid_List, opts___] := Module[
  {particlesFile, diagFile, rows, diag, spec, keys, vectors, weights, particles, obsData},
  particlesFile = FileNameJoin[{root, "data", "processed", "smc_particles.csv"}];
  diagFile = FileNameJoin[{root, "data", "processed", "smc_diagnostics.csv"}];
  If[! (FileExistsQ[particlesFile] && FileExistsQ[diagFile]),
    Return[RunSMCABC[samples, grid, opts]]
  ];
  rows = Map[Association, Normal[Import[particlesFile, "Dataset", HeaderLines -> 1]]];
  diag = Map[Association, Normal[Import[diagFile, "Dataset", HeaderLines -> 1]]];
  spec = $PriorSpec;
  keys = Keys[spec];
  vectors = Map[
    Function[row,
      Table[
        If[k === "Log10InitialFrequency", Log10[row["InitialFrequency"]], row[k]],
        {k, keys}
      ]
    ],
    rows
  ];
  weights = Normalize[rows[[All, "Weight"]], Total];
  particles = KeyDrop[#, "Weight"] & /@ rows;
  obsData = ExtendedObservedData[samples, grid];
  <|
    "ParticleVectors" -> vectors,
    "Particles" -> particles,
    "Weights" -> weights,
    "ParameterKeys" -> keys,
    "EpsilonHistory" -> diag[[All, "Epsilon"]],
    "AcceptanceHistory" -> diag[[All, "AcceptanceRate"]],
    "ESSHistory" -> DeleteMissing[diag[[All, "ESS"]]],
    "TotalSimulations" -> Missing["LoadedFromDisk"],
    "GenerationShortfall" -> False,
    "ObservedSummaries" -> obsData["Binned"],
    "PriorSpecUsed" -> spec
  |>
];


(* --- self-contained interactive explorers for the Community notebook --- *)

LogisticExplorer[samples_List] := Module[{binned, dataAssoc},
  binned = Select[RegionalBinnedFrequencies[samples],
    MemberQ[$AnalysisRegions, #Region] && #CalledAlleles >= 2 &];
  dataAssoc = Association @ Table[
    r -> Map[
      Join[{#TimeBinMidBP, #Frequency}, WilsonInterval[#DerivedAlleles, #CalledAlleles], {#CalledAlleles}] &,
      Select[binned, #Region == r &]],
    {r, $AnalysisRegions}];
  With[{data = dataAssoc, regions = $AnalysisRegions, colors = $RegionColors},
    Manipulate[
      Module[{pts = data[region], color = Lookup[colors, region, Black]},
        Show[
          Graphics[{
            {color, Opacity[0.5], AbsoluteThickness[1.4],
             Line[{{#[[1]], #[[3]]}, {#[[1]], #[[4]]}}] & /@ pts},
            {color, Opacity[0.95],
             Table[{PointSize[0.008 + 0.010 Sqrt[p[[5]]/250.]],
               Point[{p[[1]], p[[2]]}]}, {p, pts}]}
          }],
          Plot[1/(1 + Exp[-(alpha + beta (10000 - bp)/1000)]), {bp, 0, 10000},
            PlotStyle -> Directive[GrayLevel[0.2], AbsoluteThickness[1.8]]],
          Frame -> True, Axes -> False, AspectRatio -> 1/GoldenRatio,
          PlotRange -> {{0, 10000}, {-0.03, 1.02}},
          FrameLabel -> {"years BP", "derived-allele frequency"},
          PlotLabel -> Style["implied selection per generation \[TildeTilde] " <>
            ToString[NumberForm[beta 28/1000., {4, 3}]], 11.5],
          ImageSize -> 560, LabelStyle -> Directive[Black, 11]
        ]
      ],
      {{alpha, -9.5, "\[Alpha]"}, -16., 0.},
      {{beta, 0.9, "\[Beta] per kyr"}, 0., 2.5},
      {{region, "Mediterranean", "region"}, regions},
      SaveDefinitions -> False
    ]
  ]
];

DairyingCovariateExplorer[] := Manipulate[
  Plot[1/(1 + Exp[(t - onset)/scale]), {t, 0, 10000},
    PlotStyle -> Directive[RGBColor[0.153, 0.51, 0.64], AbsoluteThickness[2]],
    Frame -> True, Axes -> False,
    PlotRange -> {{0, 10000}, {-0.03, 1.03}},
    ScalingFunctions -> {"Reverse", None},
    FrameLabel -> {"years BP", "dairying covariate D(t)"},
    Epilog -> {GrayLevel[0.5], Dashed, Line[{{onset, -0.03}, {onset, 1.03}}],
      Text[Style["onset", 10, GrayLevel[0.35]], {onset, 0.95}]},
    ImageSize -> 520, LabelStyle -> Directive[Black, 11]],
  {{onset, 7600., "regional onset BP"}, 5000., 9000.},
  {{scale, 350., "smoothing scale (years)"}, 100., 900.},
  SaveDefinitions -> False
];

SpatialTimeExplorer[samples_List, grid_List, posterior_List, times_List: {}] := Module[
  {ts, support, stats, frames},
  ts = If[times === {}, Range[8000, 0, -1000], times];
  support = KrigingSurfaceSupport[grid];
  stats = PosteriorCellStats[posterior, grid, ts];
  frames = Table[
    Module[{w = 760, h, base, overlay, pts, composed},
      h = Round[w $MapAspect];
      base = BaseMapRaster[w];
      overlay = FieldOverlayImage[support, stats[t]["Mean"],
        (ColorData["TemperatureMap"][#] &), {0, 0.5}, 0.92, w, h];
      composed = ImageCompose[base, overlay];
      pts = SamplePointsRaster[SamplesInWindow[samples, t, 400], w, h];
      If[ImageQ[pts], composed = ImageCompose[composed, pts]];
      ImageResize[composed, 560]
    ],
    {t, ts}];
  With[{fr = frames, labels = (ToString[#] <> " years BP" &) /@ ts},
    Manipulate[
      Labeled[fr[[k]], Style[labels[[k]], Bold, 13], Top],
      {{k, 1, "time step"}, 1, Length[fr], 1},
      SaveDefinitions -> False
    ]
  ]
];


(* ------------------------------------------------------------------ *)
(* Point-source origin model: where and when did the allele start?    *)
(* ------------------------------------------------------------------ *)

$OriginDairyingLeadYears = 800.;

$OriginPriorSpec = <|
  "OriginLatitude" -> {36., 62.},
  "OriginLongitude" -> {-10., 34.},
  "OriginTimeBP" -> {6800., 9600.},
  "Log10InjectFrequency" -> {-3., -1.},
  "SelectionBase" -> {0.0, 0.015},
  "SelectionDairying" -> {0.0, 0.06},
  "Migration" -> {0.02, 0.6},
  "SelectionMultiplierBritishIsles" -> {0.8, 2.2},
  "SelectionMultiplierRhineDanube" -> {0.6, 1.8},
  "SelectionMultiplierMediterranean" -> {0.4, 1.4},
  "SelectionMultiplierBaltic" -> {0.8, 2.4}
|>;

Options[RunOriginSMCABC] = {"Particles" -> 800, "Generations" -> 6, "Seed" -> 19470}; 

RunOriginSMCABC[samples_List, grid_List, OptionsPattern[]] := RunSMCABC[
  samples, grid,
  "Particles" -> OptionValue["Particles"],
  "Generations" -> OptionValue["Generations"],
  "Seed" -> OptionValue["Seed"],
  "PriorSpec" -> $OriginPriorSpec
];

LoadOrRunOriginSMCABC[root_String, samples_List, grid_List, opts___] := Module[
  {particlesFile, diagFile, rows, diag, spec, keys, vectors, weights, particles, obsData, smc},
  particlesFile = FileNameJoin[{root, "data", "processed", "origin_smc_particles.csv"}];
  diagFile = FileNameJoin[{root, "data", "processed", "origin_smc_diagnostics.csv"}];
  If[! (FileExistsQ[particlesFile] && FileExistsQ[diagFile]),
    smc = RunOriginSMCABC[samples, grid, opts];
    ExportRows[particlesFile,
      MapThread[Append[#1, "Weight" -> #2] &, {smc["Particles"], smc["Weights"]}]];
    ExportRows[diagFile,
      Table[<|"Generation" -> k, "Epsilon" -> smc["EpsilonHistory"][[k]],
        "AcceptanceRate" -> smc["AcceptanceHistory"][[k]],
        "ESS" -> If[k <= Length[smc["ESSHistory"]], smc["ESSHistory"][[k]], Missing["NotAvailable"]]|>,
        {k, Length[smc["EpsilonHistory"]]}]];
    Return[smc]
  ];
  rows = Map[Association, Normal[Import[particlesFile, "Dataset", HeaderLines -> 1]]];
  diag = Map[Association, Normal[Import[diagFile, "Dataset", HeaderLines -> 1]]];
  spec = $OriginPriorSpec;
  keys = Keys[spec];
  vectors = Map[
    Function[row,
      Table[
        If[StringStartsQ[k, "Log10"], Log10[row[StringDrop[k, 5]]], row[k]],
        {k, keys}
      ]
    ],
    rows
  ];
  weights = Normalize[rows[[All, "Weight"]], Total];
  particles = KeyDrop[#, "Weight"] & /@ rows;
  obsData = ExtendedObservedData[samples, grid];
  <|
    "ParticleVectors" -> vectors, "Particles" -> particles, "Weights" -> weights,
    "ParameterKeys" -> keys,
    "EpsilonHistory" -> diag[[All, "Epsilon"]],
    "AcceptanceHistory" -> diag[[All, "AcceptanceRate"]],
    "ESSHistory" -> DeleteMissing[diag[[All, "ESS"]]],
    "TotalSimulations" -> Missing["LoadedFromDisk"],
    "GenerationShortfall" -> False,
    "ObservedSummaries" -> obsData["Binned"],
    "PriorSpecUsed" -> spec
  |>
];

(* Itan-style origin posterior density map: weighted kernel density of the
   posterior (origin longitude, latitude), rendered on the land-masked map
   with the weighted-median origin starred. *)

OriginPosteriorMode[smc_Association] := Module[
  {draws, pts, dist, latC, lonC, matrix, argmax},
  draws = ResamplePosterior[smc, 400];
  pts = {#["OriginLongitude"], #["OriginLatitude"]} & /@ draws;
  dist = SmoothKernelDistribution[pts, {2.6, 2.0}];
  latC = Table[la, {la, $EuropeGeoRange[[1, 2]] - 0.25, $EuropeGeoRange[[1, 1]] + 0.25, -0.5}];
  lonC = Table[lo, {lo, $EuropeGeoRange[[2, 1]] + 0.25, $EuropeGeoRange[[2, 2]] - 0.25, 0.5}];
  matrix = Table[PDF[dist, {lo, la}], {la, latC}, {lo, lonC}];
  argmax = First @ Position[matrix, Max[matrix]];
  {latC[[argmax[[1]]]], lonC[[argmax[[2]]]]}
];

OriginDensityMap[smc_Association, opts___] := Module[
  {draws, pts, dist, w, h, latC, lonC, matrix, maxd, colored, img, maskImg,
   overlay, base, medLat, medLon, starImg, composed},
  draws = ResamplePosterior[smc, 400];
  pts = {#["OriginLongitude"], #["OriginLatitude"]} & /@ draws;
  dist = SmoothKernelDistribution[pts, {2.6, 2.0}];
  w = $MapPixelWidth; h = Round[w $MapAspect];
  latC = Table[la, {la, $EuropeGeoRange[[1, 2]] - 0.25, $EuropeGeoRange[[1, 1]] + 0.25, -0.5}];
  lonC = Table[lo, {lo, $EuropeGeoRange[[2, 1]] + 0.25, $EuropeGeoRange[[2, 2]] - 0.25, 0.5}];
  matrix = Table[PDF[dist, {lo, la}], {la, latC}, {lo, lonC}];
  maxd = Max[matrix];
  colored = Map[
    List @@ ColorConvert[
      Blend[{RGBColor[1, 1, 1], RGBColor[1.0, 0.85, 0.2], RGBColor[0.95, 0.45, 0.05],
        RGBColor[0.75, 0.05, 0.05]}, Clip[#/maxd, {0, 1}]^0.7], "RGB"] &,
    matrix, {2}];
  img = ImageResize[Image[colored], {w, h}];
  maskImg = LandMaskImage[w, h];
  overlay = SetAlphaChannel[img,
    ImageMultiply[maskImg,
      ImageResize[Image[Map[0.85 Clip[#/maxd, {0, 1}]^0.5 &, matrix, {2}]], {w, h}]]];
  base = BaseMapRaster[w];
  composed = ImageCompose[base, overlay];
  (* star the joint posterior mode (KDE argmax): for a broad, multimodal
     2D posterior the coordinate-wise medians can land between modes,
     which misleads as a location estimate *)
  With[{argmax = First @ Position[matrix, Max[matrix]]},
    medLat = latC[[argmax[[1]]]]; medLon = lonC[[argmax[[2]]]]];
  starImg = Rasterize[
    Graphics[{EdgeForm[Directive[Black, AbsoluteThickness[1.2]]], White,
      Polygon[Table[(1 - 0.6 Mod[k, 2]) {Sin[k Pi/5], Cos[k Pi/5]}, {k, 0, 9}]]},
      Background -> None, ImageSize -> 34], "Image", Background -> None];
  composed = ImageCompose[composed, starImg,
    {(medLon - $EuropeGeoRange[[2, 1]])/($EuropeGeoRange[[2, 2]] - $EuropeGeoRange[[2, 1]]) w,
     (medLat - $EuropeGeoRange[[1, 1]])/($EuropeGeoRange[[1, 2]] - $EuropeGeoRange[[1, 1]]) h}];
  Framed[
    Labeled[Image[composed, ImageSize -> 640],
      Style["Posterior density of the allele's origin (star: posterior mode)", 13, Bold, Black], Top],
    Background -> White, FrameStyle -> None, FrameMargins -> 4]
];

(* Spread video from the fitted origin: posterior-mean field over origin
   draws, hero-style frames with the median origin starred. *)

ExportOriginSpread[root_String, samples_List, grid_List, smc_Association, OptionsPattern[]] := Module[
  {figDir, draws, knotTimes, stats, support, frameTimes, w, h, frames,
   medLat, medLon, starImg, gifFrames, mp4File, gifFile, iCloudMP4, iCloudGIF, startBP},
  figDir = FileNameJoin[{root, "figures", "generated"}];
  draws = ResamplePosterior[smc, 100];
  startBP = 9600;
  knotTimes = Range[startBP, 0, -200];
  stats = AugmentedCellStats[draws, grid, knotTimes];
  support = KrigingSurfaceSupport[grid];
  w = 1280; h = Round[w $MapAspect];
  {medLat, medLon} = OriginPosteriorMode[smc];
  starImg = Rasterize[
    Graphics[{EdgeForm[Directive[Black, AbsoluteThickness[1.4]]], White,
      Polygon[Table[(1 - 0.6 Mod[k, 2]) {Sin[k Pi/5], Cos[k Pi/5]}, {k, 0, 9}]]},
      Background -> None, ImageSize -> 40], "Image", Background -> None];
  frameTimes = Range[startBP, 0, -100];
  frames = Table[
    Module[{fr = HeroFrame[t, stats, knotTimes, support, samples, w, h]},
      ImageCompose[fr, starImg,
        {(medLon - $EuropeGeoRange[[2, 1]])/($EuropeGeoRange[[2, 2]] - $EuropeGeoRange[[2, 1]]) w,
         (medLat - $EuropeGeoRange[[1, 1]])/($EuropeGeoRange[[1, 2]] - $EuropeGeoRange[[1, 1]]) h}]
    ],
    {t, frameTimes}];
  frames = Join[frames, ConstantArray[Last[frames], 10]];
  mp4File = FileNameJoin[{figDir, "origin_spread.mp4"}];
  ExportMP4FromFrames[mp4File, frames, 0.11];
  gifFrames = ImageResize[#, 720] & /@ frames[[1 ;; ;; 2]];
  gifFile = FileNameJoin[{figDir, "origin_spread.gif"}];
  Export[gifFile, gifFrames, "DisplayDurations" -> 0.22, AnimationRepetitions -> Infinity];
  iCloudMP4 = CopyVersionToICloud[mp4File, "origin_spread"];
  iCloudGIF = CopyVersionToICloud[gifFile, "origin_spread"];
  <|"OriginSpreadMP4" -> mp4File, "OriginSpreadGIF" -> gifFile,
    "ICloudOriginMP4" -> iCloudMP4, "ICloudOriginGIF" -> iCloudGIF|>
];


(* Conditional fit-quality scan: hold every non-origin parameter at its
   weighted posterior median, place the point source in each land cell in
   turn, and map the resulting ABC distance. This separates what the DATA
   prefer from what the prior geometry contributes. *)

OriginFitSurface[samples_List, grid_List, smc_Association] := Module[
  {q, med, obsData, base, dists},
  q = PosteriorParameterQuantiles[smc];
  med[p_] := SelectFirst[q, #["Parameter"] === p &]["Median"];
  obsData = ExtendedObservedData[samples, grid];
  base = <|
    "OriginTimeBP" -> med["OriginTimeBP"],
    "InjectFrequency" -> 10^med["Log10InjectFrequency"],
    "SelectionBase" -> med["SelectionBase"],
    "SelectionDairying" -> med["SelectionDairying"],
    "Migration" -> med["Migration"],
    "SelectionMultiplierBritishIsles" -> med["SelectionMultiplierBritishIsles"],
    "SelectionMultiplierRhineDanube" -> med["SelectionMultiplierRhineDanube"],
    "SelectionMultiplierMediterranean" -> med["SelectionMultiplierMediterranean"],
    "SelectionMultiplierBaltic" -> med["SelectionMultiplierBaltic"]
  |>;
  dists = Table[
    ExtendedDistance[obsData,
      SimulateSpatialTrajectory[
        Join[base, <|"OriginLatitude" -> grid[[i, "Latitude"]],
          "OriginLongitude" -> grid[[i, "Longitude"]]|>], grid],
      grid],
    {i, Length[grid]}];
  dists
];

OriginFitSurfaceMap[samples_List, grid_List, smc_Association] := Module[
  {dists, support, fitness},
  dists = OriginFitSurface[samples, grid, smc];
  support = KrigingSurfaceSupport[grid];
  fitness = Rescale[-dists];
  SpatialMap[grid, support, fitness, {},
    "Conditional fit quality by origin cell (yellow/red: best fit)",
    (ColorData["TemperatureMap"][#] &), 0.92, {0, 1}, "relative fit quality"]
];

End[];

EndPackage[];
