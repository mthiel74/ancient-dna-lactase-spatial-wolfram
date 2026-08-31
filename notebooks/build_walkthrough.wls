#!/usr/bin/env wolframscript
(* ::Package:: *)

(*  Build notebooks/LactasePersistenceSpatial.nb — a short, EVALUATED,
    house-styled walkthrough: package load, data retrieval, sample map,
    regional logistic reproduction. The full analysis lives in
    community/ancient_dna_lactase_persistence.nb.
    Every input is evaluated in this wolframscript kernel and its
    typeset output embedded with matching In/Out labels.  *)

repoRoot = ParentDirectory @ DirectoryName[$InputFileName];
outNb = FileNameJoin[{repoRoot, "notebooks", "LactasePersistenceSpatial.nb"}];

SetDirectory[repoRoot];
Get[FileNameJoin[{repoRoot, "src", "LactasePersistenceSpatial.wl"}]];

$HouseBlue = RGBColor[0.153, 0.51, 0.64];
houseStyles = Notebook[{
  Cell[StyleData[StyleDefinitions -> "Default.nb"]],
  Cell[StyleData["Text"], CellMargins -> {{0, 10}, {7, 8}}],
  Cell[StyleData["Title"], CellMargins -> {{0, 3}, {15, 0}},
    FontFamily -> "Roboto Condensed", FontColor -> $HouseBlue],
  Cell[StyleData["Section"], CellMargins -> {{0, 3}, {10, 18}},
    FontFamily -> "Roboto Condensed", FontSize -> 30, FontColor -> $HouseBlue],
  Cell[StyleData["Subtitle"], CellMargins -> {{0, 3}, {20, -10}}, FontSize -> 17],
  Cell[StyleData["Input"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14],
  Cell[StyleData["Output"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14]},
  Visible -> False, StyleDefinitions -> "PrivateStylesheetFormatting.nb"];

t[s_] := Cell[s, "Text"];
sec[s_] := Cell[s, "Section"];

$n = 0;
graphicalQ[e_] := MatchQ[e,
  _Graphics | _Legended | _Framed | _Image | _Labeled | _GraphicsGrid |
  _GraphicsRow | _GeoGraphics];

in[code_String] := Module[{res, k, inCell, outCell},
  $n++; k = $n;
  Print["  In[", k, "]"];
  res = ToExpression[code];
  inCell = Cell[code, "Input", CellLabel -> "In[" <> ToString[k] <> "]:="];
  If[res === Null, Return[inCell]];
  outCell = Which[
    MatchQ[res, _Manipulate],
      Cell[BoxData[ToBoxes[res]], "Output", CellLabel -> "Out[" <> ToString[k] <> "]="],
    graphicalQ[res],
      Cell[BoxData[ToBoxes[Rasterize[res, "Image", ImageResolution -> 110]]],
        "Output", CellLabel -> "Out[" <> ToString[k] <> "]=", TextAlignment -> Center],
    True,
      Cell[BoxData[ToBoxes[res]], "Output", CellLabel -> "Out[" <> ToString[k] <> "]="]
  ];
  Cell[CellGroupData[{inCell, outCell}, Open]]
];

inSilent[code_String] := Module[{k}, $n++; k = $n;
  Cell[code, "Input", CellLabel -> "In[" <> ToString[k] <> "]:="]];

cells = {
  Cell["Lactase persistence: data walkthrough", "Title"],
  Cell["Load the package, retrieve the public GLAD ancient rs4988235 \
workbook, and reproduce the regional frequency curves. The full spatial \
SMC-ABC analysis, validation, and animation live in \
community/ancient_dna_lactase_persistence.nb.", "Subtitle"],

  sec["1.  Setup"],
  t["The setup cell finds the companion package next to this notebook or \
in src/ of the cloned repository, and anchors all paths at that folder."],
  inSilent["nbdir = NotebookDirectory[];\nroot = If[FileExistsQ[FileNameJoin[{ParentDirectory[nbdir], \"src\", \"LactasePersistenceSpatial.wl\"}]],\n   ParentDirectory[nbdir], nbdir];\nSetDirectory[root];\nGet[First[Select[\n   {FileNameJoin[{root, \"src\", \"LactasePersistenceSpatial.wl\"}],\n    FileNameJoin[{nbdir, \"LactasePersistenceSpatial.wl\"}]}, FileExistsQ]]];"],

  sec["2.  Data"],
  t["Download (once, with checksum and provenance) and parse the workbook: \
2,999 rows; kept are the samples with a genotype call at rs4988235 plus \
usable age and coordinates. A and strand-flipped T count as derived, G/C as \
ancestral; pseudo-haploid calls contribute one allele."],
  in["raw = RetrieveRawData[Directory[]];\nprocessed = WriteProcessedData[Directory[], raw];\nsamples = processed[\"CalledSamples\"];\nLength[samples]"],
  in["Counts[#[\"Region\"] & /@ samples]"],
  in["GeoListPlot[GeoPosition[{#[\"Latitude\"], #[\"Longitude\"]} & /@ samples],\n GeoRange -> {{34, 63}, {-12, 36}}, GeoProjection -> \"Equirectangular\",\n PlotStyle -> Directive[Opacity[0.45], RGBColor[0.153, 0.51, 0.64], PointSize[0.005]],\n GeoBackground -> GeoStyling[{\"CountryBorders\", \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 600]"],

  sec["3.  Regional logistic reproduction"],
  t["Binomial logistic trajectories per region, fitted on every called \
allele (bins are display-only, with 95% Wilson intervals and point area \
proportional to allele count). Standard errors from the numerical Hessian; \
boundary hits are flagged."],
  in["fits = FitAllRegionalLogistics[samples];\nDataset[fits]"],
  in["out = ExportRegionalFitOutputs[Directory[], samples, fits];\nImport[out[\"RegionalFigure\"]]"],
  in["LogisticExplorer[samples]"],

  sec["4.  Where next"],
  t["The spatial diffusion-selection model, the SMC-ABC fit with its \
diagnostics, posterior predictive checks, held-out validation, prior \
sensitivity, the kriged maps, and the hero animation are all in \
community/ancient_dna_lactase_persistence.nb, built and evaluated by \
community/build_notebook.wls. The pipeline reruns end to end with \
scripts/run_pipeline.wls."]
};

TimeConstrained[
  UsingFrontEnd[
    nb = CreateDocument[cells, Visible -> False, WindowSize -> {1000, 800}];
    SetOptions[nb, StyleDefinitions -> houseStyles];
    NotebookSave[nb, outNb];
    Print["wrote evaluated ", outNb, " (", FileByteCount[outNb], " B)"];
    NotebookClose[nb];
  ],
  900,
  Print["warn: timed out"]
];
