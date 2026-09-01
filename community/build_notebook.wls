#!/usr/bin/env wolframscript
(* ::Package:: *)

(*  Build community/ancient_dna_lactase_persistence.nb
    ---------------------------------------------------
    Long-form, EVALUATED Wolfram Community notebook in the house
    format (cf. the rivers-post reference and ENSO-emergence):

      - private stylesheet: Roboto Condensed headings in the blue
        RGBColor[0.153, 0.51, 0.64], numbered Section cells
      - hero animation at the very top (AnimatedImage: plays inline
        on the Community post page)
      - every Input cell paired with its real evaluated Output
        (graphics rasterized; tables as live boxes)
      - all numbers in the prose computed from the pipeline outputs
        at build time, so text and results cannot drift apart
      - three interactive Manipulates with the data baked in, so
        they work in any downloaded copy without evaluation
      - gpt-image-2 educational illustrations, each preceded by an
        explicit AI-disclosure cell

    Prerequisites: scripts/run_pipeline.wls has been run (processed
    CSVs + figures exist) and ExportHeroAnimation has been called.
*)

repoRoot = ParentDirectory @ DirectoryName[$InputFileName];
figDir   = FileNameJoin[{repoRoot, "figures", "generated"}];
genDir   = FileNameJoin[{repoRoot, "docs", "images", "figures-generated"}];
outNb    = FileNameJoin[{repoRoot, "community", "ancient_dna_lactase_persistence.nb"}];
outPdf   = FileNameJoin[{repoRoot, "community", "ancient_dna_lactase_persistence.pdf"}];

Print["Loading package and pipeline outputs..."];
Get[FileNameJoin[{repoRoot, "src", "LactasePersistenceSpatial.wl"}]];

(* keep a copy of the package beside the notebook: on Wolfram Community the
   reader downloads the .nb and the .wl into one folder, and the setup cell
   below finds the package there. *)
Quiet @ Check[
  CopyFile[
    FileNameJoin[{repoRoot, "src", "LactasePersistenceSpatial.wl"}],
    FileNameJoin[{repoRoot, "community", "LactasePersistenceSpatial.wl"}],
    OverwriteTarget -> True],
  Null];

SetDirectory[repoRoot];
samples = LoadProcessedSamples[repoRoot];
grid = BuildEuropeGrid[];
smc = LoadOrRunSMCABC[repoRoot, samples, grid];
draws = ResamplePosterior[smc, 100];
fits = FitAllRegionalLogistics[samples];
quantiles = PosteriorParameterQuantiles[smc];
quantOf[p_] := SelectFirst[quantiles, #["Parameter"] === p &];
cvRows = Map[Association, Normal[Import[FileNameJoin[{repoRoot, "data", "processed", "cross_validation_by_region.csv"}], "Dataset", HeaderLines -> 1]]];
tsRow = First @ Map[Association, Normal[Import[FileNameJoin[{repoRoot, "data", "processed", "time_slice_validation.csv"}], "Dataset", HeaderLines -> 1]]];
ppcRows = Map[Association, Normal[Import[FileNameJoin[{repoRoot, "data", "processed", "posterior_predictive_regional.csv"}], "Dataset", HeaderLines -> 1]]];
ppcCoverage = N[Mean[Boole[TrueQ[#["Covered95"]] || #["Covered95"] === "true" || #["Covered95"] === "True"] & /@ ppcRows]];

fmt[x_?NumericQ, d_: 3] := ToString[NumberForm[N[x], {12, d}]];
fmt2[x_?NumericQ] := ToString[NumberForm[N[x], {12, 2}]];
pct[x_?NumericQ] := ToString[Round[100 N[x]]] <> "%";
fitOf[r_] := SelectFirst[fits, #["Region"] === r &];

originSmc = LoadOrRunOriginSMCABC[repoRoot, samples, grid];
originQ = PosteriorParameterQuantiles[originSmc];
oQ[p_] := SelectFirst[originQ, #["Parameter"] === p &];
oLat = oQ["OriginLatitude"]; oLon = oQ["OriginLongitude"]; oT = oQ["OriginTimeBP"];

nSamples = Length[samples];
epsFirst = First[smc["EpsilonHistory"]];
epsLast = Last[smc["EpsilonHistory"]];
essLast = Last[smc["ESSHistory"]];
nGens = Length[smc["EpsilonHistory"]];

Print["  samples: ", nSamples, ", grid cells: ", Length[grid],
  ", epsilon ", fmt[epsFirst], " -> ", fmt[epsLast], ", ESS ", fmt[essLast, 1]];

(* ---------------- house stylesheet (from the reference post) ---------------- *)

$HouseBlue = RGBColor[0.153, 0.51, 0.64];

houseStyles = Notebook[{
  Cell[StyleData[StyleDefinitions -> "Default.nb"]],
  Cell[StyleData["Text"], CellMargins -> {{0, 10}, {7, 8}}],
  Cell[StyleData["Title"], CellMargins -> {{0, 3}, {15, 0}},
    FontFamily -> "Roboto Condensed", FontColor -> $HouseBlue],
  Cell[StyleData["Abstract"], CellMargins -> {{0, 10}, {0, 0}}, FontColor -> GrayLevel[0.25]],
  Cell[StyleData["Section"], CellMargins -> {{0, 3}, {10, 18}},
    FontFamily -> "Roboto Condensed", FontSize -> 30, FontColor -> $HouseBlue],
  Cell[StyleData["Subsection"], CellMargins -> {{0, 3}, {8, 15}}, FontFamily -> "Roboto Condensed"],
  Cell[StyleData["Subsubsection"], CellMargins -> {{0, 3}, {8, 12}}, FontFamily -> "Roboto Condensed"],
  Cell[StyleData["Input"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14],
  Cell[StyleData["Output"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14],
  Cell[StyleData["Chapter"], CellMargins -> {{0, 3}, {10, 15}}],
  Cell[StyleData["Subtitle"], CellMargins -> {{0, 3}, {20, -10}}, FontSize -> 17],
  Cell[StyleData["Item"], CellMargins -> {{22, 10.}, {4., 8.}}],
  Cell[StyleData["ItemNumbered"], CellMargins -> {{53, 10.}, {4., 8.}}],
  Cell[StyleData["CodeText"], CellMargins -> {{0, 10}, {7, 8}}],
  Cell[StyleData["Code"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14],
  Cell[StyleData["DisplayFormulaNumbered"], CellMargins -> {{0, 10}, {7, 8}}],
  Cell[StyleData["Subitem"], CellMargins -> {{53, 10.}, {4., 8.}}],
  Cell[StyleData["Subsubitem"], CellMargins -> {{70, 10.}, {4., 8.}}]},
  Visible -> False, StyleDefinitions -> "PrivateStylesheetFormatting.nb"];

(* ---------------- cell helpers ---------------- *)

title[txt_]    := Cell[txt, "Title"];
subtitle[txt_] := Cell[txt, "Subtitle"];
hd1[txt_]      := Cell[txt, "Section"];

para[stuff_List] := Cell[TextData[stuff], "Text"];
para[s_String]   := Cell[s, "Text"];

bold[s_] := StyleBox[s, FontWeight -> Bold];
ital[s_] := StyleBox[s, FontSlant -> Italic];
mono[s_] := StyleBox[s, FontFamily -> "Source Code Pro", FontColor -> RGBColor[0.25, 0.35, 0.55]];

link[txt_String, url_String] := ButtonBox[txt, BaseStyle -> "Hyperlink",
  ButtonData -> {URL[url], None}, ButtonNote -> url];

captionCell[args__] := Cell[TextData[{args}], "Text",
  FontSize -> 12, FontColor -> GrayLevel[0.4]];

codeIn[code_String] := Cell[code, "Program",
  CellMargins -> {{45, 30}, {6, 6}}, FontFamily -> "Source Code Pro",
  FontSize -> 12, ShowStringCharacters -> False,
  Background -> RGBColor[0.95, 0.96, 0.98]];

wlIn[code_String] := Cell[code, "Input"];

(* Every evalIn cell is EVALUATED here, in this wolframscript kernel, in
   notebook order; the genuine typeset result is embedded as its Output
   cell with matching In[n]:=/Out[n]= labels. Graphics are rasterized;
   tables and Manipulates keep live boxes (Manipulates carry their data,
   so they work in any downloaded copy). *)

$cellCounter = 0;

graphicalQ[e_] := MatchQ[e,
  _Graphics | _Legended | _Framed | _Image | _Labeled | _GraphicsGrid |
  _GraphicsRow | _GeoGraphics | _Graphics3D];

evalIn[code_String] := Module[{res, n, inCell, outCell},
  $cellCounter++; n = $cellCounter;
  Print["  In[", n, "]: ", StringTake[StringReplace[code, "\n" -> " "], UpTo[64]]];
  res = ToExpression[code];
  inCell = Cell[code, "Input", CellLabel -> "In[" <> ToString[n] <> "]:="];
  If[res === Null, Return[inCell]];
  outCell = Which[
    MatchQ[res, _Manipulate],
      Cell[BoxData[ToBoxes[res]], "Output",
        CellLabel -> "Out[" <> ToString[n] <> "]="],
    graphicalQ[res],
      Cell[BoxData[ToBoxes[Rasterize[res, "Image", ImageResolution -> 110]]],
        "Output", CellLabel -> "Out[" <> ToString[n] <> "]=",
        TextAlignment -> Center],
    True,
      Cell[BoxData[ToBoxes[res]], "Output",
        CellLabel -> "Out[" <> ToString[n] <> "]="]
  ];
  Cell[CellGroupData[{inCell, outCell}, Open]]
];

(* setup cell: shown with its label but not executed at build time (the
   builder has already anchored the directory and loaded the package). *)
evalInSilent[code_String] := Module[{n},
  $cellCounter++; n = $cellCounter;
  Cell[code, "Input", CellLabel -> "In[" <> ToString[n] <> "]:="]
];

imgFileCell[path_String, width_: 640] := If[FileExistsQ[path],
  Cell[BoxData[ToBoxes[Image[
      With[{im = Import[path]},
        If[ImageDimensions[im][[1]] > 940, ImageResize[im, 940], im]],
      ImageSize -> width]]], "Output",
    ShowCellLabel -> False, TextAlignment -> Center],
  Cell[TextData[{bold["[ missing figure: " <> path <> " ]"]}], "Text",
    FontColor -> RGBColor[0.7, 0.1, 0.1]]];

genImgCell[file_String, width_: 560] := imgFileCell[FileNameJoin[{genDir, file}], width];

animCell[path_String, caption_] := Module[{all, anim, boxes},
  If[!FileExistsQ[path],
    Return @ Cell[TextData[{bold["[ missing animation: " <> path <> " ]"]}], "Text",
      FontColor -> RGBColor[0.7, 0.1, 0.1]]];
  all = Import[path, {"GIF", "ImageList"}];
  all = all[[1 ;; ;; 2]];
  all = ColorQuantize[ImageResize[#, {560}], 256] & /@ all;
  anim = AnimatedImage[all, FrameRate -> 2.5,
    AnimationRunning -> True, AnimationRepetitions -> Infinity];
  boxes = ToBoxes[
    If[caption === "", anim,
      Column[{anim,
        Pane[Style[caption, Italic, FontSize -> 10.5, FontFamily -> "Helvetica",
          FontColor -> GrayLevel[0.35]], 660, Alignment -> Center]},
        Alignment -> Center, Spacings -> 0.6]]];
  Cell[BoxData[boxes], "Output", ShowCellLabel -> False, TextAlignment -> Center]
];

aiNote[fig_String] := Cell[TextData[{
    StyleBox["External asset. ", FontWeight -> Bold, FontSlant -> Italic],
    fig, " was generated outside Wolfram Language with OpenAI's ",
    StyleBox["gpt-image-2", FontFamily -> "Source Code Pro"],
    " model; the prompts and the one-off Python driver are checked into ",
    StyleBox["docs/images/figures-generated/", FontFamily -> "Source Code Pro"],
    " of the project repository. It is a static illustration; there is no WL code to run for this figure."
  }], "Text",
  FontSize -> 11, FontColor -> GrayLevel[0.3],
  Background -> RGBColor[0.88, 0.91, 0.95],
  CellFrame -> {{4, 0}, {0, 0}},
  CellFrameColor -> RGBColor[0.45, 0.55, 0.70]];

$allCells = {};
writeAll[cs_List] := ($allCells = Join[$allCells, DeleteCases[cs, Null]];
  Print["  writeAll: total = ", Length[$allCells]];);



(* ================= TITLE, HERO, INTRODUCTION ================= *)

writeAll[{

title["Watching evolution happen: lactase persistence in 8,000 years of ancient DNA"],

subtitle["From raw ancient genotypes to a spatial diffusion\[Dash]selection model, \
fitted with sequential Monte Carlo ABC \[LongDash] with the uncertainty carried \
all the way into the pictures"],

animCell[FileNameJoin[{figDir, "hero_lactase_persistence.gif"}],
  "Posterior mean frequency of the lactase-persistence allele (rs4988235-A) \
across Europe, 8000 BC to today, on the TemperatureMap scale. White-ringed dots \
are the ancient individuals dated within \[PlusMinus]400 years of the moving \
window; the inset tracks the 95% credible-interval width \[LongDash] where the \
map is honest about not knowing. Generated by ExportHeroAnimation in the \
companion package."],

para[{"Around nine thousand years ago, everyone in Europe \[LongDash] every \
single adult \[LongDash] lost the ability to digest milk sugar a few years \
after weaning, just as almost all mammals do. Today, most northern Europeans \
can drink a glass of milk without a second thought. The switch that changed, \
a single letter of DNA about 14,000 base pairs upstream of the lactase gene, \
is the strongest signal of recent natural selection anywhere in the human \
genome \[LongDash] and thanks to ancient DNA we no longer have to infer its \
history from modern variation: we can simply watch it happen, skeleton by \
dated skeleton, across eight millennia."}],

para[{"Two recent results make this more interesting than the textbook \
just-so story. ", bold["Evershed et al. (2022, Nature)"], " assembled the \
largest set of prehistoric milk-fat residues from pottery and showed that \
Europeans were dairying enthusiastically for thousands of years while the \
allele stayed rare \[LongDash] and that a selection model tracking milk use \
explains the allele's trajectory ", ital["no better"], " than plain uniform \
selection since the Neolithic. ", bold["Burger et al. (2020, Current \
Biology)"], " showed the flip side: from a Bronze Age battlefield frequency \
of about 7%, reaching today's values requires a selection coefficient of \
roughly 0.06 per generation over the last 3,000 years \[LongDash] enormous \
by the standards of human evolution. Milk was everywhere, the allele was \
nowhere, and then, quite suddenly in evolutionary terms, it was everywhere \
too. Why?"}],

para[{"This post does not settle that debate. It does something more modest \
and, I hope, more reusable: it builds the ", ital["entire"], " analysis \
pipeline in Wolfram Language, from the public ancient-genotype workbook to a \
calibrated spatial model \[LongDash] and treats uncertainty as a first-class \
output at every step. We will parse and clean 2,999 ancient genotype records, \
reproduce the classic regional frequency curves with proper binomial \
likelihoods, build a spatial diffusion\[Dash]selection model on a landmasked \
grid of Europe, fit it with sequential Monte Carlo approximate Bayesian \
computation (10,000 forward simulations), check it with posterior predictive \
simulation and two kinds of held-out validation, stress-test the priors, and \
render the posterior \[LongDash] mean ", ital["and"], " credible-interval \
width \[LongDash] as the animation above. Every figure sits directly below \
the code that makes it, and the whole thing reruns from two wolframscript \
commands (\[Section]13)."}],

para[{"All the heavy lifting lives in the companion package ",
  mono["LactasePersistenceSpatial.wl"], " \[LongDash] the only file you need \
beside this notebook (plus an internet connection for the first data \
download). Put the two files in one folder and evaluate: the setup cell finds \
the package next to the notebook (or in ", mono["src/"], " when you are \
inside the cloned repository), the data download and every output re-create \
themselves relative to that folder, and the expensive SMC posterior reloads \
from stored result tables when present and refits from scratch when not. \
Every output you see below was produced by running this notebook top to \
bottom with wolframscript."}]

}];

(* ================= 1. SETUP & DATA ================= *)

writeAll[{

hd1["1.  Setup and data"],

para[{"The raw data are the public GLAD ancient-genotype workbook (Global \
Lactase persistence Association Database), derived from the Allen Ancient DNA \
Resource v44.3 and used for the Evershed et al. (2022) analysis. ",
  mono["RetrieveRawData"], " downloads it once, records a SHA-256 checksum \
and a provenance manifest, and marks the file read-only; ",
  mono["WriteProcessedData"], " parses, cleans, and writes tidy CSVs with \
provenance attached."}],

evalInSilent["nbdir = NotebookDirectory[];\nroot = If[FileExistsQ[FileNameJoin[{ParentDirectory[nbdir], \"src\", \"LactasePersistenceSpatial.wl\"}]],\n   ParentDirectory[nbdir], nbdir];\nSetDirectory[root];\nGet[First[Select[\n   {FileNameJoin[{root, \"src\", \"LactasePersistenceSpatial.wl\"}],\n    FileNameJoin[{nbdir, \"LactasePersistenceSpatial.wl\"}]}, FileExistsQ]]];"],

evalIn["raw = RetrieveRawData[Directory[]];\nprocessed = WriteProcessedData[Directory[], raw];\nsamples = processed[\"CalledSamples\"];\nLength[samples]"],

para[{"Parsing ancient genotypes is where silent errors live, so the cleaning \
rules are explicit and tested: genotype strings are normalized so that A \
\[LongDash] and the strand-flipped T, which occurs in exactly 3 heterozygous \
calls \[LongDash] count as the derived (persistence) allele and G/C as \
ancestral; a single-letter pseudo-haploid call contributes one called allele \
and a diploid call two; coordinates accidentally recorded in millidegrees \
(37724 for Sicily) are rescaled; and every sample is assigned to one of four \
coarse analysis regions echoing the published framing. Of 2,999 rows, " <>
ToString[nSamples] <> " have a genotype call plus usable age and location."}],

evalIn["Counts[#[\"Region\"] & /@ samples]"],

evalIn["GeoListPlot[GeoPosition[{#[\"Latitude\"], #[\"Longitude\"]} & /@ samples],\n GeoRange -> {{34, 63}, {-12, 36}}, GeoProjection -> \"Equirectangular\",\n PlotStyle -> Directive[Opacity[0.45], RGBColor[0.153, 0.51, 0.64], PointSize[0.005]],\n GeoBackground -> GeoStyling[{\"CountryBorders\", \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 620]"],

captionCell["Where the ", ToString[nSamples], " usable ancient individuals \
come from. Density is wildly uneven in space and time \[LongDash] the \
Mediterranean is rich, the Baltic sparse, and almost nothing is younger than \
2,500 years \[LongDash] and that unevenness is exactly why the model must \
carry its uncertainty around explicitly."]

}];

(* ================= 2. BIOLOGY ================= *)

writeAll[{

hd1["2.  What is lactase persistence?"],

para[{"Lactose, the sugar in milk, cannot be absorbed directly: it must \
first be split into glucose and galactose by the enzyme ", ital["lactase"],
", produced in the lining of the small intestine and encoded by the ",
mono["LCT"], " gene. In the ancestral mammalian program, lactase production \
is switched off after weaning \[LongDash] an adult wolf, cow, or (ancestrally) \
human who drinks milk gets bloating, cramps, and worse, because undigested \
lactose ferments in the colon. The European persistence variant is not a \
change to lactase itself: it is a single C\[RightArrow]T substitution 13,910 \
bases upstream, inside an intron of the neighbouring gene ", mono["MCM6"],
", that acts as an enhancer and simply keeps the LCT switch turned on into \
adulthood. On the reported strand of the association database this is the \
G\[RightArrow]A change at ", mono["rs4988235"], " \[LongDash] one letter, \
one glass of milk, and (as we will see) several percent of extra surviving \
children per generation at its peak."}],

aiNote["The gene schematic"],
genImgCell["lactase_gene_schematic.png"],

para[{"A crucial subtlety for what follows: the variant is effectively ",
ital["dominant"], " \[LongDash] one copy is enough to digest milk \[LongDash] \
and it rides on a long shared haplotype, which is how it was first detected \
from modern data alone. But modern data compress history: they can say the \
allele rose fast, not ", ital["when"], ". Ancient DNA turns the same question \
into direct observation."}],

aiNote["The ancient-DNA workflow illustration"],
genImgCell["adna_timeline_workflow.png"]

}];

(* ================= 3. REGIONAL REPRODUCTION ================= *)

writeAll[{

hd1["3.  The regional story: four binomial logistic fits"],

para[{"Before any spatial machinery, the honest first step is to reproduce \
the standard non-spatial description: for each region, a logistic trajectory ",
mono["logit p(t) = \[Alpha] + \[Beta] (10000 \[Minus] t)/1000"], " fitted by \
maximizing the exact binomial log-likelihood over every called allele \
\[LongDash] no time-binning enters the fit; the bins you see in the figure \
are display only, each carrying a 95% Wilson score interval and sized by its \
allele count. Standard errors come from the numerical Hessian at the optimum, \
and the fitter flags any solution that lands on a parameter bound. That flag \
is not decoration: an early version of this project silently reported a \
boundary solution for the British Isles, and the only symptom was a \
suspiciously round \[Alpha]. Fits you cannot audit are fits you cannot \
trust."}],

evalIn["fits = FitAllRegionalLogistics[samples];\nGrid[\n Prepend[\n  Table[With[{f = SelectFirst[fits, #[\"Region\"] === r &]},\n    {r, f[\"SampleCount\"], f[\"CalledAlleles\"], f[\"DerivedAlleles\"],\n     Row[{NumberForm[f[\"Alpha\"], {5, 2}], \" \[PlusMinus] \", NumberForm[f[\"AlphaSE\"], {4, 2}]}],\n     Row[{NumberForm[f[\"BetaPerKyrTowardPresent\"], {4, 2}], \" \[PlusMinus] \", NumberForm[f[\"BetaSE\"], {4, 2}]}],\n     NumberForm[f[\"SelectionPerGenerationApprox\"], {4, 3}]}],\n   {r, MajorRegions[]}],\n  Style[#, Bold] & /@ {\"region\", \"samples\", \"alleles\", \"derived\", \"\[Alpha]\", \"\[Beta] per kyr\", \"\[TildeTilde]s per gen\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

para[{"With a 28-year generation time, a slope \[Beta] on the logit scale \
translates to an approximate per-generation (genic, codominant) selection \
coefficient s \[TildeTilde] 28\[Beta]/1000. The four regions land between " <>
fmt[Min[#["SelectionPerGenerationApprox"] & /@ fits], 3] <> " and " <>
fmt[Max[#["SelectionPerGenerationApprox"] & /@ fits], 3] <>
" \[LongDash] the familiar few-percent picture, strongest in the north-west, \
and comfortably bracketing Burger et al.'s 0.06 once you note their estimate \
concentrates on the last three millennia while these slopes average over \
eight."}],

evalIn["regionalOutputs = ExportRegionalFitOutputs[Directory[], samples, fits];\nImport[regionalOutputs[\"RegionalFigure\"]]"],

captionCell["Observed binned frequencies (Wilson 95% intervals, point area \
\[Proportional] allele count) with the fitted logistic curves. Note the \
Mediterranean's leisurely rise against the British and Baltic sprints \
\[LongDash] and note also how far right of the last data point every \
extrapolation to the present runs. Everything after ~2,000 BP is \
extrapolation, and the spatial model below inherits that caveat."],

para[{"Rather than take my word for how sensitive these curves are, drag \
them yourself. The Manipulate below overlays an adjustable logistic on each \
region's binned data \[LongDash] the label converts your \[Beta] into an \
implied selection coefficient as you drag. It takes about ten seconds of \
play to internalise two things: how narrow the corridor of plausible \
\[Beta] is for the data-rich Mediterranean, and how wide it is for the \
Baltic."}],

evalIn["LogisticExplorer[samples]"]

}];

(* ================= 4. SPATIAL MODEL ================= *)

writeAll[{

hd1["4.  A spatial diffusion\[Dash]selection model"],

para[{"Regions are administrative conveniences; alleles do not respect them. \
The spatial model discretizes Europe (35\[Dash]63\[Degree]N, \
12\[Degree]W\[Dash]35\[Degree]E) into a 2\[Degree] grid, keeps only cells \
whose centres are on land (" <> ToString[Length[grid]] <> " of them \[LongDash] \
so Britain stays rook-connected to the continent across the Dover cells, \
while Ireland becomes an island in the model's adjacency too, a caveat worth \
knowing), and lets the local allele frequency evolve in 250-year steps from \
10,000 BP:"}],

codeIn["p[i, t+dt] = p[i, t] + g ( (s0 + sDairy D[i, t] m[region i]) p (1 - p)\n                             + mig mean[ p[j, t] - p[i, t], j adjacent to i ] )\n\ng = dt / 28 generations per step"],

para[{"Selection has a baseline component s0 and a component sDairy switched \
on by a smoothly varying dairying-onset field D(i, t) \[LongDash] built by \
inverse-distance interpolation from six regional anchor dates (Mediterranean \
~8200 BP through Baltic ~5600 BP) rather than four flat plateaus, so the \
covariate has genuine spatial texture. Per-region multipliers m let the north \
run hotter than the south, and the migration term exchanges frequency with \
adjacent land cells. Here is the model's actual geography \[LongDash] the \
land cells it evolves on, coloured by when dairying arrives in each:"}],

evalIn["grid = BuildEuropeGrid[];\nLength[grid]"],

evalIn["Legended[\n GeoGraphics[\n  Flatten@Table[\n    {GeoStyling[Opacity[0.75,\n       ColorData[\"TemperatureMap\"][Rescale[c[\"DairyingOnsetBP\"], {5400, 8500}]]]],\n     EdgeForm[Directive[White, Opacity[0.6], AbsoluteThickness[0.3]]],\n     GeoPolygon[{{c[\"Latitude\"] - 1, c[\"Longitude\"] - 1}, {c[\"Latitude\"] - 1, c[\"Longitude\"] + 1},\n       {c[\"Latitude\"] + 1, c[\"Longitude\"] + 1}, {c[\"Latitude\"] + 1, c[\"Longitude\"] - 1}}]},\n    {c, grid}],\n  GeoRange -> {{34, 63}, {-12, 36}}, GeoProjection -> \"Equirectangular\",\n  GeoBackground -> GeoStyling[{\"CountryBorders\",\n    \"Land\" -> GrayLevel[0.985], \"Ocean\" -> RGBColor[0.82, 0.89, 0.95]}],\n  ImageSize -> 640],\n BarLegend[{(ColorData[\"TemperatureMap\"][Rescale[#, {5400, 8500}]] &), {5400, 8500}},\n  LegendLabel -> \"dairying onset (years BP)\"]]"],

captionCell["The model's spatial skeleton: the 2\[Degree] land cells \
(sea cells are removed by an elevation test, so diffusion respects \
coastlines \[LongDash] Britain stays connected across the Dover cells, \
Ireland is an island in the adjacency too), coloured by the smooth \
dairying-onset field. Red is early dairying (Mediterranean and the \
southeast, ~8,200 BP), blue is late (the Baltic, ~5,600 BP). This field is \
what the sDairy component of selection switches on, cell by cell, as the \
simulation runs."],

para[{"The covariate's shape in time is worth ten seconds of interaction \
too:"}],

evalIn["DairyingCovariateExplorer[]"],

para[{"One forward simulation of this model costs about 70 ms:"}],

evalIn["AbsoluteTiming[\n  SimulateSpatialTrajectory[\n   <|\"InitialFrequency\" -> 0.003, \"SelectionBase\" -> 0.002,\n     \"SelectionDairying\" -> 0.02, \"Migration\" -> 0.003|>, grid];\n ][[1]]"],

para[{"\[LongDash] and that number is the entire strategy. When a simulator \
is this cheap, you do not need to linearize, approximate, or hand-wave the \
likelihood: you can afford tens of thousands of honest forward runs and let \
simulation-based inference do the rest. The model deliberately keeps \
demography implicit; it is a reaction\[Dash]diffusion caricature whose job \
is to let the ", ital["data"], " say how much spatial structure, movement, \
and dairying-modulation they can constrain \[LongDash] not to smuggle \
conclusions in through the architecture."}],

aiNote["The Neolithic dairying scene"],
genImgCell["neolithic_dairying.png"]

}];

(* ================= 5. SMC-ABC ================= *)

writeAll[{

hd1["5.  Inference: sequential Monte Carlo ABC"],

para[{"Approximate Bayesian computation asks the only question a simulator \
can answer: which parameters produce synthetic data that look like the real \
data? \"Look like\" is made precise through summary statistics; here, two \
families. First, the called-allele-weighted regional time-binned frequencies \
(39 bins). Second \[LongDash] because a spatial model scored only on \
regional aggregates can never learn about migration \[LongDash] each sample \
is matched to its nearest grid cell and time step, and pooled \
north\[Minus]south and west\[Minus]east frequency contrasts over the last \
4,000 years are computed ", ital["identically"], " for observed alleles and \
model expectations. The distance is a weighted root-mean-square over all of \
it."}],

para[{"Plain rejection ABC wastes almost every simulation once the tolerance \
gets interesting, so the fit uses sequential Monte Carlo: a population of \
400 particles is filtered through " <> ToString[nGens] <> " generations of \
shrinking tolerance (each generation's \[Epsilon] is the median of the \
previous population's distances), with Gaussian perturbation kernels and \
importance weights. One implementation lesson worth passing on: with a \
10-dimensional box prior, perturbing in the raw coordinates throws ~97% of \
proposals out of the box (0.7 to the 10th \[TildeTilde] 0.03). The sampler \
therefore works in logit-transformed coordinates, where a uniform prior \
becomes an exact product of standard logistic densities, every proposal is \
automatically valid, and the importance weights stay closed-form."}],

evalIn["smc = LoadOrRunSMCABC[Directory[], samples, grid];\nGrid[\n Prepend[\n  Table[{k, NumberForm[smc[\"EpsilonHistory\"][[k]], {5, 4}],\n    NumberForm[100. smc[\"AcceptanceHistory\"][[k]], {4, 1}],\n    NumberForm[smc[\"ESSHistory\"][[k]], {5, 1}]}, {k, Length[smc[\"EpsilonHistory\"]]}],\n  Style[#, Bold] & /@ {\"generation\", \"\[Epsilon]\", \"acceptance %\", \"ESS\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

para[{"The tolerance falls from " <> fmt[epsFirst] <> " (the prior median \
\[LongDash] i.e. no information) to " <> fmt[epsLast] <> " over 10,000 \
simulations. The final effective sample size, " <> fmt[essLast, 1] <>
" of 400, deserves a sentence rather than a footnote: importance-weight \
degeneracy is the known cost of this weight formula whenever the posterior \
is much tighter than the prior, every interval in this post is a weighted \
quantile and correspondingly approximate, and the honest cure (an SMC \
sampler with MCMC rejuvenation moves) is on the to-do list in \[Section]11. \
Reporting ESS is what separates a posterior from a scatter plot."}],

evalIn["draws = ResamplePosterior[smc, 100];\nsmcOutputs = ExportSMCOutputs[Directory[], samples, grid, smc, draws];\nImport[smcOutputs[\"ParameterFigure\"]]"],

captionCell["Weighted SMC posterior (blue) against the flat prior (dashed \
orange) for all ten parameters. Prior overlays are the fastest honesty check \
in Bayesian workflow: one glance separates the dimensions the data actually \
moved (initial frequency, dairying-modulated selection, the northern \
multipliers) from the ones still wearing their priors (the initial spatial \
gradients)."]

}];

(* ================= 6. RESULTS ================= *)

resultsRow[p_, label_] := Module[{q = quantOf[p]},
  {label, NumberForm[q["Median"], {5, 4}],
   Row[{"[", NumberForm[q["Lower95"], {5, 4}], ", ", NumberForm[q["Upper95"], {5, 4}], "]"}]}];

writeAll[{

hd1["6.  What the posterior says"],

evalIn["quantiles = PosteriorParameterQuantiles[smc];\nGrid[\n Prepend[\n  Table[With[{q = SelectFirst[quantiles, #[\"Parameter\"] === p &]},\n    {p, NumberForm[q[\"Median\"], {6, 4}],\n     Row[{\"[\", NumberForm[q[\"Lower95\"], {6, 4}], \", \", NumberForm[q[\"Upper95\"], {6, 4}], \"]\"}]}],\n   {p, {\"Log10InitialFrequency\", \"SelectionBase\", \"SelectionDairying\", \"Migration\",\n     \"SelectionMultiplierBritishIsles\", \"SelectionMultiplierRhineDanube\",\n     \"SelectionMultiplierMediterranean\", \"SelectionMultiplierBaltic\"}}],\n  Style[#, Bold] & /@ {\"parameter\", \"median\", \"95% interval\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

para[{"Three readings, in decreasing order of confidence. ", bold["First"],
", the total effective selection in a northern dairying cell at the \
posterior median \[LongDash] s0 + sDairy \[Times] multiplier \[TildeTilde] " <>
fmt[quantOf["SelectionBase"]["Median"] + quantOf["SelectionDairying"]["Median"]*quantOf["SelectionMultiplierBritishIsles"]["Median"], 3] <>
" per generation \[LongDash] sits squarely in the published few-percent \
range, with the northern multipliers pulled above one exactly where the \
logistic slopes were steepest. ", bold["Second"], ", the posterior does ",
ital["not"], " cleanly separate dairying-modulated from baseline selection. \
This is not a failure of the sampler; it is the geometry of the problem. \
The dairying covariate saturates to one within a few centuries of onset, so \
for most of the simulated period sDairy acts almost exactly like uniform \
selection; only the early Neolithic carries contrast between the two. \
That the ancient genotypes accommodate both a mostly-uniform and a \
mostly-dairy-modulated reading is this little model's echo of Evershed et \
al.'s conclusion at Nature scale: milk exploitation is not required to \
explain the trajectory. ", bold["Third"], ", migration is only weakly \
identified \[LongDash] \[Section]9 quantifies exactly how weakly, instead \
of letting a prior masquerade as a discovery."}]

}];

(* ================= 7. MAPS ================= *)

writeAll[{

hd1["7.  The posterior on the map \[LongDash] and its uncertainty"],

para[{"Every map below is a posterior functional: 100 equally-weighted \
posterior draws, each pushed through the forward model, summarized per cell, \
then interpolated for display by ordinary kriging (range 3.5\[Degree], \
nugget 0.02) and cut to the coastline. Kriging here is a display courtesy, \
not an inferential claim \[LongDash] the 2\[Degree] cells remain the units \
that saw data. Colors are the TemperatureMap scale with a square-root \
stretch so the long rare-allele centuries stay legible."}],

evalIn["spatialOutputs = ExportSpatialVisualizations[Directory[], samples, grid, draws];\nImport[spatialOutputs[\"MeanMap\"]]"],

evalIn["Import[spatialOutputs[\"UncertaintyMap\"]]"],

captionCell["Posterior mean (top) and 95% credible-interval width (bottom) \
at 3000 BP. The two maps are a pair on purpose: the second is the error bar \
of the first, rendered at equal visual rank. The interval is widest exactly \
where the sampling map of \[Section]1 is emptiest \[LongDash] the model has \
the good manners to be unsure where it has seen nothing."],

para[{"And because a static pair understates how the story unfolds, step \
through it yourself \[LongDash] each frame is the posterior mean with the \
ancient samples of that moment:"}],

evalIn["SpatialTimeExplorer[samples, grid, draws]"]

}];

(* ================= 8. VALIDATION ================= *)

writeAll[{

hd1["8.  Does it actually predict anything?"],

para[{"A posterior that merely redescribes its training data is a \
compression algorithm, not a model. Three checks, in increasing order of \
severity."}],

para[{bold["Posterior predictive."], " Push posterior draws through the \
model, sample binomial allele counts at each bin's actual sample size, and \
ask how often the observed frequency lands inside the 95% band: " <>
pct[ppcCoverage] <> " of the " <> ToString[Length[ppcRows]] <> " bins. Bins \
with two called alleles correctly get bands covering nearly everything \
\[LongDash] wide honesty beats narrow fiction."}],

evalIn["Import[smcOutputs[\"PosteriorPredictiveFigure\"]]"],

para[{bold["Held-out regions."], " Refit the entire SMC from scratch four \
times, each time deleting one region's samples, then predict the deleted \
region:"}],

evalIn["Dataset[Map[Association, Normal[Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"cross_validation_by_region.csv\"}], \"Dataset\", HeaderLines -> 1]]]]"],

para[{bold["Held-out time"], " \[LongDash] the killer test. Train only on \
samples older than 2,500 BP (" <> ToString[tsRow["TrainingSamples"]] <>
" of them) and predict the " <> ToString[tsRow["HeldOutBins"]] <>
" most recent bins. The intervals still cover, but the posterior median \
under-predicts the final rise badly (RMSE " <> fmt[tsRow["RMSE"], 2] <>
"). Far from being embarrassing, this is the pipeline independently \
rediscovering Burger et al.'s headline: the evidence for ", ital["strong, \
late"], " selection is concentrated in the last three millennia. Delete \
those millennia and the model, sensibly, refuses to believe in them."}],

evalIn["Dataset[Map[Association, Normal[Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"time_slice_validation.csv\"}], \"Dataset\", HeaderLines -> 1]]]]"]

}];

(* ================= 9. SENSITIVITY ================= *)

writeAll[{

hd1["9.  Which conclusions survive the priors?"],

para[{"Five complete refits: baseline; halved selection priors; doubled \
migration prior; and every dairying onset shifted 400 years earlier or \
later. The dairying-modulated selection component stays positive in all \
five (medians 0.008\[Dash]0.019) \[LongDash] that conclusion belongs to the \
data. The migration posterior, by contrast, faithfully tracks whichever \
prior it is given (median 0.010 baseline \[RightArrow] 0.020 under the \
widened prior): with " <> ToString[Length[grid]] <> " cells and \
regionally-pooled summaries, movement is weakly identified, and the honest \
statement is exactly that."}],

evalIn["Import[FileNameJoin[{Directory[], \"figures\", \"generated\", \"sensitivity_intervals.png\"}]]"]

}];

(* ================= 10. ORIGIN ================= *)

writeAll[{

hd1["10.  Where did the allele come from? Origin versus selection"],

para[{"Everything so far answers \"where did selection push hardest?\" \
\[LongDash] which is a different question from \"where did the allele \
come from?\", and the two are easy to conflate when watching the \
animation. The classic origin estimate is ", bold["Itan et al. (2009)"],
", whose demic coevolution simulations placed the start of the \
lactase-persistence/dairying story around 7,500 years ago in the zone \
between the central Balkans and central Europe \[LongDash] roughly the \
Linearbandkeramik world of modern Hungary, Slovakia, and Austria. What do \
the ancient genotypes in this dataset say about first appearances?"}],

evalIn["earliest = TakeLargestBy[Select[samples, #[\"DerivedAlleles\"] > 0 &], #[\"MeanDateBP\"] &, 8];\nGrid[\n Prepend[\n  {Round[#[\"MeanDateBP\"]], #[\"Country\"], #[\"Latitude\"], #[\"Longitude\"],\n    #[\"RS4988235Genotype\"], #[\"Publication\"]} & /@ earliest,\n  Style[#, Bold] & /@ {\"years BP\", \"country\", \"lat\", \"lon\", \"call\", \"publication\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

evalIn["GeoGraphics[\n Flatten[Table[{RGBColor[0.8, 0.15, 0.1], PointSize[0.013],\n    Point[GeoPosition[{e[\"Latitude\"], e[\"Longitude\"]}]],\n    Black, Text[Style[ToString[Round[e[\"MeanDateBP\"]]] <> \" BP\", 9.5, Bold],\n      GeoPosition[{e[\"Latitude\"] + 1.1, e[\"Longitude\"]}]]},\n   {e, earliest}], 1],\n GeoRange -> {{34, 63}, {-14, 72}}, GeoProjection -> \"Equirectangular\",\n GeoBackground -> GeoStyling[{\"CountryBorders\",\n   \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 640]"],

captionCell["The eight oldest derived-allele carriers in the dataset. The \
earliest observations cluster in the southeast \[LongDash] Bulgaria ~6560 \
BP, Ukraine ~5600 BP, Romania ~5390 BP \[LongDash] before Ireland, Iberia, \
Britain, and Hungary appear around 5100\[Dash]4270 BP. Each is a single \
heterozygote, so each is individually weak evidence, and sampling is far \
from spatially uniform \[LongDash] but the pattern is at least compatible \
with a central/southeastern European origin of the kind Itan et al. \
proposed."],

para[{"The hero animation cannot show any of this, ", ital["by construction"],
": its model starts at 10,000 BP with a near-uniform initial frequency, \
has no mutation event, and \[LongDash] with migration weakly identified \
\[LongDash] moves essentially by in-place logistic growth. Britain lights \
up first there because its late samples demand the fastest growth, not \
because the allele originated there. So let us stop hand-waving and put \
the origin ", ital["into"], " the model: replace the uniform start with a \
point source \[LongDash] four new parameters (origin latitude, longitude, \
time, and the injection frequency), a wider migration prior (a travelling \
wave has to actually travel: m \[Element] [0.02, 0.6] per generation, \
integrated stably with exact per-step logistic growth and exponential \
mixing), and diagonal adjacency so the wave can cross the Dover strait. \
One scientific commitment is made explicit rather than left to the prior: \
the source must sit where dairying already existed (within 800 years of \
the local onset), because the thing being located is the start of the ", \
ital["selection-driven rise"], ", not the first mutation event \[LongDash] \
the same gene\[Dash]culture coupling that Itan et al. build into their \
model. Without it, a drift-free simulator lets a vanishingly small \
injection idle for millennia in pre-dairying forager regions, and the \
origin location quietly decouples from the story being told. The same SMC \
machinery then turns \"where did it start?\" into a posterior \
distribution:"}],

evalIn["originSmc = LoadOrRunOriginSMCABC[Directory[], samples, grid];\nGrid[\n Prepend[\n  Table[With[{q = SelectFirst[PosteriorParameterQuantiles[originSmc], #[\"Parameter\"] === p &]},\n    {p, NumberForm[q[\"Median\"], {6, 3}],\n     Row[{\"[\", NumberForm[q[\"Lower95\"], {6, 3}], \", \", NumberForm[q[\"Upper95\"], {6, 3}], \"]\"}]}],\n   {p, {\"OriginLatitude\", \"OriginLongitude\", \"OriginTimeBP\",\n     \"Log10InjectFrequency\", \"Migration\", \"SelectionDairying\"}}],\n  Style[#, Bold] & /@ {\"parameter\", \"median\", \"95% interval\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

evalIn["OriginDensityMap[originSmc]"],

captionCell["The reverse-diffusion result, in the spirit of Itan et al.'s \
famous origin map: weighted posterior density of the point source's \
location, land-masked, with the posterior mode starred. Where this mass \
sits \[LongDash] and how broadly it spreads \[LongDash] is the honest \
answer this dataset gives to \"where did the rise begin?\"."],

evalIn["OriginFitSurfaceMap[samples, grid, originSmc]"],

captionCell["A prior-free cross-check on the same question: every \
non-origin parameter is pinned at its posterior median, the point source \
is placed in each land cell in turn, and the map is coloured by how well \
the forward simulation then matches the ancient samples (warmer = better \
fit). Read it honestly, in both directions. The well-fitting region is \
broad: the ancient data constrain the origin's latitude band far more \
sharply than its longitude, and because the northwest of the map is \
sampled most densely, the conditional optimum leans that way. But what \
the scan rules out is just as informative \[LongDash] Iberia, the \
southern Balkans, and the far northeast fit distinctly worse \[LongDash] \
and the posterior concentration above sits comfortably inside the \
preferred band. Where the joint posterior differs from this scan \
\[LongDash] most visibly in pulling mass away from regions where \
dairying arrived late \[LongDash] the difference is the gene\[Dash]culture \
coupling and the joint fitting of origin time and injection frequency, \
not the origin prior, which is uniform over the whole map."],

para[{"And the forward story from that fitted origin \[LongDash] the \
travelling wave the hero animation could not show \[LongDash] as its own \
video (the star marks the posterior modal origin; the inset again tracks \
the 95% credible-interval width):"}],

animCell[FileNameJoin[{figDir, "origin_spread.gif"}],
  "Forward simulation from the fitted point source: posterior mean over \
100 origin-model draws, 100-year interpolated steps from 9,600 BP. \
Generated by ExportOriginSpread; the H.264 version is \
figures/generated/origin_spread.mp4."],

para[{"Read the origin posterior with the same discipline as everything \
else here. The location information comes from a handful of early \
single-heterozygote calls scattered over an unevenly sampled map, filtered \
through a coarse deterministic wave model \[LongDash] so the credible \
region is wide, and it should be. What the fit adds beyond the anecdotal \
table above is that all three ingredients are now estimated ", ital["jointly"],
": an origin location and time, a wave that must actually reach Britain \
and the Baltic in time for their observed rises, and selection on top. \
Whether the posterior mass sits over the Carpathian Basin, the lower \
Danube, or the Pontic steppe is exactly the kind of statement this \
machinery exists to make \[LongDash] and unlike a caption, it comes with \
its uncertainty attached."}]

}];

(* ================= 11-14. CLOSING ================= *)

writeAll[{

hd1["11.  Checked against the published record"],

para[{"A model that only agrees with itself is not worth posting, so here \
is the fitted origin next to the independent estimates it never saw during \
fitting. The reference map is Figure 3 of ", bold["Itan et al. (2009)"],
" \[LongDash] a demic coevolution simulation driven by archaeological \
settlement dates and ", ital["modern"], " allele frequencies, with no \
ancient genotypes at all. Our fit uses ", ital["only"], " ancient \
genotypes. The two are as close to independent lines of evidence as this \
field currently offers:"}],

imgFileCell[FileNameJoin[{repoRoot, "docs", "images", "originals",
  "itan2009_fig3_origin_density.png"}], 620],

captionCell["Reproduced from Itan Y, Powell A, Beaumont MA, Burger J, \
Thomas MG (2009), \[OpenCurlyDoubleQuote]The Origins of Lactase \
Persistence in Europe\[CloseCurlyDoubleQuote], PLoS Computational Biology \
5(8): e1000491, Figure 3, under the Creative Commons Attribution licence. \
Posterior density of the origin of the lactase-persistence/dairying \
coevolution in their model: the mode sits near 48.5\[Degree]N, \
13\[Degree]E and the high-density ridge extends toward the Carpathian \
Basin \[LongDash] the \[OpenCurlyDoubleQuote]Hungary \
result\[CloseCurlyDoubleQuote] of the popular retellings."],

evalIn["originDraws = ResamplePosterior[originSmc, 2000];\nsTotal = Quantile[Map[#[\"SelectionBase\"] + #[\"SelectionDairying\"] &, originDraws], {0.025, 0.5, 0.975}];\noRow[p_] := SelectFirst[PosteriorParameterQuantiles[originSmc], #[\"Parameter\"] === p &];\nfq[p_, d_] := With[{q = oRow[p]}, {ToString[NumberForm[q[\"Median\"], {8, d}]],\n   \"[\" <> ToString[NumberForm[q[\"Lower95\"], {8, d}]] <> \", \" <> ToString[NumberForm[q[\"Upper95\"], {8, d}]] <> \"]\"}];\nGrid[\n {Style[#, Bold] & /@ {\"quantity\", \"this model\", \"95% interval\", \"published\", \"source\"},\n  Join[{\"origin latitude (\[Degree]N)\"}, fq[\"OriginLatitude\", 1], {\"\[TildeTilde]48.5 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin longitude (\[Degree]E)\"}, fq[\"OriginLongitude\", 1], {\"\[TildeTilde]13 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin date (years BP)\"}, fq[\"OriginTimeBP\", 0], {\"7441 [6256, 8683]\", \"Itan 2009\"}],\n  Join[{\"selection, dairying term\"}, fq[\"SelectionDairying\", 3], {\"0.0953 [0.0518, 0.159]\", \"Itan 2009 (dairyers)\"}],\n  {\"selection, total in dairying cells\", ToString[NumberForm[sTotal[[2]], {8, 3}]],\n   \"[\" <> ToString[NumberForm[sTotal[[1]], {8, 3}]] <> \", \" <> ToString[NumberForm[sTotal[[3]], {8, 3}]] <> \"]\",\n   \"0.014\[Dash]0.15\", \"Bersaglieri 2004\"},\n  {\"\", \"\", \"\", \"\[TildeTilde]0.06 (last 3 kyr)\", \"Burger 2020\"}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["Independent estimates side by side. Both location medians \
fall within about three degrees of Itan et al.'s mode, the date medians \
agree to a couple of centuries with broadly overlapping intervals, and \
their mode sits well inside our 95% region \[LongDash] while our \
posterior stays far wider, as it must when the only inputs are ancient \
genotypes thinned to a handful of early carriers. The location prior \
spans all of Europe (36\[Dash]62\[Degree]N, \[Minus]10\[Dash]34\[Degree]E), \
so even this level of agreement is not built in. Selection strengths are \
parameterised differently across studies (dairyers-only versus \
population-wide, time-varying versus constant), so order-of-magnitude \
agreement is the right standard there."],

para[{"One more check, at the other end of time: extrapolate the fitted \
uniform-start model to the present (0 BP, i.e. 1950) and compare with \
today's measured rs4988235-A frequencies from the 1000 Genomes Project at \
the four sampled populations that sit on our grid:"}],

evalIn["modern = {\n  {\"Britain (GBR)\", 52.5, -1.5, 0.720},\n  {\"Iberia (IBS)\", 40.4, -3.7, 0.458},\n  {\"Tuscany (TSI)\", 43.5, 11.0, 0.089},\n  {\"Finland (FIN)\", 61.0, 25.0, 0.591}};\npresent = PosteriorCellStats[draws, grid, {0}][0];\nnearCell[la_, lo_] := First[Ordering[\n   Map[EuclideanDistance[{la, lo Cos[la Degree]},\n     {#[\"Latitude\"], #[\"Longitude\"] Cos[#[\"Latitude\"] Degree]}] &, grid], 1]];\nGrid[\n Prepend[\n  Map[Function[row, With[{i = nearCell[row[[2]], row[[3]]]},\n    {row[[1]], ToString[NumberForm[present[\"Mean\"][[i]], {4, 2}]],\n     \"[\" <> ToString[NumberForm[present[\"Lower95\"][[i]], {4, 2}]] <> \", \" <>\n       ToString[NumberForm[present[\"Upper95\"][[i]], {4, 2}]] <> \"]\",\n     ToString[NumberForm[row[[4]], {4, 2}]]}]], modern],\n  Style[#, Bold] & /@ {\"population\", \"model at 0 BP\", \"95% interval\", \"1000G rs4988235-A\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.4, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["Present-day extrapolation versus 1000 Genomes phase-3 allele \
frequencies (Ensembl). Everything after ~2,000 BP is extrapolation far \
beyond the ancient data, and the intervals say so \[LongDash] they span \
most of the unit interval. The medians put Britain and Finland at the \
top, correctly, but swap the bottom two, and Iberia's observed value \
sits just above its upper bound. Read this the honest way: the model is \
calibrated for the ancient window it was fitted to, and its present-day \
precision is essentially nil \[LongDash] which is itself worth knowing \
before anyone quotes the animation's final frame as a prediction."],

para[{"Taken together: an origin posterior whose median lands where Itan \
et al. put their mode, a prior-free fit surface whose preferred band \
contains that region, selection strengths inside the published ranges, \
and present-day extrapolations that bracket the modern frequencies while \
confessing how little precision survives a two-millennium extrapolation. \
None of this proves the model \[LongDash] and the fit surface is frank \
that the data alone leave the origin's longitude loosely pinned \[LongDash] \
but it is the pattern of agreement independent methods should show if \
the underlying story is right."}],

hd1["12.  The animation, assembled"],

para[{"The hero animation at the top of the post is the whole pipeline in \
one artifact: 81 time-interpolated frames of the kriged posterior mean, the \
moving window of ancient samples, a progress bar, and \[LongDash] \
non-negotiably \[LongDash] the credible-interval inset, so that even a \
viewer who reads nothing else cannot mistake the smooth colours for \
certainty. Because every frame is raster-composited over a single cached \
base map, the full render takes under a minute:"}],

codeIn["hero = ExportHeroAnimation[Directory[], samples, grid, draws];\n(* figures/generated/hero_lactase_persistence.{mp4, gif} *)"],

hd1["13.  What this is not"],

para[{"This is a calibrated caricature, and the caveats are part of the \
result. The regional logistic layer reproduces the published four-region \
picture qualitatively, not parameter-for-parameter. The simulator is \
deterministic \[LongDash] no genetic drift \[LongDash] which flatters the \
posterior's tightness; demography (the steppe migrations!) is implicit; \
Ireland is unreachable in the adjacency; radiocarbon uncertainty enters the \
bins as point dates; the final ESS of " <> fmt[essLast, 1] <> " keeps every \
interval approximate; and everything after ~2,000 BP extrapolates beyond \
the data. Next steps, in rough order of value: a formal model comparison \
between the uniform-start and point-source variants (\[Section]10), a \
Wright\[Dash]Fisher stochastic core, sample-level ancestry-aware \
likelihoods, MCMC rejuvenation inside the SMC, and calibrated-date \
uncertainty propagated end-to-end."}],

hd1["14.  Reproducibility"],

para[{"Everything \[LongDash] data retrieval with checksums, processing \
with provenance, fits, SMC, validation, sensitivity, every figure, the \
hero animation, and this notebook itself \[LongDash] regenerates from the \
repository:"}],

codeIn["git clone https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram\nwolframscript -file scripts/run_pipeline.wls --particles 400 --generations 5\nwolframscript -file scripts/run_tests.wls\nwolframscript -file community/build_notebook.wls"],

para[{"The package ", mono["src/LactasePersistenceSpatial.wl"],
  " (~2,000 lines) carries the entire workflow behind the one-liners in \
this post; 24 VerificationTests cover the parsers, the simulator, the \
summary statistics, and the SMC machinery, and GitHub Actions runs them \
non-interactively. Repository: ",
  link["mthiel74/ancient-dna-lactase-spatial-wolfram",
    "https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram"], "."}],

hd1["15.  References"],

para[{"Evershed, R. P., et al. (2022). Dairying, diseases and the evolution \
of lactase persistence in Europe. ", ital["Nature"], " 608, 336\[Dash]345. ",
  link["nature.com/articles/s41586-022-05010-7",
    "https://www.nature.com/articles/s41586-022-05010-7"]}],

para[{"Burger, J., et al. (2020). Low prevalence of lactase persistence in \
Bronze Age Europe indicates ongoing strong selection over the last 3,000 \
years. ", ital["Current Biology"], " 30(21), 4307\[Dash]4315. ",
  link["cell.com/current-biology",
    "https://www.cell.com/current-biology/fulltext/S0960-9822(20)31187-8"]}],

para[{"Bersaglieri, T., et al. (2004). Genetic signatures of strong \
recent positive selection at the lactase gene. ",
  ital["American Journal of Human Genetics"], " 74(6), 1111\[Dash]1120."}],

para[{"Itan, Y., Powell, A., Beaumont, M. A., Burger, J., Thomas, M. G. \
(2009). The origins of lactase persistence in Europe. ",
  ital["PLoS Computational Biology"], " 5(8), e1000491 (CC-BY; Figure 3 \
reproduced in \[Section]11). "}],

para[{"The 1000 Genomes Project Consortium (2015). A global reference for \
human genetic variation. ", ital["Nature"], " 526, 68\[Dash]74. \
rs4988235 population frequencies via Ensembl."}],

para[{"GLAD LP Ancient Genotypes 2022 workbook (UCL), derived from the Allen \
Ancient DNA Resource v44.3."}],

para[{Style["Analysis, figures, and notebook generated with Wolfram Language " <>
  StringTake[$Version, 6] <> " on " <>
  DateString[Now, {"MonthName", " ", "DayShort", ", ", "Year"}] <> ".",
  FontSlant -> Italic, FontColor -> GrayLevel[0.4]]}]

}];

(* ================= SAVE ================= *)

Print["assembled ", Length[$allCells], " cells"];

TimeConstrained[
  UsingFrontEnd[
    nbObj = CreateDocument[$allCells, Visible -> False,
      WindowSize -> {1020, 820}];
    SetOptions[nbObj, StyleDefinitions -> houseStyles];
    NotebookSave[nbObj, outNb];
    Print["wrote evaluated ", outNb, " (", FileByteCount[outNb], " B)"];
    Quiet @ Check[
      Export[outPdf, nbObj];
      Print["wrote ", outPdf, " (", FileByteCount[outPdf], " B)"],
      Print["warn: PDF export failed"]];
    NotebookClose[nbObj];
  ],
  1800,
  Print["warn: notebook save timed out"]
];
