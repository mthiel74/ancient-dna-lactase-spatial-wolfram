# Mapping the Rise of Lactase Persistence in Ancient European DNA

*A reproducible Wolfram Language pipeline: from raw ancient genotypes to a spatial diffusion–selection model fitted with sequential Monte Carlo ABC, with uncertainty carried through to the final animation.*

## Introduction

Lactase persistence is the textbook example of recent, strong selection in humans. The derived allele tagged by `rs4988235` (the −13910*T variant near `LCT`/`MCM6`) is essentially absent in Mesolithic and Early Neolithic European genomes and reaches frequencies of 50–90% in parts of north-western Europe today. Two facts make this scientifically interesting rather than merely illustrative. First, direct ancient-DNA time series show the allele was still rare long after dairying became widespread: Evershed et al. (2022, *Nature*) found that a selection model varying with prehistoric milk exploitation explains the trajectories *no better* than uniform selection since the Neolithic. Second, the implied selection is very strong: Burger et al. (2020, *Current Biology*) estimate a selection coefficient of about 0.06 for `rs4988235`-A over the last 3,000 years, starting from a Bronze Age frequency of only ~7%.

This post builds an end-to-end Wolfram Language pipeline that (i) reproduces the regional rise qualitatively from public ancient genotype data, (ii) embeds it in an explicitly spatial diffusion–selection model on a European grid with a dairying-onset covariate, and (iii) fits that model with sequential Monte Carlo approximate Bayesian computation (SMC-ABC), reporting posterior uncertainty, posterior predictive checks, held-out validation, and prior sensitivity — all the way into the final maps and animation. Everything below runs from two `wolframscript` commands; the repository is linked at the end.

## Data

The input is the public GLAD ancient genotype workbook (`glad_adna_15-8-22.xlsx`) derived from the Allen Ancient DNA Resource v44.3 and used for the Evershed et al. (2022) lactase-persistence analysis. The retrieval script downloads the workbook, records a SHA-256 checksum and a provenance manifest, and marks the raw file read-only.

Of 2,999 rows, 1,785 samples carry a genotype call at `rs4988235` together with usable age and coordinates. Genotype strings are normalized so that `A` (and the strand-flipped `T`, which occurs in 3 heterozygous calls) count as derived, `G`/`C` as ancestral; single-letter pseudo-haploid calls contribute one called allele, diploid calls two. Coordinates reported in millidegrees (e.g. `37724`) are rescaled, and each sample is assigned to one of four coarse analysis regions echoing the published framing — British Isles, Rhine–Danube, Mediterranean, Baltic — by country and coordinates.

Per region the called data are: British Isles 171 samples (304 called alleles, 9 derived), Rhine–Danube 341 (591, 16), Mediterranean 486 (837, 28), Baltic 56 (90, 5). Two properties of these data discipline everything that follows: derived alleles are rare everywhere before ~4,000 BP, and the sampling density collapses after ~2,500 BP, so any statement about the last two millennia is an extrapolation and is labelled as such.

## Step 1: reproduce the regional trajectories

Before adding spatial structure, the pipeline fits the standard non-spatial description: an independent binomial logistic trajectory per region,

```
logit p_r(t) = alpha_r + beta_r (10000 - t)/1000,     t in years BP
```

by direct maximization of the binomial log-likelihood over the called alleles (no time binning enters the fit; bins are only used for display, where each point carries a 95% Wilson interval and is sized by its allele count). Standard errors come from the numerical Hessian at the optimum, and the fitter flags any solution that lands on a parameter bound — an earlier iteration of this project silently reported a boundary solution for the British Isles, which is exactly the failure mode this flag now catches.

The fitted slopes per millennium (±1 SE) are: British Isles 1.46 ± 0.51, Rhine–Danube 0.94 ± 0.27, Mediterranean 0.86 ± 0.16, Baltic 0.90 ± 0.31. With a 28-year generation time, a slope on the logit scale translates to an approximate per-generation (genic, codominant) selection coefficient of 0.041, 0.026, 0.024 and 0.025 respectively — the familiar picture of few-percent selection, strongest in the north-west, and broadly compatible with the 0.06 that Burger et al. estimate when they restrict attention to the last 3,000 years. The Mediterranean fit, extrapolated to the present, gives ~0.29 — usefully close to the observed modern southern-European frequencies — while the British Isles extrapolation (~0.93) leans on no data more recent than ~2,000 BP.

## Step 2: the spatial model

Europe (35–63°N, 12°W–35°E) is discretized into a 4° grid of 84 cells. Each cell `i` carries its region label and a regional dairying-onset time (Mediterranean 8200 BP, Rhine–Danube 7600, British Isles 6100, Baltic 5600, other 6500), smoothed into a covariate `D_i(t) = 1/(1 + exp((t - onset_i)/350))`. The local derived-allele frequency evolves in 250-year steps from 10,000 BP to the present:

```
p_i(t+dt) = p_i(t) + g [ (s0 + s_dairy D_i(t) m_r(i)) p_i (1 - p_i) + mig * mean_{j~i}(p_j - p_i) ]
```

where `g = dt/28` counts generations, `j~i` are the rook-adjacent cells, `m_r` is a per-region selection multiplier, and the initial condition allows a small latitudinal/longitudinal gradient around a shared initial frequency `p0`. One forward simulation costs ~26 ms, which is what makes honest simulation-based inference affordable: the full analysis below uses ~40,000 simulations in under 20 minutes on a laptop.

The model deliberately keeps demography implicit. It is a reaction–diffusion caricature, not a population-genetic reconstruction; its job is to let the *data* say how much spatial structure, movement, and dairying-modulation they can actually constrain.

## Step 3: summary statistics and SMC-ABC

The likelihood is intractable in useful form, so the fit is simulation-based. Two families of summary statistics are compared between data and simulation:

1. **Regional time-binned frequencies** — pooled derived-allele frequency per region per 1,000-year bin, weighted by called-allele count (39 bins).
2. **Spatial gradients** — because a spatial model fitted only to regional aggregates cannot identify migration, each called sample is linked to its nearest grid cell and time step, and pooled north−south (lat ≥ 52 vs < 46) and west−east (lon < 5 vs ≥ 15) frequency contrasts over the last 4,000 years are computed *identically* for observed alleles and model expectations.

The distance is a weighted root-mean-square over all summaries. Inference is rejection-free SMC-ABC (population Monte Carlo): 400 particles, 5 generations, tolerance set each generation to the median of the previous population's distances, Gaussian perturbation kernels with twice the weighted component variance, and importance weights `w_i ∝ π(θ_i) / Σ_j w_j K(θ_i | θ_j)`. One implementation detail is worth flagging for anyone building something similar: with a 10-dimensional box prior, perturbing in the original coordinates wastes ~97% of proposals outside the box (0.7¹⁰ ≈ 0.03). The sampler therefore works in logit-transformed coordinates, where a uniform prior becomes an exact product of standard logistic densities, every proposal is automatically valid, and the prior density in the weight formula stays closed-form.

Priors are uniform: `log10 p0 ∈ [−4.2, −1.5]`, `s0 ∈ [0, 0.015]`, `s_dairy ∈ [0, 0.06]` (spanning the published estimates), `mig ∈ [0, 0.015]`, regional multipliers within [0.4, 2.4], initial gradients small. The tolerance fell from 0.245 (prior median) to 0.044 over five generations and 10,000 simulations. The final effective sample size is 35 of 400 particles — importance-weight degeneracy is the known price of this weight formula when the posterior is much tighter than the prior, and it is reported rather than hidden; every interval below is a weighted quantile and should be read as approximate.

## Results

Weighted posterior medians and 95% intervals:

| parameter | median | 95% interval |
|---|---|---|
| initial frequency p0 | 0.0012 | [9×10⁻⁵, 0.021] |
| baseline selection s0 | 0.0049 | [0.0004, 0.013] |
| dairying-modulated selection s_dairy | 0.012 | [0.0014, 0.036] |
| migration/diffusion mig | 0.0098 | [0.0007, 0.0145] |
| multiplier, British Isles | 1.45 | [0.82, 2.08] |
| multiplier, Baltic | 1.37 | [0.92, 2.33] |
| multiplier, Rhine–Danube | 1.06 | [0.67, 1.78] |
| multiplier, Mediterranean | 1.06 | [0.42, 1.38] |

Three readings. First, the total effective selection in a northern dairying cell at the posterior median, `s0 + s_dairy·m ≈ 0.02` per generation, sits comfortably in the published few-percent range, with the northern multipliers pulled above 1 exactly where the logistic slopes were steepest. Second, the posterior does *not* cleanly separate `s_dairy` from `s0`: the dairying covariate saturates to 1 everywhere within a few centuries of onset, so post-onset it acts almost like uniform selection, and only the early period carries contrast. That the data allow both a mostly-uniform and a mostly-dairy-modulated reading is our small-model echo of Evershed et al.'s conclusion that milk-use-varying selection is not required by the allele trajectories. Third, migration is only weakly identified — see the sensitivity analysis.

The parameter figure overlays each weighted posterior histogram on its flat prior, so it is visible at a glance which dimensions the data actually moved (`p0`, `s_dairy`, the northern multipliers) and which remain prior-dominated (the initial gradients).

Maps show the kriged posterior mean frequency and, separately, the kriged width of the 95% credible interval, at each time step; ordinary kriging is used strictly as a display interpolation over the coarse grid, which remains the inferential unit. The animation pairs both panels from 8,000 BP to the present in 500-year steps, with the ancient samples of each time window drawn on the map, so the eye can check density against confidence directly.

## Validation

**Posterior predictive checks.** For each of the 37 regional time bins, the posterior predictive distribution (posterior draws → forward simulation → binomial sampling at the bin's allele count) covers the observed frequency in 36 cases — empirical 95% coverage of 0.97 on in-sample bins.

**Held-out regions.** Refitting with each region excluded and predicting its trajectory gives RMSEs of 0.047 (Mediterranean), 0.065 (Rhine–Danube), 0.173 (Baltic), 0.180 (British Isles) against posterior medians, with the 95% predictive intervals covering all held-out bins — the intervals are honestly wide where the data are thin, rather than the predictions being sharp.

**Held-out time.** The most severe test: train only on samples older than 2,500 BP (1,543 samples) and predict the 7 most recent bins. The predictive intervals still cover, but the median under-predicts the recent rise badly (RMSE 0.32). This is not a bug; it is the pipeline rediscovering, from the deep-past data alone, that most of the evidence for *strong late* selection lives in the last three millennia — precisely the period Burger et al. (2020) analysed on independent grounds.

## Sensitivity

The full SMC-ABC fit is rerun under five scenarios: baseline; halved selection priors; doubled migration prior; and dairying onsets shifted ±400 years in every region. Across all five, the dairying-modulated selection component stays positive with medians between 0.008 and 0.019 — the qualitative conclusion survives. The migration posterior, by contrast, tracks its prior (median 0.010 under the baseline prior, 0.020 when the prior is widened): with 84 cells and regionally aggregated summaries, movement is weakly identified, and the pipeline says so rather than dressing a prior up as a finding.

## What this is not

The regional logistic layer is a qualitative reproduction of the published four-region picture, not a parameter-for-parameter replication of Evershed et al.'s analysis. The spatial model is a coarse caricature with implicit demography and a deterministic core; the ESS of the final SMC population is modest; and everything after ~2,000 BP extrapolates beyond the ancient data. Obvious next steps: a stochastic (Wright–Fisher noise) simulator, ancestry-aware likelihoods at the sample level, an SMC sampler with MCMC rejuvenation moves to fight weight degeneracy, and radiocarbon-calibrated date uncertainty propagated into the bins.

## Reproducibility

```
wolframscript -file scripts/retrieve_data.wls
wolframscript -file scripts/run_pipeline.wls --particles 400 --generations 5
wolframscript -file scripts/run_tests.wls
```

The package (`src/LactasePersistenceSpatial.wl`, ~1,650 lines) exposes the full workflow — `RetrieveRawData`, `WriteProcessedData`, `FitAllRegionalLogistics`, `RunSMCABC`, `RunSMCCrossValidation`, `RunTimeSliceValidation`, `RunSensitivityAnalysis`, `ExportSpatialVisualizations` — and 24 `VerificationTest`s cover parsing, the simulator, the summary statistics, and the SMC machinery; GitHub Actions runs them non-interactively.

Repository: <https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram>

## References

- Evershed, R. P., et al. (2022). Dairying, diseases and the evolution of lactase persistence in Europe. *Nature* 608, 336–345. <https://www.nature.com/articles/s41586-022-05010-7>
- Burger, J., et al. (2020). Low prevalence of lactase persistence in Bronze Age Europe indicates ongoing strong selection over the last 3,000 years. *Current Biology* 30(21), 4307–4315. <https://www.cell.com/current-biology/fulltext/S0960-9822(20)31187-8>
- GLAD LP Ancient Genotypes 2022 workbook (UCL), derived from the Allen Ancient DNA Resource v44.3.
