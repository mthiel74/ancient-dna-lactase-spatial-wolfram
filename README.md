# Ancient DNA Lactase Persistence Spatial Model

Extended Markdown specification for a Wolfram Language project that moves from raw ancient DNA genotype data through statistical inference and spatial modelling to a calibrated animation with explicit uncertainty.

Repository target: `mthiel74/ancient-dna-lactase-spatial-wolfram`

## Project Goals

Build an end-to-end Wolfram Language pipeline for the evolution of lactase persistence in ancient European DNA:

- Ingest raw ancient DNA genotype data.
- Parse sample age, geographic location, region, and genotype at `rs4988235`.
- Reproduce the published non-spatial regional trajectory fits first.
- Extend the model to a spatial European grid or mesh.
- Fit selection, migration, and dairying-onset effects with transparent uncertainty.
- Generate calibrated figures and an animation that shows posterior mean frequency and uncertainty without fake precision.
- Package the result as reproducible notebooks, source code, tests, figures, and a Wolfram Community narrative post.

The initial scientific target is the Allentoft et al. 2022 dataset and supplement.

## Data Sources

Primary data target:

- Allentoft et al. 2022 ancient DNA dataset and supplementary material.
- Public repositories referenced by the study.
- Curated public mirrors only when the original source is unavailable or unsuitable for automated retrieval.

The pipeline must parse, at minimum:

- sample identifier
- sample age or calibrated date
- geographic location
- analysis region
- genotype at `rs4988235`
- missingness and genotype-call quality where available
- source file and extraction provenance

Raw data handling:

- Store raw files under `data/raw/`.
- Treat raw files as read-only after retrieval.
- Never overwrite raw files in place.
- Create processed versions under `data/processed/`.
- Attach provenance notes to every processed dataset, including retrieval date, source URL, checksum, parser version, and filtering decisions.

## Published Trajectory Reproduction

The first analysis milestone is to reproduce the published non-spatial regional fits from the 2022 study before adding spatial dynamics.

Required reproduction steps:

- Implement regional logistic fits matching the study's modelling assumptions as closely as possible.
- Bin or otherwise summarize observations through time by region in a way that is explicitly documented.
- Plot observed genotype frequencies through time by region.
- Overlay fitted logistic trajectories.
- Confirm qualitative agreement with the published figures before adding the spatial extension.

For a region `r`, a starting reproduction model may be written as:

```text
logit(p_r(t)) = alpha_r + beta_r t
```

where `p_r(t)` is the lactase-persistence allele or genotype frequency at time `t`. The final implementation should match the published study's parameterization wherever the paper and supplement provide enough detail.

## Spatial Extension

After the regional fits are reproduced, extend the model over Europe as a spatial domain.

Spatial representation:

- Use Europe as a 2D grid or mesh.
- Encode spatial adjacency for local diffusion, migration, or dispersal.
- Alternatively implement a kernel-based movement model if it is easier to calibrate and validate.
- Keep spatial resolution coarse enough that uncertainty is honest relative to the data density.

Core biological and cultural components:

- Let local lactase-persistence frequency evolve through selection and movement.
- Add regional dairying onset as a covariate that modulates the strength or timing of selection.
- Keep priors on selection anchored to the literature, with selection on the order of a few percent per generation.
- Keep migration or diffusion rates in a plausible Holocene European range and test sensitivity.

A minimal spatial dynamic can be expressed as:

```text
p_i(t + 1) = p_i(t) + selection_i(t) + migration_i(t)
```

with:

```text
selection_i(t) = s_i(t) p_i(t) (1 - p_i(t))
migration_i(t) = m sum_j A_ij (p_j(t) - p_i(t))
s_i(t) = s_0 + s_dairy D_i(t)
```

where `i` and `j` index grid cells, `A_ij` is spatial adjacency, `m` is a migration or diffusion parameter, `D_i(t)` is a dairying-onset covariate, and `s_i(t)` is the local selection coefficient.

Likelihood:

- Link each ancient sample to the closest or most appropriate grid cell.
- Evaluate the expected genotype probability at the sample's location and age.
- Account for genotype uncertainty or missingness where available.
- Avoid overconfident interpolation in regions and periods with sparse data.

## Inference Plan

Start with approximate Bayesian computation because it is robust for simulation-heavy models and can be implemented cleanly in Wolfram Language.

Initial ABC summary statistics:

- regional time-binned genotype or allele frequencies
- temporal slopes by region
- onset timing or midpoint estimates from logistic fits
- spatial gradients through time
- contrasts between dairying and non-dairying regions

Inference stages:

- Begin with rejection ABC to validate the simulator and summaries.
- Move to SMC-ABC if rejection ABC is too inefficient.
- Use simulation-based inference if compute resources and tooling allow.
- Track tolerances, retained particles, summary distances, and effective sample sizes.

Priors:

- Selection coefficients: anchored to published lactase-persistence estimates, roughly a few percent per generation.
- Migration or diffusion: plausible for Holocene Europe, with broad sensitivity checks.
- Dairying effect: weakly informative, allowing no effect through strong modulation.
- Regional initial conditions: constrained by early observed ancient DNA where possible.

Sensitivity:

- Re-run fits under wider and narrower selection priors.
- Test alternative migration priors.
- Test alternative dairying-onset encodings.
- Report which scientific conclusions are robust and which are prior-sensitive.

## Validation

Use posterior predictive checks and cross-validation before presenting the spatial extension as scientifically meaningful.

Validation tasks:

- Hold out regions and predict their time trajectories.
- Hold out time slices and predict observed frequencies.
- Compare observed values to posterior predictive distributions.
- Plot calibration diagnostics, not only posterior means.
- Quantify uncertainty in both space and time.

Required validation figures:

- observed versus posterior predictive regional frequencies
- held-out region/time-slice predictive checks
- posterior distributions for core parameters
- sensitivity comparison across prior choices
- map panels showing posterior uncertainty, not just posterior mean

## Visualization And Animation

Use Wolfram Language visualization tools throughout.

Required tools:

- `GeoGraphics` for spatial maps and sample locations.
- `ListAnimate` or exported animation frames for temporal dynamics.
- Standard plotting functions for regional reproduction and diagnostics.

Animation requirements:

- Render posterior mean lactase-persistence frequency over time.
- Add an explicit uncertainty layer, such as credible interval width, opacity, hatching, or separate panels.
- Show ancient sample locations used in each time window.
- Avoid blob visuals and fake precision.
- Use a spatial resolution that reflects data density and posterior uncertainty.
- Include clear legends, time labels, and uncertainty explanations.

## Testing And Continuous Integration

Use Wolfram Language tests with `VerificationTest`.

Test coverage must include:

- data retrieval metadata parsing
- genotype parsing at `rs4988235`
- age and location normalization
- regional assignment
- logistic-model helper functions
- spatial adjacency or kernel construction
- simulator update rules
- likelihood evaluation
- ABC distance calculations
- visualization helper functions that prepare map layers and animation frames

Continuous integration:

- Add GitHub Actions for non-interactive Wolfram tests.
- CI should run parser tests, model-component tests, and visualization-helper tests.
- CI should not require private data or interactive notebooks.
- CI should use small fixture datasets committed under `tests/fixtures/`.

## Repository Structure

Use this structure:

```text
data/
  raw/
  processed/
notebooks/
src/
tests/
figures/
docs/
.github/
  workflows/
```

Folder roles:

- `data/raw/`: raw downloaded source files, treated as immutable and read-only.
- `data/processed/`: cleaned and derived datasets with provenance notes.
- `notebooks/`: Wolfram notebooks and Wolfram scripts for data retrieval, exploration, fitting, validation, and animation.
- `src/`: reusable Wolfram Language package code.
- `tests/`: `VerificationTest` files and small fixtures.
- `figures/`: generated plots, maps, and animation frames.
- `docs/`: narrative notes, Wolfram Community post draft, and exported documentation assets.
- `.github/workflows/`: non-interactive CI configuration.

## Data Retrieval Notebook

Provide a retrieval notebook that:

- lists the authoritative source URLs
- downloads raw source files into `data/raw/`
- records checksums
- sets raw files to read-only after retrieval
- writes a retrieval manifest
- documents any manual intervention or mirror fallback
- creates no processed files directly, except metadata needed for provenance

The retrieval notebook should be reproducible but must not silently overwrite existing raw data.

## Wolfram Community Deliverable

Prepare a narrative Wolfram Community post inspired by the structure of the ENSO article:

- introduction
- data and methods
- model description with clean math
- reproduction of published non-spatial results
- spatial extension
- results
- uncertainty discussion
- validation and posterior predictive checks
- GitHub link
- downloadable notebooks
- calibrated animation with uncertainty explicitly shown

The post should be written for readers who can follow Wolfram Language code and mathematical modelling, while still making the archaeological genetics motivation clear.

## Definition Of Done

The project is done when:

- the end-to-end pipeline runs from data retrieval through figures and animation
- raw data are preserved read-only and processed data include provenance
- published regional trajectories are reproduced qualitatively
- a spatial extension is fitted to ancient genotype observations
- posterior uncertainty is quantified across space and time
- hold-out validation has been run for regions or time slices
- posterior predictive checks are plotted
- sensitivity to priors is documented
- a calibrated animation is generated with uncertainty explicitly shown
- Wolfram Language tests pass locally and in GitHub Actions
- the Wolfram Community narrative post and downloadable notebooks are ready

