# Run Summary

Generated: 2026-08-31T20:02:28

Pipeline: GLAD ancient rs4988235 genotypes (derived from AADR v44.3), regional binomial logistic reproduction, coarse spatial diffusion-selection model, SMC-ABC inference with spatial-gradient summary statistics, posterior predictive checks, held-out validation, and prior sensitivity analysis.

## Key Outputs

- Processed samples: `data/processed/glad_rs4988235_called_samples.csv`
- Regional binned frequencies: `data/processed/regional_time_binned_frequencies.csv`
- Regional logistic fits: `data/processed/regional_logistic_fits.csv`
- Regional reproduction figure: `figures/generated/regional_logistic_reproduction.png`
- SMC particles with weights: `data/processed/smc_particles.csv`
- Resampled posterior draws: `data/processed/abc_posterior.csv`
- SMC diagnostics: `data/processed/smc_diagnostics.csv`
- Posterior parameter quantiles: `data/processed/posterior_parameter_quantiles.csv`
- Posterior predictive checks: `data/processed/posterior_predictive_regional.csv`
- Parameter posterior figure: `figures/generated/abc_parameter_posteriors.png`
- Posterior predictive figure: `figures/generated/posterior_predictive_regional.png`
- Held-out-region cross-validation: `data/processed/cross_validation_by_region.csv`
- Time-slice validation: `data/processed/time_slice_validation.csv`
- Sensitivity quantiles: `data/processed/sensitivity_posterior_quantiles.csv`
- Sensitivity figure: `figures/generated/sensitivity_intervals.png`
- Spatial mean map: `figures/generated/spatial_posterior_mean_3000bp.png`
- Spatial uncertainty map: `figures/generated/spatial_uncertainty_width_3000bp.png`
- Spatial GIF animation: `figures/generated/lactase_persistence_spatial_posterior.gif`
- Spatial MP4 video: `figures/generated/lactase_persistence_spatial_posterior.mp4`
- iCloud GIF copy: `/Users/thiel/Library/Mobile Documents/com~apple~CloudDocs/Documents/Codex/20260831_202741_lactase_persistence_spatial_posterior.gif`
- iCloud MP4 copy: `/Users/thiel/Library/Mobile Documents/com~apple~CloudDocs/Documents/Codex/20260831_202741_lactase_persistence_spatial_posterior.mp4`

## Inference Notes

SMC-ABC: 400 particles, 5 tolerance generations, final epsilon 0.0444, final ESS 34.8, 10000 total simulations.

## Scientific Status

The regional logistic layer is a qualitative reproduction of the published four-region framing, not a claim of exact parameter identity with Evershed et al. 2022. The spatial model is deliberately coarse; ordinary kriging is a display layer only. Posterior uncertainty, held-out validation, and prior sensitivity are reported alongside every point summary.