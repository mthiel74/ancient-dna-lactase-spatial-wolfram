# Mapping The Rise Of Lactase Persistence With Ancient DNA

## Introduction

Lactase persistence is one of the clearest examples of recent human adaptation. The derived allele at `rs4988235` near `LCT/MCM6` is rare in early ancient European genomes and rises sharply toward the present, but the timing and geography of that rise remain scientifically interesting because dairying, demography, disease, and selection are entangled.

This project uses Wolfram Language to move from public ancient genotype data to a reproducible baseline model: first regional logistic trajectories, then a coarse spatial diffusion-selection model with approximate Bayesian computation.

## Data And Methods

The input data are the GLAD LP Ancient Genotypes 2022 workbook, derived from AADR v44.3 and used for Evershed et al. 2022. The retrieval script downloads the workbook, records a SHA-256 checksum, writes a manifest, and treats the raw file as read-only.

The parser extracts sample ID, publication, locality, country, latitude, longitude, mean date in years BP, date range, rs4988235 read depth, and the most likely genotype call. Calls at `rs4988235` are normalized so that `A` and strand-notation `T` count as lactase-persistence-derived alleles, while `G` and `C` count as ancestral.

## Regional Reproduction Model

For each region, the first-pass reproduction model is a binomial logistic trajectory:

```text
logit(p_r(t)) = alpha_r + beta_r (10000 - t) / 1000
```

where `t` is years before present and `p_r(t)` is the derived allele frequency in region `r`.

The fitted curves are overlaid on time-binned observed frequencies for the British Isles, Rhine-Danube axis, Mediterranean Europe, and Baltic region.

## Spatial Model

Europe is represented as a coarse latitude-longitude grid. Each cell has a regional dairying-onset time. Allele frequency evolves under selection and adjacency-based movement:

```text
p_i(t + dt) = p_i(t) + selection_i(t) + migration_i(t)
selection_i(t) = g dt (s_0 + s_dairy D_i(t)) p_i(t) (1 - p_i(t))
migration_i(t) = g dt m mean_j(p_j(t) - p_i(t))
```

where `D_i(t)` is a smooth dairying-onset covariate and `j` indexes adjacent cells.

For visualization, those posterior cell values are projected back into geographic coordinates and rendered with ordinary kriging on top of `GeoGraphics` country borders. Kriging is treated as a display interpolation, not as a claim that the inference has finer resolution than the underlying grid.

## Inference

The baseline inference uses rejection ABC. Summary statistics are regional time-binned allele frequencies. The prior places selection on the order of a few percent per generation and uses broad low migration rates suitable for a coarse Holocene-scale model.

The retained particles form a posterior approximation used for posterior predictive checks and maps.

## Results

The generated outputs include:

- regional binned frequency table
- regional logistic parameter table
- regional reproduction plot
- ABC simulation table
- retained ABC posterior table
- posterior predictive regional checks
- held-out-region cross-validation summary
- kriged posterior mean spatial map
- kriged posterior uncertainty spatial map
- calibrated spatial animation

## Uncertainty

The animation does not show only a colored posterior mean. A paired uncertainty panel shows the posterior 95% interval width over the same time frames, with ancient sample locations shown for the active time window on the geographic map.

## GitHub And Notebooks

Repository: <https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram>

The data retrieval notebook script is `notebooks/data-retrieval.wls`. The full pipeline is `scripts/run_pipeline.wls`.
