# Brutal-critic review of the v3 section (2026-09-02) and fix status

Reviewed against commit `ecbcfde` (the first v3 build). Score 52/100, gate
"SHIP WITH FIXES" for both the Wolfram Community post and the public GitHub repo.
Every finding below was re-derived by the reviewer from the committed CSVs in Python.
All fixes are in commit `cf6dab3`; the exact-likelihood section was fully re-run on the
corrected geometry.

## Critical

- **C-1 "onto their prior bounds" caption refuted by its own table.** OriginTimeBP was
  not on its bound; the British-Isles selection multiplier was (~40% of draws at the
  ceiling). FIXED: caption now reports the British-Isles multiplier bound-hugging
  fraction and the OriginTimeBP median, both computed at build.
- **C-2 "636 called alleles >6000 BP, exactly one derived" was from the retired GLAD
  v44.3 file.** Live data: 1,200 called alleles the model uses, 5 derived across 4
  individuals (Varna, Gurgy, Doggerland single reads; a derived homozygote at
  Catalhoyuk). FIXED: prose recomputed from the likelihood index; the misplacement that
  put Catalhoyuk on the Aegean was the raw-degree cell metric (see C-7).
- **C-3 "jumps 500 km".** Actual distance 700-930 km. FIXED: the dominance sentence now
  computes the geodesic distance from the point-source estimate.
- **C-4 "the periphery is already high" contradicted by the data.** The only significant
  within-region British gradient runs eastward (the wave's direction); the loss exceeds
  all within-bin information. FIXED: replaced with the error-floor explanation (derived
  alleles landing in cells the deterministic front left near q = e).
- **C-5 ladder compared MAP (posterior) rows to MLEs and called both "log-likelihood".**
  FIXED: `BestLikelihoodParams` uses each model's best likelihood across chains; the
  caption labels it a lower bound and reports the per-chain spread (~9 nats).
- **C-6 ESS overstated ~3x; "pooled ESS" meaningless at Rhat=7.5.** FIXED:
  `AutocorrelationESS` is now Geyer initial-positive-sequence (FFT autocorrelation);
  the table reports per-chain min ESS (~3) and drops the pooled sum.
- **C-7 three different cell-assignment metrics; support and injection disagreed.**
  FIXED: one cos-latitude-corrected `CellIndexFor` for the likelihood, support and
  injection; a test asserts support and simulator agree on the origin cell.

## Major

- **M-1 DairyingLeadYears read as a fitted parameter though it is support-only.** FIXED:
  usage note + excluded from the ladder's likelihood-parameter count + prose corrected.
- **M-2 pseudo-replication (37% of samples in identical-coordinate clusters).** DISCLOSED
  in the notebook's limitations and docs; the ranking is robust, the nat scale is not.
- **M-3 anisotropic diffusion lattice (degree offsets).** DISCLOSED as future work; not
  re-engineered this pass (would change the model, not just the reporting).
- **M-4 "exact" oversells given date uncertainty (60% archaeologically dated).**
  DISCLOSED: one sentence scoping "exact" and a limitations bullet.
- **M-5 sampler mis-attributed to Haario et al. alone; obsolete Rhat threshold.** FIXED:
  cites Gelman/Roberts/Gilks (1996) and Roberts & Rosenthal (2009) alongside Haario, and
  states the modern Rhat<=1.01 / ESS>=100 standard (Vehtari et al. 2021), which this run
  fails - strengthening the section's own argument.
- **M-6 diagnostics shown for the rejected model, withheld for the endorsed one.** FIXED:
  the standing-variation model's own split-Rhat and ESS are now reported.
- **M-7 cache key ignored sampler settings / silently refit on reload.** FIXED: key is
  prior + geometry + seed (not length); `ReloadOriginMCMC` is a pure reload with no
  refit path, used by the notebook and figure scripts.
- **M-8 two scripts wrote incompatible schemas to the same filenames.** FIXED: the two
  superseded scripts (`compare_origin_mcmc_chains.wls`, `residual_decomposition.wls`)
  were deleted; `export_v3_figures.wls` is the single writer.

## Minor

- m-1 "deviance explained" denominator inflated by saturated overfit. FIXED: column
  replaced with "nats over constant".
- m-3 tautological/weak tests. FIXED: added likelihood-vs-binomial identity check with
  the dropped-sample accounting, a logistic-prior-density-vs-distribution test, a
  support/injection cell-agreement test, and a ladder-ordering test.
- m-5 stale iCloud path and v44.3 data-source line in README. FIXED.

## Not done (deliberately)

- No hosted CI (the repo owner asked earlier to drop the GitHub CI tests; tests run
  locally via `scripts/run_tests.wls`).
- A properly mixed sampler (differential-evolution / tempered) and pseudo-replication
  aggregation are listed as the next steps, not done in this pass.
