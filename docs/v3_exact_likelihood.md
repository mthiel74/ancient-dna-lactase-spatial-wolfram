# v3: exact per-sample likelihood (2026-09-01)

## Why

The spatial simulator (`SimulateSpatialTrajectory`) is deterministic and each ancient
individual is a binomial draw from the simulated frequency at its own cell and
250-year step, through the genotype-error channel q = p(1-2e)+e. The likelihood is
therefore exact and costs one forward run (0.05 s on the 191-cell 2-degree grid).
SMC-ABC compressed 10,119 samples into ~39 regional time-bin frequencies plus a few
gradient statistics before comparing; the exact likelihood uses every one of the
6,184 in-era (<= 10,000 BP) called samples at its own position.

## What was added (src/LactasePersistenceSpatial.wl)

- `LikelihoodIndex[samples, grid]` - per-sample (time step, cell) positions and counts.
- `SampleLogLikelihood[params, grid, lidx]` - exact binomial log-likelihood.
- `OriginSupportQ` - the same land + dairying-lead support constraint as the ABC path.
- `RunMCMC[samples, grid, opts]` - adaptive Metropolis (Haario et al. 2001) in the
  unbounded logit coordinates, covariance learned from the history, scale nudged to
  ~25% acceptance; returns an SMC-compatible association (uniform weights).
- `RunOriginMCMC`, `LoadOrRunOriginMCMC` (cache: data/processed/origin_mcmc_chain.csv).
- `DominanceGrowth` - diploid selection with dominance h (fitnesses 1, 1+hs, 1+s),
  switched on by a "Dominance" key.
- `DevianceLadder`, `RegionalLogisticMLE`, `LikelihoodResidualTable`,
  `ResidualHeatmap`, `McmcConvergenceTable`, `AutocorrelationESS`.

## Runs (seeds in file names)

| script | model | iterations | result |
|---|---|---|---|
| run_origin_mcmc.wls (seed 314159) | point source | 30k, burn 10k, thin 5 | 48.0N 10.4E, T 9378, e 0.016, min ESS 12 |
| run_origin_mcmc_chain.wls 2718 | point source | same | 44.7N 10.2E, T 9401, e 0.017 |
| run_origin_mcmc_chain.wls 1618 | point source | same | 45.3N 9.6E, T 9250, e 0.018 |
| run_main_mcmc.wls 314159 | standing variation (Migration prior widened to [0.02,0.3]) | same | p0 ~ 0.2%, lat gradient +, Migration 0.029, e 0.006 |
| run_main_mcmc.wls 2718 | standing variation | same | agrees |
| run_origin_mcmc_dominance.wls 314159 | point source + h | 20k, burn 7k | h 0.98, origin 53.0N 4.4E, T 7561, e 0.019; MAP LL -2801.5 (14 params) |

## Deviance ladder (6,184 samples; data/processed/origin_mcmc_deviance.csv)

| model | free params | log-likelihood | deviance explained |
|---|---|---|---|
| constant frequency | 1 | -3891.1 | 0 |
| five independent regional logistics | 10 | -2756.0 | 0.665 |
| spatial standing variation (MAP) | 11 | -2694.9 | 0.701 |
| spatial point source (MAP) | 13 | -2795.9 | 0.642 |
| spatial point source + dominance h (MAP) | 14 | -2801.5 | 0.638 |
| saturated (1051 occupied time x cell bins) | 1051 | -2184.7 | 1 |

The point-source model fits worse than five unrelated logistic curves with more
parameters, and ~100 nats worse than standing variation with two fewer. Its exact-
likelihood posterior is sharp (95% intervals of ~1 degree) but pinned against the prior
bounds of Migration (0.3: mixing fraction 1-exp(-8.9 m) = 0.93 per step), DairyingLeadYears
(2000) and OriginTimeBP (10,000), and the three chains give split-Rhat 2-7 on the
selection multipliers (data/processed/origin_mcmc_convergence.csv): the location is the
least-bad centroid of the sample cloud under a model the data reject.

## Residual decomposition (data/processed/origin_mcmc_residuals.csv)

Point-source MAP minus regional-logistic log-likelihood, by region: Rhine-Danube +82,
Mediterranean -8, Other Europe -4, Baltic -47, British Isles -64. The British/Baltic
losses sit in the 1-2 kyr BP bins where the aggregate frequency is nearly right
(British Isles 0.64 observed vs 0.58 predicted) and the within-region pattern is wrong:
a continental-arrival gradient across Britain against samples in which the periphery is
already high. The point-source e ~ 0.017 is not a damage rate but a ceiling (1-e) that
substitutes for a plateau; the standing-variation chains settle at e ~ 0.006.

## What this changes in the post

Section 12 of the notebook. Timing and selection size: unchanged and stable across
ABC, exact likelihood and chains. Location: identified by the exact likelihood only
inside a model the same likelihood rejects in favour of standing variation; that is the
end point of this dataset for the origin question.

## Next

Region-specific selection onset tied to the dairying map (no single origin); beta-binomial
overdispersion / Wright-Fisher core; per-sample calibrated-date uncertainty; a better
sampler for the ridge-shaped posteriors (DE-MC or tempered SMC on the exact likelihood).
