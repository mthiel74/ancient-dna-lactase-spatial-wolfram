# v2 rebuild checklist

Working list for the notebook/README rebuild after the v2 pipeline
(AADR v66 data + statistical fixes) finishes. Sources: brutal-critic
review (2026-09-01), codex review (2026-09-01), both archived in
/tmp on the build machine; key items reproduced here so nothing is lost.

## Already implemented in code (verify at rebuild)

- AADR v66.p1 dataset (10,119 deduped ancient individuals; loader prefers it).
- Genotype-error/damage nuisance parameter CallErrorRate ~ U(0, 0.02) in both
  models (G>A is the damage-mode transition; the early singleton carriers ride
  on this channel now).
- OriginTimeBP prior widened to U(5000, 10000); was boundary-pinned at 6800.
- Dairying lead is a fitted parameter U(0, 2000), no longer a hard 800.
- Origin migration prior capped at 0.3 (was 0.6; alpha saturation).
- Distance: binomial-precision (GLS) bin weights, Haldane-corrected; contrast
  weights = harmonic-mean effective n (was min-pool).
- Gen-1 rejection-samples the constrained prior; penalty sentinels can no
  longer contaminate the adaptive tolerance; PriorViolationRate recorded.
- Observation era capped at simulator start (10,000 BP); Palaeolithic bins no
  longer compared against the sim's initial state.
- Time-slice validation cut moved to a bin edge (3000 BP); no train/test leak.
- Cache fingerprints (samples + grid + prior) gate LoadOrRun* loaders.
- Wolfram-native ImportItanFig3Density + OriginItanHPDComparisonMap; figure is
  now generated in-notebook; Python digitiser kept as cross-check (mean |d|
  0.0016 on the ramp scale).
- Full TASL attribution for the Itan figure; independence claim qualified;
  48.5N/14E correctly attributed to OUR digitisation, not their text.

## Prose/number sweep required at rebuild (stale or wrong claims)

1. "selection ... inside every published range" -- FALSE as written (posterior
   CI excludes Irving-Pease 0.0194 and sits below Itan's interval). Rewrite as
   an explicit per-source table with exclusions named. Also compute the total
   selection INCLUDING regional multipliers, per particle (codex #10).
2. Report prior-vs-posterior information gain (CI-width ratio) per parameter
   in Section 6 and Section 10/11 tables; label width-ratio > 0.7 parameters
   as unidentified (brutal-critic C1). Compute prior-predictive intervals for
   every headline statistic and print them beside the posterior.
3. Origin-date claim: check whether the new posterior still hugs the prior
   floor; report P(OriginTimeBP < 6000). The Irving-Pease ~6,000 BP figure is
   now INSIDE the prior box, so the consistency claim becomes testable.
4. 1000G section: replace "brackets/ranks" framing with MAE/RMSE against the
   constant-0.5 null and a latitude-linear baseline (brutal-critic M5).
5. Coverage: report interval WIDTHS beside coverage; note that 36/37 or 37/37
   coverage has p ~= 0.44 under perfect calibration and cannot distinguish
   good fit from vacuous intervals (M9). State how many bins have n < 20.
6. ESS: propagate Monte Carlo error into every overlap statistic (bootstrap
   the weights, 500 reps); report BC to 2 significant figures with a CI (M8).
   Report the main model's final ESS prominently, not just the origin's.
7. Fix stale hardcoded numbers: "39 bins" (37), "10,000 simulations",
   sensitivity medians, migration-prior-widening direction, "comfortably
   bracketing Burger's 0.06" (regional fits max 0.041), hero caption
   "8000 BC" (8000 BP = 6050 BC), README "4-degree grid" (2-degree main).
8. Earliest-carriers table (Section 10): regenerate from v66; tell the
   redating story (Ukraine I6561 5600->3985 BP; Romania GB.SG het->GG;
   Bulgaria ANI163 survives) and mark which rows are in analysis regions.
9. SelectionDairying: report P(SelectionDairying < 0.005 | data) explicitly
   and cite Evershed 2022's finding that milk-use-varying selection is not
   better than uniform selection; the coupling is a modelling choice, not a
   data-driven conclusion (M6).
10. Location claims: report cell-level/broad-region probabilities, not
    decimal-degree modes (codex #5); keep the mode-instability disclosure.
11. Fit surface caption: label as conditional visualisation; no "ruled out"
    language without a calibrated threshold (codex #19).
12. Add DATA_LICENCES note: GLAD has no explicit licence (cite source pubs);
    Evershed 2022 under exclusive licence (numbers-only); AADR v66 from
    Harvard Dataverse; Itan 2009 CC BY.

## Deferred (state as future work in Section 13, honestly)

- Wright-Fisher drift core (deletes the need for the dairying-lead constraint).
- Dominance h=1 fitness recursion; restate selection on the h=1 scale.
- Arrival-time summary statistics with a detection model (the wave-of-advance
  statistic; the single highest-value methodological upgrade).
- Simulate-and-refit calibration test (SBC); synthetic origin-recovery
  horizon under fitted mixing (answers "can this model locate an origin at
  all?" -- brutal-critic C4/m10).
- Mahalanobis distance from prior-predictive summary covariance (removes the
  bins/contrasts double-counting).
- Per-edge great-circle-scaled mixing weights (grid anisotropy, m1/m2);
  equal-area grid.
- Log-space SMC weight arithmetic; full-covariance perturbation kernel.
- Ship a versioned land-mask CSV; pin GeoElevationData version (codex #24).
