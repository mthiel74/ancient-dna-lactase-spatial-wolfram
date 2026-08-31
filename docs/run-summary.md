# Run Summary

Generated: 2026-08-31T17:41:12

This is an executable baseline pipeline for the ancient lactase-persistence spatial model. It uses the public GLAD ancient genotype workbook derived from AADR v44.3 and fits a coarse regional and spatial model in Wolfram Language.

## Key Outputs

- Processed samples: `data/processed/glad_rs4988235_called_samples.csv`
- Regional binned frequencies: `data/processed/regional_time_binned_frequencies.csv`
- Regional logistic fits: `data/processed/regional_logistic_fits.csv`
- Regional reproduction figure: `figures/generated/regional_logistic_reproduction.png`
- ABC posterior: `data/processed/abc_posterior.csv`
- Posterior predictive checks: `data/processed/posterior_predictive_regional.csv`
- Spatial mean map: `figures/generated/spatial_posterior_mean_3000bp.png`
- Spatial uncertainty map: `figures/generated/spatial_uncertainty_width_3000bp.png`
- Spatial GIF animation: `figures/generated/lactase_persistence_spatial_posterior.gif`
- Spatial MP4 video: `figures/generated/lactase_persistence_spatial_posterior.mp4`
- iCloud GIF copy: `/Users/thiel/Library/Mobile Documents/com~apple~CloudDocs/Documents/Codex/20260831_174112_lactase_persistence_spatial_posterior.gif`
- iCloud MP4 copy: `/Users/thiel/Library/Mobile Documents/com~apple~CloudDocs/Documents/Codex/20260831_174112_lactase_persistence_spatial_posterior.mp4`

## Scientific Status

The regional logistic reproduction is a qualitative reproduction layer, not a claim of exact parameter identity with Evershed et al. 2022. The spatial model is deliberately coarse and is intended as a calibrated baseline for further refinement. The exported maps use ordinary kriging only as a geographic display layer over the coarse posterior grid.