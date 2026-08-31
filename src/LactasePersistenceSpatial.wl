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

ExportMP4FromGIF[gifFile_String, mp4File_String, frames_List] := Module[
  {ffmpeg, exitCode, fallback},
  ffmpeg = FindFFmpeg[];
  If[! MissingQ[ffmpeg],
    If[FileExistsQ[mp4File], DeleteFile[mp4File]];
    exitCode = Quiet@RunProcess[
      {ffmpeg, "-y", "-i", gifFile, "-movflags", "faststart", "-pix_fmt", "yuv420p", mp4File},
      "ExitCode"
    ];
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
  {data, objective, sol, alpha, beta, ll},
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
    NMaximize[{objective[a, b], -12 <= a <= 2 && -2 <= b <= 6}, {a, b},
      Method -> {"NelderMead", "RandomSeed" -> 123}],
    $Failed
  ];
  If[sol === $Failed,
    <|"Region" -> region, "Status" -> "Failed", "SampleCount" -> Length[data]|>,
    ll = sol[[1]];
    alpha = a /. sol[[2]];
    beta = b /. sol[[2]];
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
    Module[{points, fit, curve},
      points = ({#TimeBinMidBP, #Frequency} & /@ Select[binned, #Region == region &]);
      fit = Lookup[fitAssoc, region, <|"Status" -> "Missing"|>];
      curve = If[Lookup[fit, "Status", ""] == "OK",
        Plot[
          LogisticProbability[fit["Alpha"], fit["BetaPerKyrTowardPresent"], bp],
          {bp, 0, 10000},
          PlotStyle -> {Blue, Thick},
          PlotRange -> {0, 1}
        ],
        Graphics[{}]
      ];
      Show[
        ListPlot[
          points,
          PlotStyle -> {Black, PointSize[0.018]},
          PlotRange -> {{0, 10000}, {0, 1}},
          Frame -> True,
          Axes -> False,
          FrameLabel -> {"years BP", "LP-derived allele frequency"},
          PlotLabel -> region,
          ImageSize -> 430
        ],
        curve,
        GridLines -> Automatic
      ]
    ],
    {region, regions}
  ];
  Export[figFile, GraphicsGrid[Partition[plots, 2], Spacings -> {0.5, 0.8}], ImageResolution -> 160];
  <|"RegionalFitFile" -> fitFile, "RegionalFigure" -> figFile|>
];

BuildEuropeGrid[step_: 4] := Module[{cells, id = 0},
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
            "DairyingOnsetBP" -> DairyingOnsetBP[region],
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
  cells
];

BuildNeighborList[grid_List, step_: 4] := Module[{positions, index},
  positions = ({#["Latitude"], #["Longitude"]} & /@ grid);
  index = AssociationThread[positions, Range[Length[positions]]];
  Table[
    DeleteMissing[
      Lookup[index, ({grid[[i, "Latitude"]] + #[[1]], grid[[i, "Longitude"]] + #[[2]]} & /@
          {{step, 0}, {-step, 0}, {0, step}, {0, -step}}), Missing["NoNeighbor"]]
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
  {gens, sBase, sDairy, migration, dairy, multipliers, selection, movement},
  gens = dtYears/28.0;
  sBase = Lookup[params, "SelectionBase", 0.0];
  sDairy = Lookup[params, "SelectionDairying", 0.02];
  migration = Lookup[params, "Migration", 0.002];
  dairy = DairyCovariate[#, bp] & /@ grid[[All, "DairyingOnsetBP"]];
  multipliers = RegionSelectionMultiplier[params, #] & /@ grid[[All, "Region"]];
  selection = gens (sBase + sDairy dairy multipliers) freqs (1 - freqs);
  movement = gens migration Table[
      If[neighbors[[i]] === {}, 0, Mean[freqs[[neighbors[[i]]]] - freqs[[i]]]],
      {i, Length[freqs]}
    ];
  Clip[freqs + selection + movement, {0.000001, 0.999999}]
];

Options[SimulateSpatialTrajectory] = {"StartBP" -> 10000, "EndBP" -> 0, "TimeStepYears" -> 250};

SimulateSpatialTrajectory[params_Association, grid_List, OptionsPattern[]] := Module[
  {start, end, dt, times, neighbors, freqs, snapshots},
  start = OptionValue["StartBP"];
  end = OptionValue["EndBP"];
  dt = OptionValue["TimeStepYears"];
  times = Range[start, end, -dt];
  neighbors = BuildNeighborList[grid, Lookup[First[grid], "StepDegrees", 4]];
  freqs = InitialFrequencies[grid, params];
  snapshots = {freqs};
  Do[
    freqs = SpatialStep[freqs, grid, neighbors, params, times[[k]], dt];
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

SamplePrior[] := <|
  "InitialFrequency" -> 10^RandomReal[{-4.2, -1.5}],
  "InitialLatitudeGradient" -> RandomReal[{-0.008, 0.012}],
  "InitialLongitudeGradient" -> RandomReal[{-0.008, 0.008}],
  "SelectionBase" -> RandomReal[{0.0, 0.012}],
  "SelectionDairying" -> RandomReal[{0.0, 0.04}],
  "Migration" -> RandomReal[{0.0, 0.015}],
  "SelectionMultiplierBritishIsles" -> RandomReal[{0.8, 2.2}],
  "SelectionMultiplierRhineDanube" -> RandomReal[{0.6, 1.8}],
  "SelectionMultiplierMediterranean" -> RandomReal[{0.4, 1.4}],
  "SelectionMultiplierBaltic" -> RandomReal[{0.8, 2.4}]
|>;

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
  range_: 7.5,
  nugget_: 0.03
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
  range_: 7.5,
  nugget_: 0.03
] := Module[
  {numericValues = N[values], weightsFor},
  weightsFor[coord_] := First@OrdinaryKrigingWeights[coords, {coord}, range, nugget];
  Function[{coord}, Clip[weightsFor[coord].numericValues, {0, 1}]]
];

KrigingSurfaceSupport[grid_List, resolution_: 1.5] := Module[
  {latCenters, lonCenters, geoCoordinates, predictionCoords, dataCoords},
  latCenters = Range[$EuropeGeoRange[[1, 1]] + resolution/2, $EuropeGeoRange[[1, 2]] - resolution/2, resolution];
  lonCenters = Range[$EuropeGeoRange[[2, 1]] + resolution/2, $EuropeGeoRange[[2, 2]] - resolution/2, resolution];
  geoCoordinates = Flatten[Table[{lat, lon}, {lat, latCenters}, {lon, lonCenters}], 1];
  predictionCoords = GeoCoordinateToKrigingPoint /@ geoCoordinates;
  dataCoords = GeoCoordinateToKrigingPoint /@ ({#["Latitude"], #["Longitude"]} & /@ grid);
  <|
    "GeoCoordinates" -> geoCoordinates,
    "HalfStep" -> resolution/2,
    "Weights" -> OrdinaryKrigingWeights[dataCoords, predictionCoords]
  |>
];

KrigedSurfaceValues[support_Association, values_List] :=
  Clip[support["Weights"].N[values], {0, 1}];

GeoTile[{lat_, lon_}, value_, halfStep_, colorFunction_, opacity_, valueRange_] := {
  EdgeForm[None],
  FaceForm[Directive[
    colorFunction[Clip[Rescale[value, valueRange], {0, 1}]],
    Opacity[opacity]
  ]],
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

SpatialMap[grid_List, support_Association, values_List, samples_List, label_String, colorFunction_, opacity_: 0.58,
  valueRange_: {0, 1}, legendLabel_: "frequency"] := Module[
  {legendColorFunction},
  legendColorFunction = (colorFunction[Clip[Rescale[#, valueRange], {0, 1}]] &);
  Framed[
    Legended[
      GeoGraphics[
        Join[
          Flatten@KrigedSurfaceLayer[support, values, colorFunction, opacity, valueRange],
          GeoPointLayer[samples]
        ],
        GeoRange -> $EuropeGeoRange,
        GeoProjection -> "Equirectangular",
        GeoBackground -> "CountryBorders",
        GeoGridLines -> Automatic,
        GeoGridLinesStyle -> Directive[White, Opacity[0.16]],
        Background -> RGBColor[0.92, 0.94, 0.95],
        PlotLabel -> Style[label, 13, Bold, Black],
        ImageSize -> 610
      ],
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
  times = Range[8000, 0, -1000];
  stats = PosteriorCellStats[posterior, grid, times];
  krigingSupport = KrigingSurfaceSupport[grid, 1.5];
  meanCF = (Blend[
      {RGBColor[0.05, 0.12, 0.70], RGBColor[0.0, 0.78, 0.92],
       RGBColor[0.99, 0.83, 0.18], RGBColor[0.82, 0.12, 0.09]},
      #
    ] &);
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
      "Kriged posterior mean LP frequency, 3000 BP", meanCF, 0.68, {0, 0.30}, "mean frequency"],
    ImageResolution -> 160
  ];
  Export[
    uncertaintyMapFile,
    SpatialMap[grid, krigingSupport, uncertaintyValues, sampleWindow,
      "Kriged 95% interval width, 3000 BP", uncertaintyCF, 0.58, {0, 0.8}, "95% interval width"],
    ImageResolution -> 160
  ];
  frames = Table[
    Module[{mean = stats[t]["Mean"], width = stats[t]["Upper95"] - stats[t]["Lower95"], s = SamplesInWindow[samples, t, 500]},
      Rasterize[
        GraphicsGrid[
          {{
            SpatialMap[grid, krigingSupport, mean, s, "Kriged mean frequency, " <> ToString[t] <> " BP",
              meanCF, 0.68, {0, 0.30}, "mean frequency"],
            SpatialMap[grid, krigingSupport, width, s, "Kriged uncertainty width, " <> ToString[t] <> " BP",
              uncertaintyCF, 0.58, {0, 0.8}, "95% width"]
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
  Export[gifFile, frames, "DisplayDurations" -> 0.9, AnimationRepetitions -> Infinity];
  mp4File = ExportMP4FromGIF[
    gifFile,
    FileNameJoin[{figDir, "lactase_persistence_spatial_posterior.mp4"}],
    frames
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

WriteRunSummary[root_String, outputs_Association] := Module[{file, lines, path, rootClean, rootPrefix},
  file = FileNameJoin[{root, "docs", "run-summary.md"}];
  rootClean = If[StringEndsQ[root, $PathnameSeparator] && StringLength[root] > 1, StringDrop[root, -1], root];
  rootPrefix = rootClean <> $PathnameSeparator;
  path[key_String] := Module[{value = Lookup[outputs, key, ""]},
    If[StringQ[value],
      If[StringStartsQ[value, rootPrefix], StringDrop[value, StringLength[rootPrefix]], value],
      ToString[value, InputForm]
    ]
  ];
  lines = {
    "# Run Summary",
    "",
    "Generated: " <> DateString[Now, "ISODateTime"],
    "",
    "This is an executable baseline pipeline for the ancient lactase-persistence spatial model. It uses the public GLAD ancient genotype workbook derived from AADR v44.3 and fits a coarse regional and spatial model in Wolfram Language.",
    "",
    "## Key Outputs",
    "",
    "- Processed samples: `" <> path["CalledSamplesFile"] <> "`",
    "- Regional binned frequencies: `" <> path["BinnedFrequenciesFile"] <> "`",
    "- Regional logistic fits: `" <> path["RegionalFitFile"] <> "`",
    "- Regional reproduction figure: `" <> path["RegionalFigure"] <> "`",
    "- ABC posterior: `" <> path["PosteriorFile"] <> "`",
    "- Posterior predictive checks: `" <> path["PosteriorPredictiveFile"] <> "`",
    "- Spatial mean map: `" <> path["MeanMap"] <> "`",
    "- Spatial uncertainty map: `" <> path["UncertaintyMap"] <> "`",
    "- Spatial GIF animation: `" <> path["Animation"] <> "`",
    "- Spatial MP4 video: `" <> path["MP4"] <> "`",
    "- iCloud GIF copy: `" <> path["ICloudAnimation"] <> "`",
    "- iCloud MP4 copy: `" <> path["ICloudMP4"] <> "`",
    "",
    "## Scientific Status",
    "",
    "The regional logistic reproduction is a qualitative reproduction layer, not a claim of exact parameter identity with Evershed et al. 2022. The spatial model is deliberately coarse and is intended as a calibrated baseline for further refinement. The exported maps use ordinary kriging only as a geographic display layer over the coarse posterior grid."
  };
  Export[file, StringRiffle[lines, "\n"], "Text"];
  file
];

End[];

EndPackage[];
