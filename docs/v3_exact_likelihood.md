# v3: exact per-sample likelihood (2026-09-01, revised 2026-09-02)

## Why

The spatial simulator (`SimulateSpatialTrajectory`) is deterministic and each ancient
individual is a binomial draw from the simulated frequency at its own cell and
250-yr step, through the genotype-error channel q = p(1-2e)+e. The likelihood is
therefore exact and costs one forward run (~0.05 s on the 191-cell 2-degree grid).
SMC-ABC compressed 10,119 samples into ~39 regional time-bin frequencies plus a few
gradient statistics before comparing; the exact likelihood uses every one of the
6,034 in-era (<= 10,000 BP) called samples that lie within 2 deg of a grid cell.

## What was added (src/LactasePersistenceSpatial.wl)

- `CellIndexFor` / `CellDistanceFor` - a single cos-latitude-corrected cell-assignment
  rule, shared by the exact likelihood and the origin injection (the ABC summary path
  keeps its original raw-degree rule so stored ABC fits stay reproducible).
- `LikelihoodIndex[samples, grid]` - per-sample (time step, cell) positions and counts;
  drops samples further than `$LikelihoodSnapMaxDegrees` (=2) from any grid cell and
  reports how many (islands and margins the lattice does not cover: Faroes, Sardinia,
  central Anatolia) rather than silently relocating them.
- `SampleLogLikelihood[params, grid, lidx]` - exact binomial log-likelihood.
- `RunMCMC` - adaptive Metropolis (Haario et al. 2001, with Gelman/Roberts/Gilks 1996
  scaling and Roberts & Rosenthal 2009 acceptance-rate targeting) in the unbounded
  logit coordinates; `RunOriginMCMC`, `LoadOrRunOriginMCMC` (cache keyed by prior,
  snap geometry and seed - not chain length), and `ReloadOriginMCMC` (pure reload, no
  cache check or refit; used by the notebook and figure scripts).
- `AutocorrelationESS` - Geyer (1992) initial-positive-sequence ESS, autocorrelations
  precomputed by FFT so it stays O(n log n) on a barely-mixing chain.
- `DominanceGrowth` - diploid selection with dominance h (fitnesses 1, 1+hs, 1+s).
- `DevianceLadder` (reports likelihood-parameter counts, excluding the support-only
  DairyingLeadYears), `BestLikelihoodParams` (highest-likelihood vector across chains +
  per-chain best, converting stored LogPosterior back to log-likelihood),
  `RegionalLogisticMLE`, `LikelihoodResidualTable`, `ResidualHeatmap`,
  `McmcConvergenceTable` (split-Rhat + per-chain Geyer ESS).

## Runs (seeds in file names; 30k iterations, 10k burn, thin 5, except dominance 20k/7k)

Origin model: 3 chains (seeds 314159, 2718, 1618). Standing-variation model
(`run_main_mcmc.wls`, Migration prior widened to the origin range): 2 chains (314159,
2718). Dominance: 1 chain (314159).

## Deviance ladder (6,034 samples; data/processed/origin_mcmc_deviance.csv)

| model | likelihood params | log-likelihood | nats over constant |
|---|---:|---:|---:|
| constant frequency | 1 | -3819.8 | 0 |
| five independent regional logistics | 10 | -2722.2 | 1097.6 |
| spatial standing variation | 11 | -2653.0 | 1166.8 |
| spatial point source | 12 | -2767.5 | 1052.4 |
| spatial point source + dominance h | 13 | -2879.9 | 940.0 |
| saturated (1,010 occupied time x cell bins) | 1010 | -2172.1 | 1647.7 |

The point-source model fits worse than five unrelated logistic curves with more
likelihood parameters, and ~114 nats worse than standing variation with one fewer.
Its exact-likelihood posterior is sharp but the three chains disagree
(data/processed/origin_mcmc_convergence.csv: worst split-Rhat ~6.4, minimum per-chain
Geyer ESS ~3), and the British-Isles selection multiplier pins to its bound of 2.2:
the sharp location is the least-bad centroid of the sample cloud under a model the
data reject, not an estimate of where the allele arose.

## Residual decomposition (data/processed/origin_mcmc_residuals.csv)

Point-source (best-likelihood) minus regional-logistic log-likelihood, by region:
Rhine-Danube ~+68, Mediterranean and Other Europe near zero, Baltic ~-36, British
Isles ~-62, almost all of the losses in the 1-2 kyr BP bins. There the aggregate
frequency is nearly right (British Isles 0.64 observed vs 0.61 predicted); the loss is
within-region, from a handful of derived alleles landing in cells the deterministic
front has left near the error floor (each ~3.6 nats). The point-source e ~ 0.018 is
being used as a ceiling (1-e), not a damage rate; the standing-variation chains, which
need no ceiling, settle at e ~ 0.005.

## What this changes in the post

Section 12 of the notebook. Timing and selection size: stable across ABC, exact
likelihood and chains. Location: identified by the exact likelihood only inside a model
the same likelihood rejects in favour of standing variation; that is the end point of
this dataset for the origin question. Every figure is Wolfram-native and every number
in the section is recomputed at build time from the committed chain CSVs.

## Known limitations (see notebook sections 12 and 14)

- The chains do not meet modern convergence standards (Vehtari et al. 2021: Rhat <= 1.01,
  ESS >= 100/chain). Adaptive Metropolis is a weak sampler on these ridge-shaped
  posteriors; a differential-evolution or tempered sampler is the right next tool. The
  ladder ranking is robust to this (gaps of tens of nats vs a few-nat chain spread);
  single-chain credible intervals are not.
- Pseudo-replication: many samples share identical coordinates and dates (large single
  cemeteries), so nominal allele counts overstate the information; the nat scale of the
  ladder is approximate even though the ranking is not.
- Pseudo-haploid single-read calls (69% of samples) are treated as Bernoulli(p) with
  n=1; reference/mapping bias is not modelled.
- 60% of samples have no radiocarbon range and are archaeologically dated; the 250-yr
  snap is not the dominant date approximation.

## Next

Region-specific selection onset tied to the dairying map (no single origin);
beta-binomial overdispersion / Wright-Fisher core; per-sample calibrated-date
uncertainty; a better sampler for the ridge-shaped posteriors.
