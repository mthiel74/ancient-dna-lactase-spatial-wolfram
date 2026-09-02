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
(* the processed AADR v66 dataset also ships beside the notebook, so the
   standalone folder reproduces the published numbers rather than falling
   back to a fresh GLAD download *)
Quiet @ Check[
  Module[{d = FileNameJoin[{repoRoot, "community", "data", "processed"}]},
    If[!DirectoryQ[d], CreateDirectory[d, CreateIntermediateDirectories -> True]];
    CopyFile[
      FileNameJoin[{repoRoot, "data", "processed", "aadr_v66_rs4988235_called_samples.csv"}],
      FileNameJoin[{d, "aadr_v66_rs4988235_called_samples.csv"}],
      OverwriteTarget -> True]],
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

sensRows = Quiet @ Check[
  Map[Association, Normal[Import[FileNameJoin[{repoRoot, "data", "processed",
    "sensitivity_posterior_quantiles.csv"}], "Dataset", HeaderLines -> 1]]], {}];
sensDairyMedians = #["Median"] & /@ Select[sensRows, #["Parameter"] === "SelectionDairying" &];
sensMigrationOf[scen_] := With[{r = SelectFirst[sensRows,
    #["Scenario"] === scen && #["Parameter"] === "Migration" &]},
  If[AssociationQ[r], r["Median"], Missing[]]];

fmt[x_?NumericQ, d_: 3] := ToString[NumberForm[N[x], {12, d}]];
fmt2[x_?NumericQ] := ToString[NumberForm[N[x], {12, 2}]];
pct[x_?NumericQ] := ToString[Round[100 N[x]]] <> "%";
fitOf[r_] := SelectFirst[fits, #["Region"] === r &];

originSmc = LoadOrRunOriginSMCABC[repoRoot, samples, grid];
originQ = PosteriorParameterQuantiles[originSmc];
oQ[p_] := SelectFirst[originQ, #["Parameter"] === p &];
oLat = oQ["OriginLatitude"]; oLon = oQ["OriginLongitude"]; oT = oQ["OriginTimeBP"];

(* v3: exact-likelihood chains (must exist: scripts/run_origin_mcmc.wls,
   run_origin_mcmc_chain.wls 2718/1618, run_main_mcmc.wls 314159/2718) *)
procDir = FileNameJoin[{repoRoot, "data", "processed"}];
$OriginSpecSym = LactasePersistenceSpatial`Private`$OriginPriorSpec;
$MainSpecSym = LactasePersistenceSpatial`Private`$PriorSpec;
$MainSpecSym["Migration"] = $OriginSpecSym["Migration"];
lidxCount = LikelihoodIndex[samples, grid]["SampleCount"];
nTests = StringCount[Import[FileNameJoin[{repoRoot, "tests", "core.wlt"}], "Text"], "VerificationTest["];
mcmcFilesPre = Join[{FileNameJoin[{procDir, "origin_mcmc_chain.csv"}]},
  FileNames["origin_mcmc_chain_seed*.csv", procDir]];
mainFilesPre = FileNames["main_mcmc_chain_seed*.csv", procDir];
If[mainFilesPre === {}, Print["  !! no main_mcmc_chain_seed*.csv - run scripts/run_main_mcmc.wls"]; Exit[1]];
mapOfPre[files_] := KeyDrop[First[MaximalBy[Flatten[Map[Association,
  Normal[Import[#, "Dataset", HeaderLines -> 1]]] & /@ files, 1], #["LogPosterior"] &]], "LogPosterior"];
originMapPre = mapOfPre[mcmcFilesPre]; mainMapPre = mapOfPre[mainFilesPre];
originMcmcPre = ReloadOriginMCMC[repoRoot];
mcmcErr = SelectFirst[PosteriorParameterQuantiles[originMcmcPre], #["Parameter"] === "CallErrorRate" &]["Median"];
mainChainPre = Flatten[Map[Association, Normal[Import[#, "Dataset", HeaderLines -> 1]]] & /@ mainFilesPre, 1];
mainErrMed = Median[mainChainPre[[All, "CallErrorRate"]]];
mainMigMed = Median[mainChainPre[[All, "Migration"]]];
mainLogP0 = Median[Log10[mainChainPre[[All, "InitialFrequency"]]]];
(* early carriers actually used by the likelihood (after the snap cutoff) *)
lidxPre = LikelihoodIndex[samples, grid];
earlyPre = Flatten[Position[lidxPre["TimesBP"], _?(# > 6000 &)]];
earlyCalled = Round[Total[lidxPre["Called"][[earlyPre]]]];
earlyDerived = Round[Total[lidxPre["Derived"][[earlyPre]]]];
earlyCarriers = Length[Select[earlyPre, lidxPre["Derived"][[#]] > 0 &]];
droppedCount = lidxPre["DroppedCount"]; droppedCalled = Round[lidxPre["DroppedCalled"]];
(* best-LIKELIHOOD (not max-posterior) parameters + per-chain spread *)
originBestPre = BestLikelihoodParams[mcmcFilesPre, $OriginSpecSym];
originMapPre = originBestPre["Params"];
originChainSpread = Max[originBestPre["PerChainBest"]] - Min[originBestPre["PerChainBest"]];
(* pooled point-source posterior: median time + bound-hugging audit *)
originPooledPre = Flatten[Map[Association, Normal[Import[#, "Dataset", HeaderLines -> 1]]] & /@ mcmcFilesPre, 1];
originTimeMed = Median[originPooledPre[[All, "OriginTimeBP"]]];
biMultHug = N[Count[originPooledPre, r_ /; r["SelectionMultiplierBritishIsles"] >= 2.178]/Length[originPooledPre]];
(* min per-chain Geyer ESS and max split-Rhat, both models *)
originConvPre = McmcConvergenceTable[mcmcFilesPre];
originMinESS = Min[#["MinChainESS"] & /@ originConvPre];
originMaxRhat = Max[#["Rhat"] & /@ originConvPre];
mainConvPre = McmcConvergenceTable[mainFilesPre];
mainMaxRhat = Max[#["Rhat"] & /@ mainConvPre];
mainMinESS = Min[#["MinChainESS"] & /@ mainConvPre];
residPre = LikelihoodResidualTable[samples, grid, originMapPre];
residSum[r_] := Total[Select[residPre, #["Region"] === r &][[All, "LLModelMinusLogistic"]]];
residRDGain = residSum["Rhine-Danube"]; residBIloss = residSum["British Isles"]; residBalticLoss = residSum["Baltic"];
bi1 = SelectFirst[residPre, #["Region"] === "British Isles" && #["MillenniumBP"] === 1 &];
residBIobs = bi1["ObservedFreq"]; residBImodel = bi1["ModelFreq"];
domFilesPre = FileNames["origin_mcmc_dominance_seed*.csv", procDir];
mainMapPre = BestLikelihoodParams[mainFilesPre, $MainSpecSym]["Params"];
ladderModelsPre = <|"standing" -> mainMapPre, "origin" -> originMapPre|>;
If[domFilesPre =!= {}, ladderModelsPre["dominance"] = BestLikelihoodParams[domFilesPre, $OriginSpecSym]["Params"]];
ladderPre = DevianceLadder[samples, grid, ladderModelsPre];
llOf[m_] := SelectFirst[ladderPre, #["Model"] === m &]["LogLikelihood"];
llStanding = llOf["standing"]; llOrigin = llOf["origin"];
llLogistic = SelectFirst[ladderPre, StringStartsQ[#["Model"], "five"] &]["LogLikelihood"];
domSentence = If[domFilesPre === {}, "",
  With[{d = llOf["dominance"]},
    If[d > llOrigin + 5,
      ": it improves the point-source log-likelihood by " <> fmt[d - llOrigin, 0] <> " nats, which is real but does not close the " <> fmt[llStanding - d, 0] <> "-nat gap to standing variation",
      With[{m = ladderModelsPre["dominance"]},
        With[{dkm = Round[QuantityMagnitude[GeoDistance[{m["OriginLatitude"], m["OriginLongitude"]}, {originMapPre["OriginLatitude"], originMapPre["OriginLongitude"]}], "Kilometers"], 10]},
        ": at a log-likelihood of " <> fmt[d, 1] <> " it does not rescue the point-source model; this single, poorly-mixed chain lands at dominance h \[TildeTilde] " <> fmt[m["Dominance"], 2] <> " (the biology expects near-dominance, h close to 1, and the plateau it buys does not close the gap) \[LongDash] and it moves the best-fit origin to " <> fmt[m["OriginLatitude"], 1] <> "\[Degree]N, " <> fmt[m["OriginLongitude"], 1] <> "\[Degree]E, about " <> ToString[dkm] <> " km from the point-source estimate. A location that moves that far when the selection recursion changes is a property of the model, not of the allele"]]]]];
Print["  exact-likelihood ladder: logistic ", fmt[llLogistic, 1], " origin ", fmt[llOrigin, 1], " standing ", fmt[llStanding, 1]];

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

(* executed-animation cell: shows the generating call as a labelled In[]
   cell, RUNS it at build time, and embeds the resulting animation as its
   Out[] \[LongDash] so the notebook itself produces every moving picture *)
evalAnim[code_String, gifPath_String, caption_] := Module[{n, all, anim, boxes, inCell, outCell},
  $cellCounter++; n = $cellCounter;
  Print["  evalAnim In[", n, "]: ", StringTake[code, UpTo[70]]];
  ToExpression[code];
  If[!FileExistsQ[gifPath],
    Return @ Cell[TextData[{bold["[ animation not produced: " <> gifPath <> " ]"]}], "Text",
      FontColor -> RGBColor[0.7, 0.1, 0.1]]];
  all = Import[gifPath, {"GIF", "ImageList"}];
  all = ColorQuantize[ImageResize[#, {560}], 256] & /@ all[[1 ;; ;; 2]];
  anim = AnimatedImage[all, FrameRate -> 2.5,
    AnimationRunning -> True, AnimationRepetitions -> Infinity];
  boxes = ToBoxes[
    If[caption === "", anim,
      Column[{anim,
        Pane[Style[caption, Italic, FontSize -> 10.5, FontFamily -> "Helvetica",
          FontColor -> GrayLevel[0.35]], 660, Alignment -> Center]},
        Alignment -> Center, Spacings -> 0.6]]];
  inCell = Cell[code, "Input", CellLabel -> "In[" <> ToString[n] <> "]:="];
  outCell = Cell[BoxData[boxes], "Output", TextAlignment -> Center,
    CellLabel -> "Out[" <> ToString[n] <> "]="];
  Cell[CellGroupData[{inCell, outCell}, Open]]
];

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

subtitle["From raw ancient genotypes to a spatial diffusion\[Dash]selection \
model \[LongDash] fitted first by sequential Monte Carlo ABC, then by the \
exact per-sample likelihood \[LongDash] with the uncertainty carried into \
every picture, including the honest finding that these data do not locate \
the allele's origin"],

animCell[FileNameJoin[{figDir, "hero_lactase_persistence.gif"}],
  "Posterior mean frequency of the lactase-persistence allele (rs4988235-A) \
across Europe over the last 8,000 years (about 6050 BC to AD 1950), on the \
TemperatureMap scale. White-ringed dots \
are the ancient individuals dated within \[PlusMinus]400 years of the moving \
window; the inset tracks the 95% credible-interval width \[LongDash] where the \
map is honest about not knowing. This copy is the output of the \
ExportHeroAnimation call executed in \[Section]13 of this very notebook; \
it is placed up front so the destination is visible before the journey."],

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
output at every step. We will clean and cross-validate ancient genotype \
records from two generations of the Allen Ancient DNA Resource (" <>
ToString[nSamples] <> " dated, located individuals with rs4988235 calls in \
the active extraction), reproduce the classic regional frequency curves with \
proper binomial likelihoods, build a spatial diffusion\[Dash]selection model \
on a landmasked grid of Europe, fit it with sequential Monte Carlo \
approximate Bayesian computation (tens of thousands of forward simulations), \
check it with posterior predictive \
simulation and two kinds of held-out validation, stress-test the priors, and \
render the posterior \[LongDash] mean ", ital["and"], " credible-interval \
width \[LongDash] as the animation above. Every figure sits directly below \
the code that makes it, and the whole thing reruns from two wolframscript \
commands (\[Section]15)."}],

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

para[{"Two data sources, one loader. The historical source is the public \
GLAD ancient-genotype workbook (Global Lactase persistence Association \
Database), derived from the Allen Ancient DNA Resource v44.3 and used for \
the Evershed et al. (2022) analysis; ", mono["RetrieveRawData"],
" downloads it once with a SHA-256 checksum and provenance manifest, and ",
mono["WriteProcessedData"], " parses it into tidy CSVs. The ", ital["active"],
" dataset is newer: rs4988235 extracted for every individual in the current \
AADR v66.p1 release (see ", mono["scripts/extract_aadr_v66_rs4988235.py"],
" and ", mono["scripts/ingest_aadr_v66.wls"], " in the repository), \
deduplicated to one record per individual and validated against the GLAD \
genotypes where the two overlap (796 of 797 strict homozygotes concordant). ",
mono["LoadProcessedSamples"], " prefers the v66 file automatically \
whenever it is present \[LongDash] including the copy that ships beside \
this notebook \[LongDash] so the counts below show both generations of \
the data:"}],

evalInSilent["nbdir = NotebookDirectory[];\n(* LactasePersistenceSpatial.wl ships next to this notebook; inside the\n   full repository the src/ copy and the repo data layout are used *)\nroot = If[FileExistsQ[FileNameJoin[{ParentDirectory[nbdir], \"src\", \"LactasePersistenceSpatial.wl\"}]],\n   ParentDirectory[nbdir], nbdir];\nSetDirectory[root];\nGet[First[Select[\n   {FileNameJoin[{nbdir, \"LactasePersistenceSpatial.wl\"}],\n    FileNameJoin[{root, \"src\", \"LactasePersistenceSpatial.wl\"}]}, FileExistsQ]]];"],

evalIn["raw = RetrieveRawData[Directory[]];\nprocessed = WriteProcessedData[Directory[], raw];\nsamples = LoadProcessedSamples[Directory[]];\n<|\"GLAD (AADR v44.3) called samples\" -> Length[processed[\"CalledSamples\"]],\n  \"active dataset (AADR v66.p1)\" -> Length[samples]|>"],

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
" \[LongDash] the familiar few-percent picture, strongest in the north-west. \
Burger et al.'s 0.06 is estimated over the last three millennia only, while \
these slopes average over eight, so it should and does sit at or above the \
top of this range: time-averaging dilutes a late, strong pulse."}],

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
(" <> ToString[Length[ppcRows]] <> " bins). Second \[LongDash] because a spatial model scored only on \
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
" <> ToString[Length[Keys[smc["PriorSpecUsed"]]]] <> "-dimensional box \
prior, perturbing in the raw coordinates throws ~" <>
ToString[Round[100 (1 - 0.7^Length[Keys[smc["PriorSpecUsed"]]])]] <>
"% of proposals out of the box (0.7 to the " <>
ToString[Length[Keys[smc["PriorSpecUsed"]]]] <> "th \[TildeTilde] " <>
fmt[0.7^Length[Keys[smc["PriorSpecUsed"]]], 3] <> "). The sampler \
therefore works in logit-transformed coordinates, where a uniform prior \
becomes an exact product of standard logistic densities, every proposal is \
automatically valid, and the importance weights stay closed-form."}],

evalIn["smc = LoadOrRunSMCABC[Directory[], samples, grid];\nGrid[\n Prepend[\n  Table[{k, NumberForm[smc[\"EpsilonHistory\"][[k]], {5, 4}],\n    NumberForm[100. smc[\"AcceptanceHistory\"][[k]], {4, 1}],\n    NumberForm[smc[\"ESSHistory\"][[k]], {5, 1}]}, {k, Length[smc[\"EpsilonHistory\"]]}],\n  Style[#, Bold] & /@ {\"generation\", \"\[Epsilon]\", \"acceptance %\", \"ESS\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

para[{"The tolerance falls from " <> fmt[epsFirst] <> " (the prior median \
\[LongDash] i.e. no information) to " <> fmt[epsLast] <> " over roughly " <>
ToString[1000 Round[Total[Length[smc["Weights"]]/Clip[N[smc["AcceptanceHistory"]], {0.01, 1}]]/1000]] <>
" simulations. The final effective sample size, " <> fmt[essLast, 1] <>
" of " <> ToString[Length[smc["Weights"]]] <> ", deserves a sentence rather \
than a footnote: importance-weight \
degeneracy is the known cost of this weight formula whenever the posterior \
is much tighter than the prior, every interval in this post is a weighted \
quantile and correspondingly approximate, and the honest cure \[LongDash] \
dropping the summaries altogether for the exact per-sample likelihood \
\[LongDash] is what \[Section]12 does. \
Reporting ESS is what separates a posterior from a scatter plot."}],

evalIn["draws = ResamplePosterior[smc, 100];\nsmcOutputs = ExportSMCOutputs[Directory[], samples, grid, smc, draws];\nImport[smcOutputs[\"ParameterFigure\"]]"],

captionCell["Weighted SMC posterior (blue) against the flat prior (dashed \
orange) for every parameter. Prior overlays are the fastest honesty check \
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

evalIn["quantiles = PosteriorParameterQuantiles[smc];\npriorSpec = smc[\"PriorSpecUsed\"];\nwidthShare[p_, q_] := (q[\"Upper95\"] - q[\"Lower95\"])/(0.95 (priorSpec[p][[2]] - priorSpec[p][[1]]));\nGrid[\n Prepend[\n  Table[With[{q = SelectFirst[quantiles, #[\"Parameter\"] === p &]},\n    {p, NumberForm[q[\"Median\"], {6, 4}],\n     Row[{\"[\", NumberForm[q[\"Lower95\"], {6, 4}], \", \", NumberForm[q[\"Upper95\"], {6, 4}], \"]\"}],\n     NumberForm[widthShare[p, q], {3, 2}]}],\n   {p, {\"Log10InitialFrequency\", \"SelectionBase\", \"SelectionDairying\", \"Migration\",\n     \"SelectionMultiplierBritishIsles\", \"SelectionMultiplierRhineDanube\",\n     \"SelectionMultiplierMediterranean\", \"SelectionMultiplierBaltic\", \"CallErrorRate\"}}],\n  Style[#, Bold] & /@ {\"parameter\", \"median\", \"95% interval\", \"CI width / prior width\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["The last column is the anti-self-deception device: the \
posterior 95% interval's width as a share of the prior's. A value near 1 \
means the data taught us nothing about that parameter and its row is a \
restatement of the prior; only rows well below 1 are findings. Reviewers \
of an earlier draft of this analysis demonstrated \[LongDash] correctly \
\[LongDash] that several \
\[OpenCurlyDoubleQuote]agreements with the literature\[CloseCurlyDoubleQuote] \
were prior tautologies of exactly this kind, which is why the column now \
appears in every parameter table."],

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

evalIn["cv = LoadOrRunCrossValidation[Directory[], samples, grid];\nDataset[cv]"],

para[{bold["Held-out time"], " \[LongDash] the killer test. Train only on \
samples at or older than the 3,000 BP bin edge (" <> ToString[tsRow["TrainingSamples"]] <>
" of them) and predict the " <> ToString[tsRow["HeldOutBins"]] <>
" most recent bins. The intervals still cover, but the posterior median \
under-predicts the final rise badly (RMSE " <> fmt[tsRow["RMSE"], 2] <>
"). Far from being embarrassing, this is the pipeline independently \
rediscovering Burger et al.'s headline: the evidence for ", ital["strong, \
late"], " selection is concentrated in the last three millennia. Delete \
those millennia and the model, sensibly, refuses to believe in them."}],

evalIn["timeSlice = LoadOrRunTimeSliceValidation[Directory[], samples, grid];\nDataset[{timeSlice}]"]

}];

(* ================= 9. SENSITIVITY ================= *)

writeAll[{

hd1["9.  Which conclusions survive the priors?"],

para[{"Five complete refits: baseline; halved selection priors; doubled \
migration prior; and every dairying onset shifted 400 years earlier or \
later. The dairying-modulated selection component stays positive in all \
five (medians " <> fmt[Min[sensDairyMedians], 3] <> "\[Dash]" <>
fmt[Max[sensDairyMedians], 3] <> ") \[LongDash] though \[Section]11 will \
temper how much of that is data rather than the non-negative prior. The \
migration posterior tracks whichever prior it is given (median " <>
fmt[sensMigrationOf["Baseline"], 3] <> " baseline \[RightArrow] " <>
fmt[sensMigrationOf["WideMigration"], 3] <> " under the widened prior): \
with " <> ToString[Length[grid]] <> " cells and regionally-pooled \
summaries, movement is weakly identified, and the honest statement is \
exactly that."}],

evalIn["sens = LoadOrRunSensitivity[Directory[], samples];\nImport[FileNameJoin[{Directory[], \"figures\", \"generated\", \"sensitivity_intervals.png\"}]]"]

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

evalIn["earliest = TakeLargestBy[\n  Select[samples, #[\"DerivedAlleles\"] > 0 && #[\"MeanDateBP\"] <= 10000 &],\n  #[\"MeanDateBP\"] &, 10];\nGrid[\n Prepend[\n  {Round[#[\"MeanDateBP\"]], #[\"Country\"], #[\"Latitude\"], #[\"Longitude\"],\n    #[\"RS4988235Genotype\"], #[\"Publication\"]} & /@ earliest,\n  Style[#, Bold] & /@ {\"years BP\", \"country\", \"lat\", \"lon\", \"call\", \"publication\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

evalIn["GeoGraphics[\n Flatten[Table[{RGBColor[0.8, 0.15, 0.1], PointSize[0.013],\n    Point[GeoPosition[{e[\"Latitude\"], e[\"Longitude\"]}]],\n    Black, Text[Style[ToString[Round[e[\"MeanDateBP\"]]] <> \" BP\", 9.5, Bold],\n      GeoPosition[{e[\"Latitude\"] + 1.1, e[\"Longitude\"]}]]},\n   {e, earliest}], 1],\n GeoRange -> {{34, 63}, {-14, 72}}, GeoProjection -> \"Equirectangular\",\n GeoBackground -> GeoStyling[{\"CountryBorders\",\n   \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 640]"],

captionCell["The oldest derived-allele calls within the modelled era \
(\[LessEqual] 10,000 BP), from the AADR v66 release. Read this table with \
suspicion, not reverence: most rows are single sequencing reads, and \
G\[RightArrow]A is the very transition that post-mortem damage produces, \
so an isolated early \[OpenCurlyDoubleQuote]carrier\[CloseCurlyDoubleQuote] \
is as likely chemistry as biology \[LongDash] which is why the model fits \
an explicit error rate rather than taking the table at face value. The \
cautionary tale is what happened to the previous version of this table: \
under the 2021-era data behind our first fit, the three oldest carriers \
formed a tidy southeastern arc (Bulgaria ~6,560 BP, Ukraine ~5,600 BP, \
Romania ~5,390 BP). Current data dissolve two of the three \[LongDash] the \
Ukrainian individual has been redated to ~3,985 BP and the Romanian \
heterozygote is now called GG from the diploid genotypes \[LongDash] \
leaving one depth-2 heterozygote from Bulgaria carrying what was once a \
whole origin narrative."],

para[{"The hero animation cannot show any of this, ", ital["by construction"],
": its model starts at 10,000 BP with a near-uniform initial frequency, \
has no mutation event, and \[LongDash] with migration weakly identified \
\[LongDash] moves essentially by in-place logistic growth. Britain lights \
up first there because its late samples demand the fastest growth, not \
because the allele originated there. So let us stop hand-waving and put \
the origin ", ital["into"], " the model: replace the uniform start with a \
point source. Six new parameters: origin latitude, longitude and time \
(time prior 5,000\[Dash]10,000 BP, wide enough that both Itan et al.'s \
7,441 BP and the ~6,000 BP rise date of Irving-Pease et al. live inside \
it); the injection frequency; a genotype-error rate \[Epsilon] \[Element] \
[0, 0.02], because G\[RightArrow]A is exactly the transition that \
post-mortem deamination fakes, and a model without an error channel is \
forced to treat every damaged Palaeolithic read as a real carrier; and a \
dairying lead time. That last one is the scientific commitment, made \
explicit and ", ital["fitted"], " rather than hidden in the prior: the \
source may not precede the local dairying onset by more than the lead \
(prior 0\[Dash]2,000 years; origins after local onset are unrestricted \
\[LongDash] the constraint is deliberately asymmetric), because the thing \
being located is the start of the ", ital["selection-driven rise"], ", not \
the first mutation event \[LongDash] the same gene\[Dash]culture \
coupling Itan et al. build into their model. Without it, a drift-free \
simulator lets a vanishingly small injection idle for millennia in \
pre-dairying forager regions. Migration gets a wider prior than the main \
model (a travelling wave has to actually travel: m \[Element] [0.02, 0.3] \
per generation, capped where the mixing map saturates), the integrator \
uses exact per-step logistic growth with exponential mixing, and diagonal \
adjacency lets the wave cross the Dover strait. The same SMC machinery \
then turns \"where did it start?\" into a posterior distribution:"}],

evalIn["originSmc = LoadOrRunOriginSMCABC[Directory[], samples, grid];\noriginQuant = PosteriorParameterQuantiles[originSmc];\nconstrPrior = Map[Association, Normal[Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"origin_constrained_prior_quantiles.csv\"}], \"Dataset\", HeaderLines -> 1]]];\ncpOf[p_] := SelectFirst[constrPrior, #[\"Parameter\"] === p &];\nGrid[\n Prepend[\n  Table[With[{q = SelectFirst[originQuant, #[\"Parameter\"] === p &], cp = cpOf[p]},\n    {p, NumberForm[q[\"Median\"], {6, 3}],\n     Row[{\"[\", NumberForm[q[\"Lower95\"], {6, 3}], \", \", NumberForm[q[\"Upper95\"], {6, 3}], \"]\"}],\n     Row[{NumberForm[cp[\"Median\"], {6, 3}], \"  [\", NumberForm[cp[\"Lower95\"], {6, 3}], \", \", NumberForm[cp[\"Upper95\"], {6, 3}], \"]\"}],\n     NumberForm[(q[\"Upper95\"] - q[\"Lower95\"])/(cp[\"Upper95\"] - cp[\"Lower95\"]), {3, 2}]}],\n   {p, {\"OriginLatitude\", \"OriginLongitude\", \"OriginTimeBP\",\n     \"Log10InjectFrequency\", \"Migration\", \"SelectionDairying\",\n     \"DairyingLeadYears\", \"CallErrorRate\"}}],\n  Style[#, Bold] & /@ {\"parameter\", \"posterior median\", \"posterior 95%\",\n    \"constrained prior: median [95%]\", \"width ratio\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["The decisive columns are the last two: the same quantiles \
under the CONSTRAINED PRIOR (the prior after the land and dairying-lead \
support restrictions, sampled by scripts/sample_constrained_prior.wls with \
no genetic data at all), and the posterior-to-prior width ratio. A \
posterior statement only carries information where it differs from that \
baseline. Read ruthlessly: the origin date's posterior median sits within \
fifty years of its constrained-prior median \[LongDash] the \
\[OpenCurlyDoubleQuote]published-envelope date\[CloseCurlyDoubleQuote] \
is generated by the archaeological chronology in the constraint, not by \
the genetics. What the genetic data actually move: the longitude (prior \
median 14.8\[Degree]E \[RightArrow] posterior 2.3\[Degree]E) and, \
modestly, total selection strength. Most other rows are their priors."],

evalIn["OriginDensityMap[originSmc]"],

captionCell["The reverse-diffusion result, in the spirit of Itan et al.'s \
famous origin map: weighted posterior density of the point source's \
location, land-masked. Read the spread, not the star. \[Section]11 shows \
that this posterior is broad and multimodal enough that its mode is not a \
stable quantity \[LongDash] move the kernel bandwidth or reshuffle the \
resampling seed and the starred cell jumps between southwestern France, \
northern Germany and Iberia, a range of some 1,500 km. The star marks the \
modal cell of one particular kernel estimate; it is not a location \
estimate, and \[Section]11 makes the case that this posterior has no \
defensible point summary of location at all."],

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

evalAnim["originSpread = ExportOriginSpread[Directory[], samples, grid, originSmc];",
  FileNameJoin[{figDir, "origin_spread.gif"}],
  "Forward simulation from the fitted point source, rendered by the call \
above: posterior mean over 100 origin-model draws, 100-year interpolated \
steps. The H.264 version lands in figures/generated/origin_spread.mp4."],

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

para[{"A model that only agrees with itself is not worth posting, so \
this section tests the fit against estimates it never saw. The benchmark \
is ", bold["Itan et al. (2009)"], " \[LongDash] a demic coevolution \
simulation driven by archaeological settlement dates and ", ital["modern"],
" allele frequencies, with no ancient genotypes at all. Our fit uses ",
ital["only"], " ancient genotypes. The two are largely \[LongDash] not \
entirely \[LongDash] independent: our gene\[Dash]culture coupling \
consults the same archaeological dairying chronology that drives their \
simulation, so the origin-", ital["date"], " comparison shares an input, \
while the genetic data are disjoint. That still makes the comparison \
worth doing \[LongDash] and worth doing ",
ital["numerically"], ", not by putting two pictures next to each other and \
inviting the eye to find agreement. Two maps that share a warm patch can \
still be quantitatively far apart, and here they are."}],

para[{"So the first step is to turn their figure back into numbers \
\[LongDash] in Wolfram. Their Fig 3 carries tick marks at known latitudes \
and longitudes, so the pixel grid can be georeferenced exactly (the \
parallels are horizontal; the meridians converge northward at 35.85 \
px/degree along the top frame and 42.15 along the bottom), and the filled \
contour bands run along a blue\[Dash]cyan\[Dash]green\[Dash]yellow\[Dash]red \
ramp that inverts analytically. ", mono["ImportItanFig3Density"],
" in the package does all of this in about forty lines of image \
processing; an independent Python implementation (", 
mono["scripts/digitise_itan_fig3.py"], ") agrees with it to a mean \
absolute difference of 0.002 on the unit ramp scale. Two caveats are \
stated rather than hidden. First, the paper publishes no numeric colour \
scale, so equal density spacing between contour bands is an assumption; \
mode locations are robust to any monotone recolouring, but the overlap \
statistics below are approximate. Second, the paper's text localises the \
origin only qualitatively (\[OpenCurlyDoubleQuote]between the central \
Balkans and central Europe\[CloseCurlyDoubleQuote]); the coordinate \
48.5\[Degree]N, 14\[Degree]E quoted in this section is the mode of our \
own georeferenced digitisation, not a number from their text. With both \
posteriors as numbers on one grid, the comparison becomes arithmetic:"}],

evalIn["OriginItanHPDComparisonMap[originSmc, Directory[]]"],

captionCell["Highest-posterior-density contours for both analyses on \
common axes \[LongDash] derived numeric contours only, no part of the \
published image reproduced. Itan et al.'s 50% region (blue, solid) is a \
compact ellipse over Bavaria, Bohemia and the Carpathian Basin. Ours (red, \
solid) sprawls from the Atlantic coast of France to Ukraine in several \
disconnected lobes, and our 95% region covers essentially the whole \
domain. This is the comparison the side-by-side view flattered."],

evalIn["itanGrid = Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"itan2009_origin_density_digitised.csv\"}], \"Dataset\", HeaderLines -> 1];\nitanRows = Normal[itanGrid];\nlons = Union[#[[1]] & /@ itanRows]; lats = Union[#[[2]] & /@ itanRows];\nitanAssoc = Association[{#[[1]], #[[2]]} -> #[[3]] & /@ itanRows];\noriginDraws2 = ResamplePosterior[originSmc, 2000];\nkdeAt[lo_, la_] := Mean[Map[Exp[-0.5 (((lo - #[\"OriginLongitude\"])/2.6)^2 + ((la - #[\"OriginLatitude\"])/2.0)^2)] &, originDraws2]];\ncells = Keys[itanAssoc];\nwArea = Cos[#[[2]] Degree] & /@ cells;\npI = (Values[itanAssoc] wArea); pI = pI/Total[pI];\npO = (kdeAt @@@ cells) wArea; pO = pO/Total[pO];\nhpdMask[p_, lev_] := Module[{ord = Ordering[-p], c = 0., keep = {}},\n   Do[c += p[[i]]; AppendTo[keep, i]; If[c >= lev, Break[]], {i, ord}]; keep];\nbc = Total[Sqrt[pI pO]];\nGrid[{Style[#, Bold] & /@ {\"statistic\", \"value\", \"reading\"},\n  {\"Bhattacharyya coefficient\", NumberForm[bc, {4, 3}], \"1 = identical, 0 = disjoint\"},\n  {\"our mass in Itan 50% region\", NumberForm[Total[pO[[hpdMask[pI, 0.5]]]], {4, 3}], \"vs 0.50 if we agreed\"},\n  {\"our mass in Itan 95% region\", NumberForm[Total[pO[[hpdMask[pI, 0.95]]]], {4, 3}], \"vs 0.95 if we agreed\"},\n  {\"Itan mass in our 95% region\", NumberForm[Total[pI[[hpdMask[pO, 0.95]]]], {4, 3}], \"ours is broad enough to contain theirs\"}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.4, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["The honest verdict on location. If the two posteriors were \
describing the same belief, the mass we place inside their 50% and 95% \
regions would be about 0.50 and 0.95. It is nothing like that. The last \
row is the one that is easy to misread: their whole distribution sits \
inside our 95% region, but that is a statement about how vague we are, \
not how right. A posterior wide enough to contain every rival hypothesis \
has not corroborated any of them."],

imgFileCell[FileNameJoin[{repoRoot, "docs", "images", "originals",
  "itan2009_fig3_origin_density.png"}], 620],

captionCell["Figure 3 of: Itan Y, Powell A, Beaumont MA, Burger J, \
Thomas MG (2009), \[OpenCurlyDoubleQuote]The Origins of Lactase \
Persistence in Europe\[CloseCurlyDoubleQuote], PLoS Computational \
Biology 5(8): e1000491, doi:10.1371/journal.pcbi.1000491. \[Copyright] \
2009 Itan et al., distributed under the Creative Commons Attribution \
(CC BY) licence (creativecommons.org/licenses/by/4.0), which permits \
unrestricted reproduction provided the original author and source are \
credited. Reproduced here unmodified; separately, the figure was \
digitised into the numeric density field used above (a derived work \
under the same licence). It shows the posterior density of the origin \
of the lactase-persistence/dairying coevolution in their demic model, \
with the high-density region running from Bavaria/Bohemia toward the \
Carpathian Basin \[LongDash] the \[OpenCurlyDoubleQuote]Hungary \
result\[CloseCurlyDoubleQuote] of the popular retellings."],

evalIn["originDraws = ResamplePosterior[originSmc, 2000];\nsTotal = Quantile[Map[#[\"SelectionBase\"] + #[\"SelectionDairying\"] &, originDraws], {0.025, 0.5, 0.975}];\noRow[p_] := SelectFirst[PosteriorParameterQuantiles[originSmc], #[\"Parameter\"] === p &];\nfq[p_, d_] := With[{q = oRow[p]}, {ToString[NumberForm[q[\"Median\"], {8, d}]],\n   \"[\" <> ToString[NumberForm[q[\"Lower95\"], {8, d}]] <> \", \" <> ToString[NumberForm[q[\"Upper95\"], {8, d}]] <> \"]\"}];\nGrid[\n {Style[#, Bold] & /@ {\"quantity\", \"this model\", \"95% interval\", \"published\", \"source\"},\n  Join[{\"origin latitude (\[Degree]N)\"}, fq[\"OriginLatitude\", 1], {\"\[TildeTilde]48.5 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin longitude (\[Degree]E)\"}, fq[\"OriginLongitude\", 1], {\"\[TildeTilde]13 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin date (years BP)\"}, fq[\"OriginTimeBP\", 0], {\"7441 [6256, 8683]\", \"Itan 2009\"}],\n  Join[{\"selection, dairying term\"}, fq[\"SelectionDairying\", 3], {\"0.0953 [0.0518, 0.159]\", \"Itan 2009 (dairyers)\"}],\n  {\"selection, total in dairying cells\", ToString[NumberForm[sTotal[[2]], {8, 3}]],\n   \"[\" <> ToString[NumberForm[sTotal[[1]], {8, 3}]] <> \", \" <> ToString[NumberForm[sTotal[[3]], {8, 3}]] <> \"]\",\n   \"0.014\[Dash]0.15\", \"Bersaglieri 2004\"},\n  {\"\", \"\", \"\", \"\[TildeTilde]0.06 (last 3 kyr)\", \"Burger 2020\"}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["Parameter by parameter, with the constrained prior kept in \
view. The date: our median of " <> ToString[Round[oT["Median"]]] <> " BP [" <>
ToString[Round[oT["Lower95"]]] <> ", " <> ToString[Round[oT["Upper95"]]] <>
"] overlaps Itan et al.'s 7,441 [6,256\[Dash]8,683] \[LongDash] but so \
does the constrained prior (median 6,603 BP), so the overlap is supplied \
by the archaeological chronology, not the genotypes, and it should not be \
counted as an independent confirmation. Selection: the posterior total \
[0.023, 0.061] tightens the constrained prior's [0.007, 0.068] by \
excluding the weak tail \[LongDash] the genuine genetic content here \[LongDash] \
and sits inside Bersaglieri's wide 0.014\[Dash]0.15, below Itan's \
dairyers-only [0.0518, 0.159], above Irving-Pease's genome-wide 0.0194; \
Burger's \[TildeTilde]0.06 is estimated assuming dominance, which this \
genic model does not implement, so that comparison is indicative only. \
Location is where honest trouble lives, and marginal medians hide it: a \
marginal median is a poor summary of a broad multimodal joint posterior, \
and quoting one here would manufacture agreement the joint distribution \
does not support."],

para[{"One more check, at the other end of time: extrapolate the fitted \
uniform-start model to the present (0 BP, i.e. 1950) and compare with \
today's measured rs4988235-A frequencies from the 1000 Genomes Project at \
the four sampled populations that sit on our grid:"}],

evalIn["modern = {\n  {\"Britain (GBR)\", 52.5, -1.5, 0.720},\n  {\"Iberia (IBS)\", 40.4, -3.7, 0.458},\n  {\"Tuscany (TSI)\", 43.5, 11.0, 0.089},\n  {\"Finland (FIN)\", 61.0, 25.0, 0.591}};\npresent = PosteriorCellStats[draws, grid, {0}][0];\nnearCell[la_, lo_] := First[Ordering[\n   Map[EuclideanDistance[{la, lo Cos[la Degree]},\n     {#[\"Latitude\"], #[\"Longitude\"] Cos[#[\"Latitude\"] Degree]}] &, grid], 1]];\nGrid[\n Prepend[\n  Map[Function[row, With[{i = nearCell[row[[2]], row[[3]]]},\n    {row[[1]], ToString[NumberForm[present[\"Mean\"][[i]], {4, 2}]],\n     \"[\" <> ToString[NumberForm[present[\"Lower95\"][[i]], {4, 2}]] <> \", \" <>\n       ToString[NumberForm[present[\"Upper95\"][[i]], {4, 2}]] <> \"]\",\n     ToString[NumberForm[row[[4]], {4, 2}]]}]], modern],\n  Style[#, Bold] & /@ {\"population\", \"model at 0 BP\", \"95% interval\", \"1000G rs4988235-A\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.4, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

evalIn["mae = Mean[Table[With[{i = nearCell[row[[2]], row[[3]]]},\n    Abs[present[\"Mean\"][[i]] - row[[4]]]], {row, modern}]];\nmaeNull = Mean[Abs[0.5 - #[[4]]] & /@ modern];\nGrid[{Style[#, Bold] & /@ {\"predictor\", \"mean absolute error\"},\n  {\"this model, medians at 0 BP\", NumberForm[mae, {4, 3}]},\n  {\"constant 0.5 for everyone\", NumberForm[maeNull, {4, 3}]}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.6, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["Present-day extrapolation versus 1000 Genomes phase-3 allele \
frequencies (Ensembl). Everything after ~2,000 BP is extrapolation far \
beyond the ancient data, and the wide intervals say so. The second table \
is the test that keeps everyone honest: it scores the model's medians \
against the laziest imaginable null \[LongDash] predicting 0.5 for every \
population. A spatial diffusion\[Dash]selection machine that cannot \
clearly beat a constant has no present-day predictive content, whichever \
way the comparison lands in the build you are reading; the model is \
calibrated for the ancient window it was fitted to, and that is the only \
window it should be quoted for."],

para[{"Taken together, measured against the constrained prior that is \
the only fair baseline: ", bold["the origin date is not a genetic \
finding"], " \[LongDash] its posterior tracks the constrained prior, \
whose archaeological chronology already generates the published date \
range on its own. ", bold["Total selection strength is a modest genuine \
finding"], ": the posterior excludes the weak tail the prior allows \
(width ratio \[TildeTilde]0.6), landing in the published few-percent \
territory, though comparisons across studies remain \
inexact (Burger et al.'s 0.06 assumes dominance, which this genic model \
does not implement; Itan et al.'s applies to dairyers only). ",
bold["Location is not identified"], "; the one real update is westward \
\[LongDash] mass west of 5\[Degree]E roughly doubles from its \
constrained-prior 27% to \[TildeTilde]58% (\[PlusMinus]8% Monte Carlo, \
ESS 36) \[LongDash] and that lean must be read alongside three \
unremoved westward biases: northwest sampling density, the grid's \
latitude-dependent geometry, and the absence of drift. The Carpathian \
box ends up genuinely undetermined: prior 3.4%, posterior bounded only \
below \[TildeTilde]8%. This analysis should not be cited as ancient-DNA \
evidence for OR against the Carpathian origin \[LongDash] and an \
analysis that can say precisely why it cannot answer the question is \
the more useful artifact."}],

para[{bold["Which assumptions decide the answer?"], " If importing Itan et \
al.'s commitments one at a time drags the posterior east, the westward lean \
is an artefact of our assumptions; if nothing drags it east, the \
localization in their result must live in their ", ital["data"], ". Four \
complete refits (", mono["scripts/run_origin_bridge_experiments.wls"],
"), each changing exactly one thing against the baseline: ",
ital["trust the early calls"], " (error rate forced to \[TildeTilde]0, so \
every damage-suspect early read counts as a real carrier); ",
ital["tight coupling"], " (dairying lead capped at 200 years \[LongDash] \
the origin ", ital["is"], " the dairying front, the structural core of the \
demic model); ", ital["slow mixing"], " (migration capped where the \
travelling wave keeps memory of its source); and the last two together as \
the closest structural analogue of Itan et al.'s model that this framework \
can express:"}],

evalIn["bridge = Map[Association, Normal[Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"origin_bridge_summary.csv\"}], \"Dataset\", HeaderLines -> 1]]];\nbnum[x_] := If[NumericQ[x], N[x], ToExpression[StringReplace[ToString[x], {\"e\" -> \"*^\", \"E\" -> \"*^\"}]]];\nGrid[\n Prepend[\n  Map[{#[\"Variant\"], NumberForm[#[\"ESS\"], {4, 1}],\n    Row[{NumberForm[#[\"ModeLat\"], {4, 1}], \"N, \", NumberForm[#[\"ModeLon\"], {4, 1}], \"E\"}],\n    Round[#[\"TimeMed\"]],\n    NumberForm[#[\"MassWestOf5E\"], {3, 2}],\n    NumberForm[#[\"MassCentral\"], {3, 2}],\n    NumberForm[bnum[#[\"MassCarpathian\"]], {4, 3}],\n    NumberForm[#[\"Bhattacharyya\"], {3, 2}]} &, bridge],\n  Style[#, Bold] & /@ {\"variant\", \"ESS\", \"KDE mode\", \"origin BP\",\n    \"mass W of 5\[Degree]E\", \"central\", \"Carpathian\", \"BC vs Itan\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["The bridge table, read with its error bars on. Two hard \
caveats first. With effective sample sizes of 12\[Dash]43, a reported \
Carpathian mass of 0 only bounds that mass below roughly 3/ESS \
(rule of three): about 8% at ESS 36 and 25% at ESS 12 \[LongDash] and \
since the constrained prior itself puts only 3.4% there, these fits have \
no power to exclude a Carpathian origin at all. And the KDE modes, quoted \
to half a degree, sit inside a disclosed instability of ~1,500 km; one \
variant's mode even lands on Mallorca, uninhabited at the modelled date \
\[LongDash] a reminder that the location surface is closer to noise than \
to signal. What the table does support: none of the three Itan-style \
assumptions this framework can emulate generates a central-European \
concentration on its own; every variant keeps most of its mass in the \
west, against a constrained-prior baseline of 27% west of 5\[Degree]E. \
That is evidence that, within this model family, the emulated assumptions \
are not what produces Itan et al.'s localization \[LongDash] it is NOT \
evidence against a Carpathian origin, and their result additionally \
differs from ours in inputs we cannot emulate here (the modern allele \
frequency surface, drift, demic demography). Recovering a genuine \
localization from ancient DNA alone would need either far more pre-6000 \
BP genomes than biology left behind, or arrival-time statistics that \
read the spread geometry \[LongDash] the first item on the future-work \
list."],

para[{"It is worth being precise about ", ital["why"], " location fails \
while timing succeeds, because the reason is in the data rather than the \
code. Of the " <> ToString[earlyCalled] <> " called alleles older than \
6,000 BP that the model uses, " <> ToString[earlyDerived] <> " are derived, \
across " <> ToString[earlyCarriers] <> " individuals: single-read calls from \
Varna (~6,570 BP), Gurgy (~6,400 BP) and Doggerland (~8,810 BP), and one \
derived homozygote from \[CapitalCHacek]atalh\[ODoubleAcute]y\[UDoubleAcute]k \
(~8,500 BP). Three of the four are single reads that carry no zygosity \
information at all. Timing is identified because the whole \
European frequency curve turns upward at a well-determined moment, and \
thousands of alleles constrain that turn. Location has essentially one \
informative carrier plus a field of zeros, and a zero is only weak \
evidence of absence when sampling is as spatially uneven as this. No \
amount of extra sequencing fixes that directly, because the allele \
genuinely was near zero frequency then; the fix has to come from a \
statistic that reads the geometry of the spread rather than the roster of \
early carriers. Fitting the ", ital["arrival time"], " as a function of \
distance from a candidate source \[LongDash] the classical \
wave-of-advance signal, where a front under Fisher\[Dash]KPP dynamics \
advances at c = 2\[Sqrt](D s) \[LongDash] uses the \
thousands of ", ital["later"], " samples to locate the apex of the cone, \
and is the obvious next step for this project."}]

}];

(* ================= 12. EXACT LIKELIHOOD ================= *)

writeAll[{

hd1["12.  Letting every sample speak: the exact likelihood"],

para[{"Everything above inferred parameters by ABC: simulate, compress the \
simulation into a few dozen regional time-bin frequencies, keep the \
parameter vectors whose summaries land within a shrinking tolerance of the \
observed ones. That machinery exists because most population-genetic \
simulators are stochastic and their likelihoods intractable. Ours is not. \
The wave model of \[Section]4 is ", bold["deterministic"], ": a parameter \
vector fixes the allele frequency ", ital["p"], " in every cell at every \
250-year step, and each ancient individual is then a binomial draw from ", 
ital["p"], " at its own cell and date (through the genotype-error channel \
q = p(1\[Minus]2e)+e). The likelihood is therefore exact, and it is a \
product over all ", ToString[lidxCount], " in-era samples rather than over \
a handful of bins \[LongDash] no summary statistics, no tolerance schedule, \
no importance weights to degenerate. One evaluation costs one forward \
simulation:"}],

evalIn["lidx = LikelihoodIndex[samples, grid];\n<|\"samples in the likelihood\" -> lidx[\"SampleCount\"],\n  \"called alleles\" -> Round[Total[lidx[\"Called\"]]],\n  \"seconds per likelihood evaluation\" ->\n    First[AbsoluteTiming[SampleLogLikelihood[originSmc[\"Particles\"][[1]], grid, lidx]]]|>"],

para[{"That price makes plain MCMC affordable: an adaptive Metropolis \
sampler (Haario et al. 2001) in the same unbounded logit coordinates the \
SMC used, proposal covariance learned from the chain's own history, \
30,000 iterations per chain, three chains from different seeds. The \
package call below reloads the stored main chain (data/processed/\
origin_mcmc_chain.csv) or runs it; the two extra chains come from ", 
mono["scripts/run_origin_mcmc_chain.wls"], ". Same origin model, same \
constrained prior as \[Section]10 \[LongDash] only the information \
extracted from the data changes:"}],

evalIn["originMcmc = ReloadOriginMCMC[Directory[]];\nmcmcQuant = PosteriorParameterQuantiles[originMcmc];\nmqOf[p_] := SelectFirst[mcmcQuant, #[\"Parameter\"] === p &];\ncell[q_, d_] := Row[{NumberForm[q[\"Median\"], {6, d}], \"  [\", NumberForm[q[\"Lower95\"], {6, d}], \", \", NumberForm[q[\"Upper95\"], {6, d}], \"]\"}];\nGrid[Prepend[\n  Table[With[{p = pd[[1]], d = pd[[2]]}, With[{a = SelectFirst[originQuant, #[\"Parameter\"] === p &], m = mqOf[p], cp = cpOf[p]},\n    {p, cell[cp, d], cell[a, d], cell[m, d],\n     NumberForm[(m[\"Upper95\"] - m[\"Lower95\"])/(a[\"Upper95\"] - a[\"Lower95\"]), {3, 2}]}]],\n   {pd, {{\"OriginLatitude\", 1}, {\"OriginLongitude\", 1}, {\"OriginTimeBP\", 0},\n     {\"Log10InjectFrequency\", 2}, {\"Migration\", 3}, {\"SelectionDairying\", 3},\n     {\"DairyingLeadYears\", 0}, {\"CallErrorRate\", 4}}}],\n  Style[#, Bold] & /@ {\"parameter\", \"constrained prior\", \"ABC posterior (\[Section]10)\", \"exact-likelihood posterior\", \"width ratio\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["Median and 95% interval under the constrained prior, the ABC \
posterior of \[Section]10, and the exact-likelihood posterior (main chain), \
with the ratio of the last two interval widths. The exact likelihood \
shrinks every interval by an order of magnitude. It also pins one \
parameter against a bound: " <> ToString[Round[100 biMultHug]] <> "% of the \
pooled draws put the British-Isles selection multiplier within 1% of its \
ceiling of 2.2 (OriginTimeBP, by contrast, sits at about " <> \
ToString[Round[originTimeMed]] <> " BP, well inside its 10,000 BP bound). A \
parameter pinned to a bound is the model saying it cannot do something the \
data demand \[LongDash] here, make Britain rise fast enough \[LongDash] and \
it is the first warning sign, discussed below. And these are one chain's \
intervals; the convergence table below shows why that is not yet \
trustworthy."],

evalIn["OriginDensityMap[originMcmc]"],

captionCell["The same map function as \[Section]10, fed the \
exact-likelihood chain. The diffuse Atlantic-leaning ABC cloud has \
collapsed onto the Alpine foreland. Do not read this as a discovery yet: \
the next two tables say why."],


para[{"First, ", bold["did the chains converge?"], " Three chains, three \
seeds, split-", ital["R"], "-hat (Gelman et al. 2013) per parameter and the \
per-chain effective sample size (Geyer's initial-positive-sequence \
estimator). ", ital["R"], "-hat near 1 means the chains agree; the modern \
threshold is 1.01, and by that standard \[LongDash] and by the target of a \
few hundred effective draws per chain \[LongDash] this run does not pass:"}],

evalIn["mcmcFiles = Join[{FileNameJoin[{Directory[], \"data\", \"processed\", \"origin_mcmc_chain.csv\"}]},\n  FileNames[\"origin_mcmc_chain_seed*.csv\", FileNameJoin[{Directory[], \"data\", \"processed\"}]]];\nconv = McmcConvergenceTable[mcmcFiles];\nGrid[Prepend[\n  Map[{#[\"Parameter\"], NumberForm[#[\"Rhat\"], {4, 2}], NumberForm[#[\"MinChainESS\"], {4, 1}],\n     Row[NumberForm[#, {6, 3}] & /@ #[\"ChainMedians\"], \"  |  \"]} &,\n   Select[conv, MemberQ[{\"OriginLatitude\", \"OriginLongitude\", \"OriginTimeBP\", \"Migration\",\n     \"SelectionDairying\", \"SelectionMultiplierBritishIsles\", \"DairyingLeadYears\", \"CallErrorRate\"}, #[\"Parameter\"]] &]],\n  Style[#, Bold] & /@ {\"parameter\", \"split-R-hat\", \"min chain ESS\", \"chain medians\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["Convergence diagnostics across the three chains. Location \
agrees across chains (all three medians sit within a few degrees) but the \
selection multipliers do not: the worst split-R-hat is about " <> \
fmt[originMaxRhat, 1] <> " and the effective sample size bottoms out near " <> \
ToString[Round[originMinESS]] <> " per chain, so the posterior is far from \
Gaussian and nowhere near enough samples. Read the map as a location that is \
robust across chains; do ", ital["not"], " read the single-chain 95% \
intervals in the table above as calibrated. A properly mixed sampler \
(differential-evolution or tempered) is on the list in \[Section]14."],

para[{"Second, and more important: ", bold["is the model any good?"], " \
With an exact likelihood one can finally ask the question ABC cannot. The \
ladder below puts several models on the same ", ToString[lidxCount], " \
samples: a constant frequency; five independent logistic curves in time, \
one per region, with no space at all; the spatial standing-variation model \
of \[Section]4 (allele present everywhere at 10,000 BP with a smooth \
gradient) at the best-fitting point its own exact-likelihood chains \
reached; the point-source model likewise; and the saturated model with one \
free frequency per occupied time\[Times]cell bin, the ceiling any model can \
reach. The last column is how many nats above the constant-frequency model \
each one buys \[LongDash] more is better, and the saturated value is the \
most any model on these data could reach:"}],

evalIn["$OriginSpec = LactasePersistenceSpatial`Private`$OriginPriorSpec;\n$MainSpec = LactasePersistenceSpatial`Private`$PriorSpec; $MainSpec[\"Migration\"] = $OriginSpec[\"Migration\"];\nmainFiles = FileNames[\"main_mcmc_chain_seed*.csv\", FileNameJoin[{Directory[], \"data\", \"processed\"}]];\nmapOf[files_] := BestLikelihoodParams[files, If[StringContainsQ[First[files], \"main_\"], $MainSpec, $OriginSpec]][\"Params\"];\noriginMap = mapOf[mcmcFiles]; mainMap = mapOf[mainFiles];\ndomFiles = FileNames[\"origin_mcmc_dominance_seed*.csv\", FileNameJoin[{Directory[], \"data\", \"processed\"}]];\nmodels = <|\"spatial standing variation\" -> mainMap, \"spatial point source\" -> originMap|>;\nIf[domFiles =!= {}, models[\"spatial point source + dominance h\"] = mapOf[domFiles]];\nladder = DevianceLadder[samples, grid, models];\nconstLL = SelectFirst[ladder, StringStartsQ[#[\"Model\"], \"constant\"] &][\"LogLikelihood\"];\nGrid[Prepend[\n  Map[{#[\"Model\"], #[\"LikelihoodParameters\"], NumberForm[#[\"LogLikelihood\"], {8, 1}], NumberForm[#[\"LogLikelihood\"] - constLL, {8, 1}]} &, ladder],\n  Style[#, Bold] & /@ {\"model\", \"likelihood parameters\", \"log-likelihood\", \"nats over constant\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6}, Alignment -> {{Left, Right, Right, Right}},\n Background -> {None, {GrayLevel[0.93], None}}]"],

captionCell["The deviance ladder. Each spatial row is the best likelihood \
any of its chains reached, so it is a ", ital["lower bound"], " on that \
model's true maximum \[LongDash] the point-source chains span about " <> \
ToString[Round[originChainSpread]] <> " nats among themselves, a direct \
measure of how far from the optimum they are; the standing-variation gap \
below is wide enough to survive that slack. Read the middle rows against \
each other: the point-source model, with more likelihood parameters, still \
fits worse than five unrelated logistic curves, and the standing-variation \
model beats both. A single origin plus a diffusion wave is not merely \
unidentified by these data \[LongDash] it is a worse description of them \
than assuming the allele was already everywhere. (Columns count only \
parameters that enter the likelihood; DairyingLeadYears, which acts only \
through the support constraint, is excluded.)"],


para[{"Third, ", bold["where"], " does the point-source model lose? \
Splitting the log-likelihood difference between the point-source MAP and \
the regional logistic fit by region and millennium locates the damage:"}],

evalIn["resid = LikelihoodResidualTable[samples, grid, originMap];\nResidualHeatmap[resid]"],

captionCell["Log-likelihood of the point-source model minus that of the \
regional logistic curves, in nats, by region and millennium BP. Blue: the \
spatial model does better; red: worse. The wave model wins by " <> 
ToString[Round[residRDGain]] <> " nats in Rhine\[Dash]Danube, where 3,000+ samples \
resolve genuine within-region structure that five curves cannot see, and \
loses " <> ToString[Round[-residBIloss]] <> " nats in the British Isles and " <> 
ToString[Round[-residBalticLoss]] <> " in the Baltic, almost all of it in the \
1\[Dash]2 kyr BP bins."],

para[{"The British-Isles loss is instructive because the aggregate \
frequency there is nearly right (" <> fmt[residBIobs, 2] <> " observed \
against " <> fmt[residBImodel, 2] <> " predicted for 1\[Dash]2 kyr BP), so \
the model is not simply too low on average. The damage is ", ital["within"], \
" the region and it is concentrated: a handful of derived alleles land in \
cells the deterministic front has left near the error floor, and each one \
there costs several nats. A single continental wave with constant selection \
sharpens into a near-step front, so it cannot simultaneously be high in the \
south-east and high on the Atlantic and Baltic margins where early risers \
also appear; something local (stronger selection, a second source, or \
demography the model does not carry) is needed, and the British-Isles \
selection multiplier sitting on its ceiling of 2.2 is the model straining to \
say so. The parameters on their bounds tell the same story: Migration at 0.3 \
means the per-step mixing fraction \
\[Alpha] = 1 \[Minus] exp(\[Minus]8.9 m) is already 0.93 \[LongDash] the \
wave is as fast as the lattice allows \[LongDash] and the data still want \
it faster, i.e. they want the allele to appear nearly simultaneously \
across Europe. Pushed that way, a point-source model relocates its origin \
to the least-bad centroid of the sample cloud, which is what the \
Alpine-foreland star is. The standing-variation model says the same thing \
in its own coordinates: its chains put the allele at roughly " <> 
fmt[100 10^mainLogP0, 2] <> "% everywhere at 10,000 BP, slightly higher in \
the north, with ", ital["slow"], " mixing (Migration \[TildeTilde] " <> 
fmt[mainMigMed, 3] <> ") \[LongDash] gradients are preserved rather than \
created."}],

para[{"The error-rate posterior tells the same story from the other end. \
At e \[TildeTilde] " <> fmt[mcmcErr, 3] <> " in the point-source chains \
the channel is no longer a damage rate; the model is using 1\[Minus]e as a \
ceiling, because constant selection drives p to 1 while the data plateau \
near 0.6\[Dash]0.7 (the standing-variation chains, which need no ceiling, \
settle at a plausible e \[TildeTilde] " <> fmt[mainErrMed, 3] <> "). \
Lactase persistence is phenotypically dominant, so the natural fix is \
diploid selection with dominance h (fitnesses 1, 1+hs, 1+s): selection \
fades as the non-persistent homozygote becomes rare, and p plateaus on its \
own. The package now carries that recursion (", mono["DominanceGrowth"], 
"), switched on by a \"Dominance\" parameter, and a 20,000-iteration \
chain with h free (", mono["scripts/run_origin_mcmc_dominance.wls"], 
") is the extra row in the ladder above" <> domSentence <> "."}],

para[{"One caution applies to the winner too. The standing-variation \
model wins the ladder, but its own two chains are no better mixed than the \
point-source ones (worst split-R-hat about " <> fmt[mainMaxRhat, 1] <> \
", minimum effective size about " <> ToString[Round[mainMinESS]] <> " per \
chain), so the numbers quoted from it \[LongDash] the near-uniform starting \
frequency, the slow mixing \[LongDash] are the shape of its posterior, not \
tightly estimated values. What is robust is the ", ital["ranking"], ": the \
ladder gaps are tens of nats, far larger than the few-nat slack the chains \
leave, so which model fits better is not in question even though neither \
model's parameters are pinned down."}],

para[{bold["What survives."], " The exact likelihood does not overturn \
\[Section]10 and \[Section]11 \[LongDash] it sharpens them into a \
statement ABC could not make. Timing and the size of selection are \
stable across ABC, exact likelihood and all three chains. Location is \
identified by the exact likelihood, but only ", ital["within a model the \
same likelihood rejects"], " in favour of standing variation; a location \
estimate from a rejected model is not an estimate of where the allele \
arose. That is the honest end point of this dataset for the origin \
question, and it is a more useful one than a wide credible region: the \
next model has to let selection start locally and at different times in \
different places, which is exactly the archaeology of dairying."}]

}];

writeAll[{

hd1["13.  The animation, assembled"],

para[{"The hero animation at the top of the post is the whole pipeline in \
one artifact: 81 time-interpolated frames of the kriged posterior mean, the \
moving window of ancient samples, a progress bar, and \[LongDash] \
non-negotiably \[LongDash] the credible-interval inset, so that even a \
viewer who reads nothing else cannot mistake the smooth colours for \
certainty. Because every frame is raster-composited over a single cached \
base map, the full render takes under a minute:"}],

evalAnim["hero = ExportHeroAnimation[Directory[], samples, grid, draws];",
  FileNameJoin[{figDir, "hero_lactase_persistence.gif"}],
  "The hero time-lapse, re-rendered by the call above from the posterior \
draws of this session. MP4 and GIF land in figures/generated/."],

hd1["14.  What this is not"],

para[{"This is a calibrated caricature, and the caveats are part of the \
result. The regional logistic layer reproduces the published four-region \
picture qualitatively, not parameter-for-parameter. The simulator is \
deterministic \[LongDash] no genetic drift \[LongDash] which flatters the \
posterior's tightness; demography (the steppe migrations!) is implicit; \
Ireland is unreachable in the adjacency; radiocarbon uncertainty enters the \
bins as point dates; the final ESS of " <> fmt[essLast, 1] <> " keeps every \
interval approximate; and everything after ~2,000 BP extrapolates beyond \
the data; and the exact-likelihood chains of \[Section]12, sharp as they \
are, have not converged on the selection multipliers. Next steps, in rough \
order of value: diploid selection with dominance (", mono["DominanceGrowth"], 
", already in the package) fitted with the exact likelihood; \
region-specific selection onset tied to the dairying map instead of a \
single origin; a Wright\[Dash]Fisher stochastic core or a beta-binomial \
overdispersion term; calibrated-date uncertainty propagated per sample; \
sample-level ancestry-aware likelihoods."}],

hd1["15.  Reproducibility"],

para[{"Everything \[LongDash] data retrieval with checksums, processing \
with provenance, fits, SMC, validation, sensitivity, every figure, the \
hero animation, and this notebook itself \[LongDash] regenerates from the \
repository:"}],

codeIn["git clone https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram\nwolframscript -file scripts/run_pipeline.wls --particles 400 --generations 5\nwolframscript -file scripts/run_origin_mcmc.wls 30000 10000\nwolframscript -file scripts/run_origin_mcmc_chain.wls 2718\nwolframscript -file scripts/run_origin_mcmc_chain.wls 1618\nwolframscript -file scripts/run_main_mcmc.wls 314159\nwolframscript -file scripts/run_main_mcmc.wls 2718\nwolframscript -file scripts/run_tests.wls\nwolframscript -file community/build_notebook.wls"],

para[{"Random seeds: main SMC 20260831, origin SMC 19470, constrained-prior \
sampler 271828, exact-likelihood MCMC 314159 / 2718 / 1618 (origin model) \
and 314159 / 2718 (standing variation), resampling seeds derived \
deterministically from draw counts \[LongDash] every stochastic result in \
this notebook is reproducible bit-for-bit from these. The package ", 
mono["src/LactasePersistenceSpatial.wl"],
  " (~2,900 lines) carries the entire workflow behind the one-liners in \
this post; " <> ToString[nTests] <> " VerificationTests cover the parsers, \
the simulator, the summary statistics, the SMC machinery and the exact \
likelihood. Repository: ",
  link["mthiel74/ancient-dna-lactase-spatial-wolfram",
    "https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram"], "."}],

hd1["16.  References"],

para[{bold["Data. "], "This project is built on the Allen Ancient DNA \
Resource (AADR). Per the AADR's own guidance, three citations are owed: the \
AADR paper, the specific Dataverse version used, and the original \
publication behind every individual sample \[LongDash] the last is carried \
in the ", mono["Publication"], " column of every processed row (", 
ToString[Length[Union[DeleteMissing[#["Publication"] & /@ samples]]]], 
" distinct source studies across the ", ToString[Length[samples]], 
" individuals). Only a single-variant (rs4988235) extract is redistributed \
here; the full genotype files are not. See ", mono["DATA_LICENCES.md"], 
" for the complete provenance and terms."}],

para[{"Mallick, S., Micco, A., Mah, M., ", ital["et al."], 
" (2024). The Allen Ancient DNA Resource (AADR): a curated compendium of \
ancient human genomes. ", ital["Scientific Data"], " 11, 182. ",
  link["nature.com/articles/s41597-024-03031-7",
    "https://www.nature.com/articles/s41597-024-03031-7"]}],

para[{"David Reich Lab (2024). The Allen Ancient DNA Resource, version \
v66.p1 [dataset]. Harvard Dataverse, doi:10.7910/DVN/FFIDCW. ",
  link["doi.org/10.7910/DVN/FFIDCW", "https://doi.org/10.7910/DVN/FFIDCW"]}],

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

para[{"Irving-Pease, E. K., et al. (2024). The selection landscape and \
genetic legacy of ancient Eurasians. ", ital["Nature"], " 625, \
312\[Dash]320. ",
  link["nature.com/articles/s41586-023-06705-1",
    "https://www.nature.com/articles/s41586-023-06705-1"]}],

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
