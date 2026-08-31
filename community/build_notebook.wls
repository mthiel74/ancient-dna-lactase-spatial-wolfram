#!/usr/bin/env wolframscript
(* ::Package:: *)

(*  Build community/ancient_dna_lactase_persistence.nb — the long-form
    notebook for the Wolfram Community submission.

    Same architecture as the ENSO-emergence builder: cells are
    accumulated as expressions, images are embedded as Image[] rasters
    (resized + cached), the hero animation is an AnimatedImage so it
    plays inline on the Community post page, and the notebook is saved
    via UsingFrontEnd/CreateDocument/NotebookSave with a PDF export.

    Sections
    --------
      Abstract
      1. Why lactase persistence
      2. The data
      3. Reproducing the regional trajectories
      4. The spatial model
      5. SMC-ABC inference
      6. Results
      7. Validation
      8. Sensitivity
      9. What this is not
     10. Reproducibility
     11. References
*)

repoRoot = ParentDirectory @ DirectoryName[$InputFileName];
imgDir   = FileNameJoin[{repoRoot, "figures", "generated"}];
outNb    = FileNameJoin[{repoRoot, "community", "ancient_dna_lactase_persistence.nb"}];
outPdf   = FileNameJoin[{repoRoot, "community", "ancient_dna_lactase_persistence.pdf"}];

(* ---------------- helpers ---------------- *)

title[txt_]    := Cell[txt, "Title"];
subtitle[txt_] := Cell[txt, "Subtitle"];
hd1[txt_]      := Cell[txt, "Section"];
hd2[txt_]      := Cell[txt, "Subsection"];

para[stuff_]   := Cell[TextData[stuff], "Text",
   CellMargins -> {{50, 50}, {6, 6}}];

abstractCell[stuff_] := Cell[TextData[stuff], "Text",
   FontSize -> 14, CellMargins -> {{60, 60}, {6, 6}},
   Background -> RGBColor[0.98, 0.96, 0.90]];

bold[s_]   := StyleBox[s, FontWeight -> Bold];
ital[s_]   := StyleBox[s, FontSlant -> Italic];
mono[s_]   := StyleBox[s, FontFamily -> "Courier"];

link[txt_String, url_String] := Sequence[
   StyleBox[txt, FontWeight -> "SemiBold"],
   " (", StyleBox[url, FontFamily -> "Courier", FontSize -> 10], ")"
];

imgCacheDir = FileNameJoin[{repoRoot, "community", ".img-cache"}];
If[!DirectoryQ[imgCacheDir], CreateDirectory[imgCacheDir]];

resizedCopy[path_, target_: 900] := Module[{cached, w, h, im},
   cached = FileNameJoin[{imgCacheDir, FileNameTake[path]}];
   If[FileExistsQ[cached] &&
      FileDate[cached, "Modification"] > FileDate[path, "Modification"],
     Return[cached]];
   im = Import[path];
   {w, h} = ImageDimensions[im];
   If[w > target, im = ImageResize[im, target]];
   Export[cached, im, "PNG"];
   cached
];

imgWidth = 640;

imgCell[file_] := Module[
   {path = FileNameJoin[{imgDir, file}], small, im},
   If[FileExistsQ[path],
     small = resizedCopy[path];
     im = Image[Import[small], ImageSize -> imgWidth];
     Cell[BoxData @ ToBoxes[im], "Output",
        ShowCellLabel -> False,
        TextAlignment -> Center,
        CellMargins -> {{Automatic, Automatic}, {10, 6}}],
     Cell[
       TextData[{bold["[ missing figure: " <> file <> " ]"]}],
       "Text", FontColor -> RGBColor[0.7, 0.1, 0.1],
       TextAlignment -> Center]
   ]
];

animWidth = 640;

animCell[file_String, caption_] := Module[
   {path = FileNameJoin[{imgDir, file}], all, anim, boxes},
   If[!FileExistsQ[path],
     Return @ Cell[
       TextData[{bold["[ missing animation: " <> file <> " ]"]}],
       "Text", FontColor -> RGBColor[0.7, 0.1, 0.1],
       TextAlignment -> Center]];
   all = Import[path, {"GIF", "ImageList"}];
   all = ColorQuantize[ImageResize[#, {animWidth}], 256] & /@ all;
   anim = AnimatedImage[all,
      FrameRate -> 1.4,
      AnimationRunning -> True,
      AnimationRepetitions -> Infinity];
   boxes = ToBoxes[
      If[caption === "",
         anim,
         Column[{
            anim,
            Pane[Style[caption, Italic, FontSize -> 10,
               FontFamily -> "Helvetica", FontColor -> GrayLevel[0.35]],
               animWidth, Alignment -> Center]
         }, Alignment -> Center, Spacings -> 0.6]]];
   Cell[BoxData[boxes], "Output",
      ShowCellLabel -> False,
      TextAlignment -> Center,
      CellMargins -> {{Automatic, Automatic}, {10, 14}}]
];

captionCell[args__] := Cell[
   TextData[{args}], "Text",
   FontSlant -> Italic, FontSize -> 11,
   FontColor -> GrayLevel[0.35],
   CellMargins -> {{70, 70}, {2, 14}}
];

codeIn[code_String] := Cell[code, "Program",
   CellMargins -> {{60, 30}, {6, 6}},
   FontFamily -> "Courier", FontSize -> 11,
   ShowStringCharacters -> False,
   Background -> RGBColor[0.95, 0.96, 0.98]];

wlIn[code_String] := Cell[code, "Input",
   CellMargins -> {{60, 30}, {6, 6}},
   FontSize -> 11];

$allCells = {};
writeAll[cs_List] := (
   $allCells = Join[$allCells, cs];
   Print["  writeAll: +", Length[cs], " cells (total = ", Length[$allCells], ")"];
);

(* ----------------- TITLE, HERO, ABSTRACT ----------------- *)

writeAll[{

title["Mapping the rise of lactase persistence in ancient European DNA"],

subtitle["A spatial diffusion\[Dash]selection model fitted with sequential \
Monte Carlo ABC, in Wolfram Language"],

Cell["Wolfram Community submission \[LongDash] August 2026",
   "Subsubtitle", FontSlant -> Italic, FontColor -> GrayLevel[0.4]],

animCell["lactase_persistence_spatial_posterior.gif",
   "Cover animation. Posterior mean rs4988235-derived allele frequency \
(left) and 95% credible-interval width (right) over Europe, 8000 BP to \
the present in 500-year steps. White-ringed dots are the ancient samples \
within \[PlusMinus]500 years of each frame. Ordinary kriging is a display \
interpolation over the coarse 4\[Degree] inference grid; the uncertainty \
panel is rendered at equal rank with the mean, so confidence can be read \
off wherever the eye lands."],

hd1["Abstract"],

abstractCell[{"Lactase persistence is the textbook example of recent, \
strong selection in humans, and ancient DNA has turned its history into \
a quantitative time series: the derived allele tagged by ", mono["rs4988235"],
   " (the \[Minus]13910*T variant near ", mono["LCT/MCM6"],
   ") is essentially absent in Mesolithic Europe, still rare in the \
Bronze Age, and reaches 50\[Dash]90% in parts of north-western Europe \
today. This notebook builds an end-to-end Wolfram Language pipeline on \
the public GLAD ancient genotype workbook (2,999 samples, 1,785 with a \
usable call, age, and location): it reproduces the regional rise with \
binomial logistic fits, embeds it in an explicitly spatial \
diffusion\[Dash]selection model on a European grid with a dairying-onset \
covariate, and fits that model with SMC-ABC \[LongDash] 400 particles, \
adaptive tolerances falling 0.245 \[RightArrow] 0.044 over five \
generations, 10,000 forward simulations. Posterior predictive coverage \
is 0.97; held-out-region and held-out-time validation and a five-scenario \
prior sensitivity analysis are reported alongside every point estimate. \
The posterior puts dairying-modulated selection at roughly 1\[Dash]2% \
per generation (95% interval 0.001\[Dash]0.036) with northern regional \
multipliers above one \[LongDash] and, echoing Evershed et al. (2022), \
it cannot cleanly separate milk-use-modulated from uniform selection."}],

hd1["1. Why lactase persistence"],

para[{"Two facts make this system scientifically interesting rather than \
merely illustrative. First, direct ancient-DNA time series show the \
allele was still rare long after dairying became widespread: ",
   bold["Evershed et al. (2022, Nature)"],
   " found that a selection model varying with prehistoric milk \
exploitation explains the allele trajectories ", ital["no better"],
   " than uniform selection since the Neolithic \[LongDash] famine and \
pathogen exposure, not everyday milk drinking, are their preferred \
drivers. Second, the implied selection is very strong: ",
   bold["Burger et al. (2020, Current Biology)"],
   " estimate a selection coefficient of about 0.06 for rs4988235-A \
over the last 3,000 years, starting from a Bronze Age frequency of \
only ~7%. A spatial model fitted honestly to the ancient genotypes \
should therefore (i) recover few-percent selection, (ii) show whether \
the data can tell dairying-modulated from uniform selection at all, \
and (iii) be loud about where its uncertainty lives."}],

hd1["2. The data"],

para[{"The input is the public GLAD ancient genotype workbook derived \
from the Allen Ancient DNA Resource v44.3 and used for the Evershed et \
al. (2022) analysis. The retrieval function downloads the workbook, \
records a SHA-256 checksum and a provenance manifest, and marks the raw \
file read-only. Everything below is reproducible from the repository \
with two wolframscript commands (\[Section]10)."}],

wlIn["Get[FileNameJoin[{Directory[], \"src\", \"LactasePersistenceSpatial.wl\"}]];\nraw = RetrieveRawData[Directory[]];\nprocessed = WriteProcessedData[Directory[], raw];\nsamples = processed[\"CalledSamples\"];\nLength[samples]"],

para[{"Of 2,999 rows, ", bold["1,785 samples"], " carry a genotype call \
at rs4988235 together with usable age and coordinates. Genotype strings \
are normalized so that A (and the strand-flipped T, which occurs in 3 \
heterozygous calls) count as derived and G/C as ancestral; single-letter \
pseudo-haploid calls contribute one called allele, diploid calls two. \
Coordinates reported in millidegrees are rescaled, and each sample is \
assigned to one of four coarse analysis regions echoing the published \
framing: British Isles (171 samples / 304 called alleles / 9 derived), \
Rhine\[Dash]Danube (341 / 591 / 16), Mediterranean (486 / 837 / 28), \
Baltic (56 / 90 / 5). Two properties of these data discipline everything \
that follows: derived alleles are rare everywhere before ~4,000 BP, and \
sampling density collapses after ~2,500 BP, so any statement about the \
last two millennia is an extrapolation and is labelled as such."}],

hd1["3. Reproducing the regional trajectories"],

para[{"Before adding spatial structure, each region gets the standard \
non-spatial description: a binomial logistic trajectory ",
   mono["logit p(t) = \[Alpha] + \[Beta] (10000 - t)/1000"],
   ", fitted by direct maximization of the binomial log-likelihood over \
called alleles (no time binning enters the fit; bins are display only). \
Standard errors come from the numerical Hessian at the optimum, and the \
fitter flags any solution on a parameter bound \[LongDash] an earlier \
iteration of this project silently reported a boundary solution for the \
British Isles, which is exactly the failure mode the flag now catches."}],

wlIn["fits = FitAllRegionalLogistics[samples];\nExportRegionalFitOutputs[Directory[], samples, fits];\nDataset[fits]"],

imgCell["regional_logistic_reproduction.png"],

captionCell["Observed regional binned frequencies (points sized by \
called-allele count, 95% Wilson intervals) with fitted binomial logistic \
trajectories. Slopes per millennium (\[PlusMinus]1 SE): British Isles \
1.46 \[PlusMinus] 0.51, Rhine\[Dash]Danube 0.94 \[PlusMinus] 0.27, \
Mediterranean 0.86 \[PlusMinus] 0.16, Baltic 0.90 \[PlusMinus] 0.31. \
With a 28-year generation time these translate to approximate \
per-generation selection coefficients of 0.041, 0.026, 0.024, 0.025 \
\[LongDash] the familiar few-percent picture, strongest in the \
north-west, compatible with Burger et al.'s 0.06 for the last 3,000 \
years."],

hd1["4. The spatial model"],

para[{"Europe (35\[Dash]63\[Degree]N, 12\[Degree]W\[Dash]35\[Degree]E) \
is discretized into a 4\[Degree] grid of 84 cells. Each cell carries a \
regional dairying-onset time (Mediterranean 8200 BP, Rhine\[Dash]Danube \
7600, British Isles 6100, Baltic 5600, other 6500) smoothed into a \
covariate ", mono["D(t) = 1/(1 + exp((t - onset)/350))"],
   ". Local derived-allele frequency evolves in 250-year steps from \
10,000 BP to the present:"}],

codeIn["p[i, t+dt] = p[i, t] + g ( (s0 + sDairy D[i, t] m[region i]) p (1 - p)\n                             + mig mean[ p[j, t] - p[i, t], j adjacent to i ] )\n\ng = dt / 28   (generations per step)"],

para[{"with per-region selection multipliers ", mono["m"],
   " and a small latitudinal/longitudinal gradient allowed in the \
initial condition. One forward simulation costs ~26 ms, which is what \
makes honest simulation-based inference affordable: the full analysis \
uses ~40,000 simulations in under 20 minutes on a laptop. The model \
keeps demography implicit \[LongDash] it is a reaction\[Dash]diffusion \
caricature whose job is to let the data say how much spatial structure, \
movement, and dairying-modulation they can actually constrain."}],

wlIn["grid = BuildEuropeGrid[];\ntraj = SimulateSpatialTrajectory[\n  <|\"InitialFrequency\" -> 0.003, \"SelectionBase\" -> 0.002,\n    \"SelectionDairying\" -> 0.02, \"Migration\" -> 0.003|>, grid];\ntraj[\"TimesBP\"] // Length"]

}];

(* ----------------- INFERENCE, RESULTS, VALIDATION ----------------- *)

writeAll[{

hd1["5. SMC-ABC inference"],

para[{"The likelihood is intractable in useful form, so the fit is \
simulation-based, comparing two families of summary statistics between \
data and simulation: (i) called-allele-weighted ", bold["regional \
time-binned frequencies"], " (39 bins), and (ii) ", bold["spatial \
gradients"], " \[LongDash] because a spatial model fitted only to \
regional aggregates cannot identify migration, each sample is linked to \
its nearest grid cell and time step, and pooled north\[Dash]south and \
west\[Dash]east frequency contrasts over the last 4,000 years are \
computed identically for observed alleles and model expectations."}],

para[{"Inference is sequential Monte Carlo ABC: 400 particles, 5 \
generations, tolerance set each generation to the median of the previous \
population's distances, Gaussian perturbation kernels with twice the \
weighted component variance, importance weights ",
   mono["w \[Proportional] prior / \[CapitalSigma] w K"],
   ", and ESS tracking. One implementation detail worth flagging for \
anyone building something similar: with a 10-dimensional box prior, \
perturbing in the original coordinates wastes ~97% of proposals outside \
the box (0.7^10 \[TildeTilde] 0.03). The sampler therefore works in \
logit-transformed coordinates, where a uniform prior becomes an exact \
product of standard logistic densities, every proposal is automatically \
valid, and the prior density stays closed-form."}],

wlIn["smc = RunSMCABC[samples, grid, \"Particles\" -> 400, \"Generations\" -> 5,\n  \"ProgressFunction\" -> Function[{g, eps, acc, ess},\n    Print[\"generation \", g, \": epsilon \", eps, \", ESS \", ess]]];\ndraws = ResamplePosterior[smc, 100];\nExportSMCOutputs[Directory[], samples, grid, smc, draws];\nDataset[PosteriorParameterQuantiles[smc]]"],

para[{"Priors are uniform: ", mono["log10 p0 \[Element] [-4.2, -1.5]"],
   ", ", mono["s0 \[Element] [0, 0.015]"], ", ",
   mono["sDairy \[Element] [0, 0.06]"],
   " (spanning the published estimates), ",
   mono["mig \[Element] [0, 0.015]"],
   ", regional multipliers within [0.4, 2.4]. The tolerance fell from \
0.245 (prior median) to 0.044 over five generations and 10,000 \
simulations. The final effective sample size is 35 of 400 particles \
\[LongDash] importance-weight degeneracy is the known price of this \
weight formula when the posterior is much tighter than the prior, and \
it is reported rather than hidden; every interval below is a weighted \
quantile and should be read as approximate."}],

hd1["6. Results"],

imgCell["abc_parameter_posteriors.png"],

captionCell["Weighted SMC posterior (blue) against the flat prior \
(dashed orange) for all ten parameters. The informed dimensions are \
visible at a glance: initial frequency (posterior median p0 \
\[TildeTilde] 0.0012), dairying-modulated selection sDairy (median \
0.012, 95% interval [0.0014, 0.036]), baseline selection s0 (median \
0.005 [0.0004, 0.013]), and the northern multipliers (British Isles \
1.45, Baltic 1.37). The initial-gradient dimensions remain \
prior-dominated \[LongDash] equally visible, equally honest."],

para[{"Three readings. First, total effective selection in a northern \
dairying cell at the posterior median, ",
   mono["s0 + sDairy \[Times] m \[TildeTilde] 0.02"],
   " per generation, sits comfortably in the published few-percent \
range, with the northern multipliers pulled above 1 exactly where the \
logistic slopes were steepest. Second, the posterior does ", ital["not"],
   " cleanly separate dairying-modulated from baseline selection: the \
dairying covariate saturates within a few centuries of onset, so \
post-onset it acts almost like uniform selection \[LongDash] our \
small-model echo of Evershed et al.'s conclusion that milk-use-varying \
selection is not required by the allele trajectories. Third, migration \
is only weakly identified (\[Section]8)."}],

hd1["7. Validation"],

imgCell["posterior_predictive_regional.png"],

captionCell["Posterior predictive check over the 37 regional time bins: \
posterior draws \[RightArrow] forward simulation \[RightArrow] binomial \
sampling at each bin's allele count. Empirical 95% coverage is 0.97 \
(36/37). Bins with tiny allele counts (e.g. Baltic bins with n = 2) \
correctly produce near-full-range intervals rather than sharp wrong \
predictions."],

para[{bold["Held-out regions."],
   " Refitting with each region excluded and predicting its trajectory \
gives posterior-median RMSEs of 0.047 (Mediterranean), 0.065 \
(Rhine\[Dash]Danube), 0.173 (Baltic), 0.180 (British Isles), with the \
95% predictive intervals covering all held-out bins \[LongDash] wide \
where data are thin, rather than sharply wrong."}],

para[{bold["Held-out time."],
   " The most severe test: train only on samples older than 2,500 BP \
(1,543 samples) and predict the 7 most recent bins. The intervals still \
cover, but the median under-predicts the recent rise badly (RMSE 0.32). \
This is not a bug \[LongDash] it is the pipeline rediscovering, from \
deep-past data alone, that most of the evidence for strong late \
selection lives in the last three millennia, precisely the period \
Burger et al. (2020) analysed on independent grounds."}],

wlIn["cv = RunSMCCrossValidation[samples, grid];\ntimeSlice = RunTimeSliceValidation[samples, grid];\nDataset[cv]"],

hd1["8. Sensitivity"],

imgCell["sensitivity_intervals.png"],

captionCell["Posterior medians and 95% intervals under five scenarios: \
baseline, halved selection priors, doubled migration prior, and dairying \
onsets shifted \[PlusMinus]400 years. The dairying-modulated selection \
component stays positive throughout (medians 0.008\[Dash]0.019). The \
migration posterior tracks its prior (median 0.010 baseline \
\[RightArrow] 0.020 under the widened prior): with 84 cells and \
aggregated summaries, movement is weakly identified, and the pipeline \
says so rather than dressing a prior up as a finding."],

hd1["9. What this is not"],

para[{"The regional logistic layer is a qualitative reproduction of the \
published four-region picture, not a parameter-for-parameter replication \
of Evershed et al.'s analysis. The spatial model is a coarse caricature \
with implicit demography and a deterministic core; the final ESS is \
modest; and everything after ~2,000 BP extrapolates beyond the ancient \
data. Obvious next steps: a stochastic (Wright\[Dash]Fisher noise) \
simulator, ancestry-aware likelihoods at the sample level, an SMC \
sampler with MCMC rejuvenation moves to fight weight degeneracy, and \
radiocarbon-calibrated date uncertainty propagated into the bins."}],

hd1["10. Reproducibility"],

para[{"Everything \[LongDash] retrieval, processing, fits, SMC-ABC, \
validation, sensitivity, maps, animation, and this notebook \[LongDash] \
is generated by the repository at ",
   link["mthiel74/ancient-dna-lactase-spatial-wolfram",
        "https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram"],
   ":"}],

codeIn["wolframscript -file scripts/retrieve_data.wls\nwolframscript -file scripts/run_pipeline.wls --particles 400 --generations 5\nwolframscript -file scripts/run_tests.wls\nwolframscript -file community/build_notebook.wls"],

para[{"The package ", mono["src/LactasePersistenceSpatial.wl"],
   " (~1,700 lines) exposes the full workflow; ",
   mono["notebooks/LactasePersistenceSpatial.nb"],
   " walks the same pipeline interactively; 24 VerificationTests cover \
parsing, the simulator, the summary statistics, and the SMC machinery, \
and GitHub Actions runs them non-interactively. Raw data are preserved \
read-only with checksums; every processed table carries provenance."}],

hd1["11. References"],

para[{"Evershed, R. P., et al. (2022). Dairying, diseases and the \
evolution of lactase persistence in Europe. ", ital["Nature"],
   " 608, 336\[Dash]345. ",
   mono["https://www.nature.com/articles/s41586-022-05010-7"]}],

para[{"Burger, J., et al. (2020). Low prevalence of lactase persistence \
in Bronze Age Europe indicates ongoing strong selection over the last \
3,000 years. ", ital["Current Biology"], " 30(21), 4307\[Dash]4315. ",
   mono["https://www.cell.com/current-biology/fulltext/S0960-9822(20)31187-8"]}],

para[{"GLAD LP Ancient Genotypes 2022 workbook (UCL), derived from the \
Allen Ancient DNA Resource v44.3. ",
   mono["https://www.ucl.ac.uk/biosciences/sites/biosciences/files/glad_adna_15-8-22.xlsx"]}],

para[{Style["Generated on " <> DateString[Now, {"MonthName", " ",
    "DayShort", ", ", "Year"}] <> ".",
    FontSlant -> Italic, FontColor -> GrayLevel[0.4]]}]

}];

(* ---- save via front end so Image/AnimatedImage cells persist ---- *)

Print["assembled ", Length[$allCells], " cells"];

TimeConstrained[
   UsingFrontEnd[
      nbObj = CreateDocument[$allCells, Visible -> False,
         WindowSize -> {980, 800},
         StyleDefinitions -> "Default.nb"];
      NotebookSave[nbObj, outNb];
      Print["wrote ", outNb, " (", FileByteCount[outNb], " B)"];
      Quiet @ Check[
         Export[outPdf, nbObj];
         Print["wrote ", outPdf, " (", FileByteCount[outPdf], " B)"],
         Print["warn: PDF export failed"]];
      NotebookClose[nbObj];
   ],
   600,
   Print["warn: notebook save timed out"]
];
