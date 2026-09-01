codex
I’ll audit this as a skeptical referee: first map every scientific and numerical claim to its implementation/data source, then check tests and recompute the headline comparisons directly from the processed CSVs. I’ll keep the repository untouched.
  → Inspect prior project-relevant memory and repository state
  • Read model, notebook builder, README, digitisation script, tests, and processed CSVs with line evidence
  • Recompute claimed quantities and test internal consistency
  • Rank all methodological, statistical, and code-level weaknesses with concrete fixes
exec
/bin/zsh -lc 'rg -n -i "ancient.?dna|lactase|SMC.?ABC|Itan|Wolfram" /Users/thiel/.codex/memories/MEMORY.md' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
57:- ZX20 II, New Lectures 29.Aug 26, Mathematical Modelling - Refresh, IntroductionToWolfram-DS, LecturesCS5703, Antivirus One, Library 5 / 6 Total: 89%, Adware Cleaner
571:# Task Group: Aberdeen Wolfram Language course redesign, Blackboard acquisition, and provenance review
580:- rollout_summaries/2026-08-10T15-21-39-rX7C-aberdeen_wolfram_course_redesign_audit_review_package.md (cwd=/Users/thiel/GitHub/howmuchinfo-rp-research, rollout_path=/Users/thiel/.codex/sessions/2026/08/10/rollout-2026-08-10T16-21-39-019fec43-dfed-7791-acb1-5895595a063c.jsonl, updated_at=2026-08-11T21:32:21+00:00, thread_id=019fec43-dfed-7791-acb1-5895595a063c, partial: resources were identified but downloads were not verified locally)
590:- rollout_summaries/2026-08-10T15-21-39-rX7C-aberdeen_wolfram_course_redesign_audit_review_package.md (cwd=/Users/thiel/GitHub/howmuchinfo-rp-research, rollout_path=/Users/thiel/.codex/sessions/2026/08/10/rollout-2026-08-10T16-21-39-019fec43-dfed-7791-acb1-5895595a063c.jsonl, updated_at=2026-08-11T21:32:21+00:00, thread_id=019fec43-dfed-7791-acb1-5895595a063c, partial: verified review artifact, not final student release)
594:- Wolfram Course Redesign Review, SIX-WEEK-COURSE-BLUEPRINT.md, Dropbox manifest, W3-L03-Schema-First-Slide-Prototype.pptx, PowerPoint prototype, SHA-256, unzip -tq, Blackboard, Dropbox
600:- rollout_summaries/2026-08-10T15-21-39-rX7C-aberdeen_wolfram_course_redesign_audit_review_package.md (cwd=/Users/thiel/GitHub/howmuchinfo-rp-research, rollout_path=/Users/thiel/.codex/sessions/2026/08/10/rollout-2026-08-10T16-21-39-019fec43-dfed-7791-acb1-5895595a063c.jsonl, updated_at=2026-08-11T21:32:21+00:00, thread_id=019fec43-dfed-7791-acb1-5895595a063c, success: immutable source inventory and SHA-256 provenance audit)
614:- The Blackboard course is `https://abdn.blackboard.com/ultra/courses/_72118_1/outline`; work module-by-module and search for `.nb` because infinite-scroll “Load more content items” is slow. The seven target modules include Module 1/2, Programming in the Wolfram Language, Visualisation and Interactivity, Maths and Statistics, Getting Data and Exploratory Analysis, and Curve fitting. [Task 1]
615:- The local review folder is `/Users/thiel/Desktop/Wolfram Course Redesign Review`. Start with `README-FIRST.md`, `REVIEW-START-HERE.md`, and `SIX-WEEK-COURSE-BLUEPRINT.md`; evidence includes the Dropbox teaching-source inventory/manifest and an editable `Prototype/W3-L03-Schema-First-Slide-Prototype.pptx`. The portable ZIP passed `unzip -tq` and key PPTX/ZIP copies were hash-matched. [Task 2]
624:# Task Group: Wolfram notebook and local database-resource search
626:scope: locate exact Wolfram artifacts for AWS `RemoteBatchSubmit` and telephone/Mac-mini database access; distinguish executable notebook evidence from a connection resource and protect credentials
627:applies_to: cwd=/Users/thiel/GitHub/howmuchinfo-rp-research; reuse_rule=reuse the structural-clue search and remote-visibility checks for similar local Wolfram searches, but treat file paths, host/service state, and repository visibility as time-specific
651:- when locating a remembered Wolfram file, the user wanted an exact file and substantive code evidence, not a generic AWS/database example -> verify the defining code and report its precise path. [Task 1]
658:- `/Users/thiel/Library/Wolfram/DatabaseResources/TelephoneDE.m` is a Wolfram `SQLConnection` resource for MySQL on the home Mac mini, with associated `/Users/thiel/Library/Wolfram/DatabaseResources/mysql.m`. SSH reached `marcos-mac-mini.local` and Homebrew MySQL was listed as running; no saved `.nb` referencing `TelephoneDE` was found in searched locations. [Task 2]
663:- Symptom: a search finds `assyriologist.nb` -> cause: it is a conceptually related database result but the wrong project -> fix: honor the user’s structural clue; search `~/Library/Wolfram/DatabaseResources`, autosaves, and the Mac mini before selecting a result. [Task 2]
664:- Symptom: a live Wolfram query stalls at kernel startup -> cause: it did not complete and is not verification -> fix: rely on read-only resource inspection and service checks unless the live query finishes. [Task 2]
714:# Task Group: detailed Wolfram Language statistics course archive search
716:scope: locate the user's intended lecture-sequenced Wolfram Language statistics/data-science course and distinguish it from statistics textbooks or concept repositories
727:- LecturesCS5703, CoursePlan.md, Wolfram Language, statistics course, 48 sessions, 12 weeks, tutorials, Mathematica notebooks, Desktop/Marking Everything 2026, stats_explain
850:# Task Group: Wolfram Language native mixed-effects paclet validation and publication
852:scope: build, cross-validate, document, publish, and independently install a native Wolfram Language mixed-effects paclet; use for similar statistical-package release work, not a read-only code-review request
853:applies_to: cwd=/Users/thiel/Documents/Codex/2026-07-31/is-i; reuse_rule=reuse the Wolfram-style API, validation, publication, and refresh guidance for similar paclets, but reconfirm release paths, version, test counts, and benchmark values
855:## Task 1: Build and test a native Wolfram-style mixed-effects package
859:- rollout_summaries/2026-07-31T09-06-53-SFng-native_wolfram_mixed_effects_paclet_validation_publication.md (cwd=/Users/thiel/Documents/Codex/2026-07-31/is-i, rollout_path=/Users/thiel/.codex/sessions/2026/07/31/rollout-2026-07-31T10-06-53-019fb76d-2cc7-7822-a016-3e7210a13eb6.jsonl, updated_at=2026-08-07T18:40:59+00:00, thread_id=019fb76d-2cc7-7822-a016-3e7210a13eb6, success: native package, lme4 validation, and WolframScript workflow)
863:- Wolfram Language, Mathematica, MMAMixedEffects, MixedEffectsModelFit, ML, REML, generalized mixed model, nonlinear mixed model, wolframscript, WolframKernel, sleepstudy, lme4, nlme, statsmodels, per-group block solves
869:- rollout_summaries/2026-07-31T09-06-53-SFng-native_wolfram_mixed_effects_paclet_validation_publication.md (cwd=/Users/thiel/Documents/Codex/2026-07-31/is-i, rollout_path=/Users/thiel/.codex/sessions/2026/07/31/rollout-2026-07-31T10-06-53-019fb76d-2cc7-7822-a016-3e7210a13eb6.jsonl, updated_at=2026-08-07T18:40:59+00:00, thread_id=019fb76d-2cc7-7822-a016-3e7210a13eb6, success: version 1.2.4 published with archive and fresh-kernel verification)
877:- when the user asks for “a native Wolfram implementation/function/package,” prefers an API similar to `GeneralizedLinearModelFit`, and rejects R tilde notation -> use ordinary Wolfram expressions, fitted-model property access, and function-application prediction. [Task 1]
878:- when the user requests testing with `wolframscript` and a desktop-deliverable folder -> provide runnable scripts, tests, documentation, and exact artifact paths. [Task 1]
890:- Symptom: `wolframscript` cannot locate the kernel -> use `wolframscript -local /Applications/Wolfram.app/Contents/MacOS/WolframKernel ...` or invoke that kernel directly. [Task 1]
893:- Symptom: `PopulateResourceDefinition.wls` stalls during Wolfram startup -> fix: record it as a separate maintenance-script failure, not a failure of the published paclet. [Task 2]
919:# Task Group: Wolfram mixed-effects paclet read-only statistical code review
921:scope: strictly read-only, code-anchored review of Gaussian, generalized, nonlinear, and inference kernels plus the complete Wolfram test suite; use when the requested outcome is a statistical-correctness, numerical-robustness, and test-adequacy findings report
932:- Wolfram Language, MMA MixedEffects, GaussianEngine.wl, GeneralizedEngine.wl, NonlinearEngine.wl, Inference.wl, Tests/RunAllTests.wls, REML, PIRLS, Laplace, AGHQ, Satterthwaite, Kenward-Roger, geConditionalMode, PredictionInterval, scaling, SeedRandom
953:# Task Group: Wolfram Community project ideation grounded in public profile and local repositories
955:scope: research the user's Wolfram Community work and local GitHub inventory, then deliver implementation-ready project ideas with an explicit build and visual/animation brief while protecting unpublished Herculaneum work
956:applies_to: cwd=/Users/thiel/Documents/Codex/2026-07-30/ca-n; reuse_rule=reuse the research, ideation, validation, and publication-safety workflow for the user's Wolfram Community projects, but treat profile metrics, local repository inventory, and deliverable paths as time- or checkout-specific
958:## Task 1: Research Wolfram Community profile, engagement, and local repositories
962:- rollout_summaries/2026-07-30T21-48-38-v5BX-wolfram_community_150_project_ideas.md (cwd=/Users/thiel/Documents/Codex/2026-07-30/ca-n, rollout_path=/Users/thiel/.codex/sessions/2026/07/30/rollout-2026-07-30T22-48-38-019fb500-3909-7fc2-944b-7b101675c9dd.jsonl, updated_at=2026-07-30T22:04:54+00:00, thread_id=019fb500-3909-7fc2-944b-7b101675c9dd, success: profile and local-project research informed the delivered catalog)
966:- Wolfram Community, Marco Thiel, Featured Contributor, projects-index.md, Herculaneum, SmartphoneasWolframSensor, StarFix, OceanCurrents, WindTunnel, OrigamiinWL, MaxPlusProteinTranslation, KnotInvariants, Track A, Track B, Vesuvius Challenge
972:- rollout_summaries/2026-07-30T21-48-38-v5BX-wolfram_community_150_project_ideas.md (cwd=/Users/thiel/Documents/Codex/2026-07-30/ca-n, rollout_path=/Users/thiel/.codex/sessions/2026/07/30/rollout-2026-07-30T22-48-38-019fb500-3909-7fc2-944b-7b101675c9dd.jsonl, updated_at=2026-07-30T22:04:54+00:00, thread_id=019fb500-3909-7fc2-944b-7b101675c9dd, success: exactly 150 numbered ideas and matching Desktop/workspace copies)
976:- Wolfram Posts, Wolfram-Community-Project-Ideas.md, 150 project ideas, Build, Visual, hero GIF, animation, Wolfram Language 14+, rg -c '^### [0-9]{3}', Perl numbering validation, SHA-256, fac3500630d11a22e06844607fa36fbeddc94754b4911480e46d8d15079c6b74
980:- when the user requested ideas based on their public Wolfram Community profile and local/private work, including “the heraculeum scrolls” and “the iphone app for wolfram” -> cross-reference public interests with local repositories and unpublished projects rather than proposing generic topics [Task 1]
982:- when the user requested a Desktop folder named “Wolfram Posts” with “150 or so new project ideas” -> create the requested artifact at the named path and verify the continuous count before claiming delivery [Task 2]
986:- `/Users/thiel/GitHub/projects-index.md` is the efficient local inventory entrypoint (204 projects across seven categories). The relevant near-ready repositories included Herculaneum, SmartphoneasWolframSensor, StarFix, OceanCurrents, WindTunnel, OrigamiinWL, MaxPlusProteinTranslation, KnotInvariants, TectonicModel, and howmuchinfo-rp-research. [Task 1]
988:- For future Community-ready implementations, use Wolfram Language 14+, explicit provenance, a pre-evaluated notebook, companion package, deterministic tests, named GIF generation, and documented limitations. [Task 2]
1018:- LinkedIn, Cache miss, browser navigation, viibhu, Freelance Data Analyst - AI Data Evaluation & Research Support, ProfileTree Research Apprentice, LLM-Assisted Dataset Analysis, Python, Wolfram Language, LangChain, Docker, technical documentation
1030:- A credible recommendation can support applied/project-based strengths (Python, R, Wolfram Language/Mathematica, ML, LLMs, LangChain, Docker, data analysis) while accurately stating that publication/theoretical research is less established and thesis supervision is the next developmental step. [Task 1][Task 2]
1066:# Task Group: Scotland and Aberdeen solar-eclipse location verification with Wolfram Language
1067:scope: Answer total-solar-eclipse questions at regional versus point location, with runnable Wolfram verification and clear long-range uncertainty.
1074:- rollout_summaries/2026-08-19T15-38-08-QpEk-eclipse_location_wolfram_verification.md (cwd=/Users/thiel/Documents/Codex/2026-08-19/realtime-voice-chat-4, rollout_path=/Users/thiel/.codex/sessions/2026/08/19/rollout-2026-08-19T16-38-08-01a01aac-3324-7600-8277-080ecd136a08.jsonl, updated_at=2026-08-19T15:49:19+00:00, thread_id=01a01aac-3324-7600-8277-080ecd136a08, partial/uncertain)
1078:- FindSolarEclipse, SolarEclipse, GeoPosition[{57.15, -2.09}], EclipseType -> "Total", UmbraEnvelopePolygon, Scotland, Aberdeen, 3 June 2133, 2 September 2426, wolframscript
1083:- when the user asks to “use Wolfram Alpha or Wolfram Script to confirm that” and requests code, supply independently runnable Wolfram Language verification, not only web links or an unsupported assertion. [Task 1]
1087:- `FindSolarEclipse[loc, datespec, EclipseType -> "Total"]` is the location-aware Wolfram Language route; use `GeoPosition[{57.15, -2.09}]` for Aberdeen and inspect `SolarEclipse[eclipse, "Type"]`, `"EclipseMap"`, or `"UmbraEnvelopePolygon"`. [Task 1]
1093:- Symptom: `SolarEclipse[DateObject[{2133,6,3}], GeoPosition[{58,-4}]]` produces no output after repeated waits. Cause: the local Wolfram Script query hung and was interrupted. Fix: do not call the result Wolfram-confirmed; switch to the documented `FindSolarEclipse` point query and retain independent-source status honestly. [Task 1]

exec
/bin/zsh -lc "sed -n '919,952p' /Users/thiel/.codex/memories/MEMORY.md" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
# Task Group: Wolfram mixed-effects paclet read-only statistical code review

scope: strictly read-only, code-anchored review of Gaussian, generalized, nonlinear, and inference kernels plus the complete Wolfram test suite; use when the requested outcome is a statistical-correctness, numerical-robustness, and test-adequacy findings report
applies_to: cwd=/Users/thiel/Documents/Codex/2026-07-31/is-i/work/MMA MixedEffects; reuse_rule=reuse the review protocol and code-location map for similar read-only reviews of this paclet, but treat findings, line numbers, test results, and missing functionality as checkout-specific until reconfirmed

## Task 1: Audit Gaussian, generalized, nonlinear, inference kernels and every `Tests/` file; inspection completed but final review not emitted

### rollout_summary_files

- rollout_summaries/2026-08-02T13-37-08-nchy-mixed_effects_read_only_code_review_partial.md (cwd=/Users/thiel/Documents/Codex/2026-07-31/is-i/work/MMA MixedEffects, rollout_path=/Users/thiel/.codex/sessions/2026/08/02/rollout-2026-08-02T14-37-08-019fc2b1-532e-7773-ae76-2bbed2d373a8.jsonl, updated_at=2026-08-02T13:43:53+00:00, thread_id=019fc2b1-532e-7773-ae76-2bbed2d373a8, partial: full requested inspection but no final findings report)

### keywords

- Wolfram Language, MMA MixedEffects, GaussianEngine.wl, GeneralizedEngine.wl, NonlinearEngine.wl, Inference.wl, Tests/RunAllTests.wls, REML, PIRLS, Laplace, AGHQ, Satterthwaite, Kenward-Roger, geConditionalMode, PredictionInterval, scaling, SeedRandom

## User preferences

- when the user said "Read-only code review. Do not edit, create, or write any files" -> preserve strict no-write behavior throughout similar reviews. [Task 1]
- when the user required every finding to identify a file/symbol, quote or precisely paraphrase code, and severity, and said "Do not speculate about code you have not opened" -> make every finding code-grounded; distinguish verified defects, explicitly absent logic, and unverified concerns. [Task 1]
- when the user required reading all listed files fully and reviewing every test under `Tests/` -> inventory and exhaustively inspect that scope before synthesizing conclusions, without asking clarifying questions. [Task 1]

## Reusable knowledge

- The inspected scope was 4 kernel files plus 19 test/runner files (about 3,843 lines). `Tests/RunAllTests.wls` enumerates 10 `.wlt` suites; external reference targets appear in `PublicReferenceRegression.wlt` (R `lme4`/`nlme`) and `PublicInferenceReferenceTests.wlt` (lmerTest/pbkrtest), but this rollout did not execute them. [Task 1]
- `Kernel/GaussianEngine.wl:408-475` implements the profiled Gaussian ML/REML objective with block whitening, Woodbury/determinant identities, and `log|X'V^-1X|` for REML; ML/REML branches are at lines 449-451. `gaussianLambdaFromTheta` (`:173-187`) accepts zero diagonal boundary estimates and rejects negative diagonals, covered by `gaussian-engine-lambda-boundary`, `gaussian-engine-boundary-diagnostic`, and `gaussian-engine-zero-variance-modes`. [Task 1]
- `Inference.wl` has Satterthwaite and Kenward-Roger routines with symmetric pseudoinverses, rank tolerances, and derivative formulas; `Tests/InferenceTests.wlt` covers derivative identities, rank-deficient contrasts, zero variance-parameter uncertainty, and basic KR properties. [Task 1]
- `GeneralizedEngine.wl:296-328` builds PIRLS working response/weights; `:367-461` supplies conditional objective/Hessian and Laplace NLL; `:527-567` supplies AGHQ. Tests include finite-difference gradient/Hessian checks, scalar AGHQ versus `NIntegrate`, and one-point AGHQ/Laplace equality. `NonlinearEngine.wl:208-253` includes the exact observed-Hessian correction, with nonlinear Laplace (`:323-353`) and AGHQ (`:402-462`) covered by symbolic-derivative, scalar-integration, and factorization tests. [Task 1]

## Failures and how to do differently

- Symptom: inspection is complete but no user-facing review arrives -> cause: time was spent on analysis without reserving output time -> fix: before deep inspection, reserve time for the requested numbered findings (file/symbol, precise code quote/paraphrase, severity) and 3-5-sentence overall summary. [Task 1]
- Symptom: treating `geConditionalMode` as a confirmed convergence defect -> cause: `converged = True` is set for a small Newton step at `Kernel/GeneralizedEngine.wl:423-424`, while the final gradient check at `:436-441` only conditionally sets it true and may not reset it false -> fix: confirm full control flow and impact before reporting it as a defect; otherwise label it a concern to verify. [Task 1]
- Symptom: reporting missing capability as a general defect -> cause: targeted searches only establish absence in the reviewed kernels/tests -> fix: say precisely that no prediction-interval implementation, variable scaling/centering logic, or kernel-level `SeedRandom` use was found in the reviewed scope; do not extrapolate beyond it. [Task 1]


exec
/bin/zsh -lc "git status --short && git branch --show-current && git rev-parse --short HEAD && printf '%s\\n' 'FILES' && rg --files src community scripts tests data/processed README.md && printf '%s\\n' 'LINE_COUNTS' && wc -l src/LactasePersistenceSpatial.wl community/build_notebook.wls README.md scripts/digitise_itan_fig3.py tests/core.wlt data/processed/*.csv" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
main
69bbe7c
FILES
README.md
tests/README.md
tests/core.wlt
src/LactasePersistenceSpatial.wl
src/README.md
community/LactasePersistenceSpatial.wl
community/ancient_dna_lactase_persistence.pdf
community/build_notebook.wls
community/ancient_dna_lactase_persistence.nb
scripts/retrieve_data.wls
scripts/digitise_itan_fig3.py
scripts/plot_origin_hpd_comparison.py
scripts/run_pipeline.wls
scripts/run_tests.wls
data/processed/origin_mode_stability.csv
data/processed/sensitivity_posterior_quantiles.csv
data/processed/origin_smc_diagnostics.csv
data/processed/posterior_predictive_regional.csv
data/processed/time_slice_posterior_predictive.csv
data/processed/regional_time_binned_frequencies.csv
data/processed/abc_posterior.csv
data/processed/time_slice_validation.csv
data/processed/posterior_parameter_quantiles.csv
data/processed/origin_posterior_quantiles.csv
data/processed/README.md
data/processed/regional_logistic_fits.csv
data/processed/smc_diagnostics.csv
data/processed/itan2009_origin_density_digitised.csv
data/processed/itan2009_fig3_digitised.npz
data/processed/provenance.json
data/processed/cross_validation_by_region.csv
data/processed/glad_rs4988235_called_samples.csv
data/processed/smc_particles.csv
data/processed/glad_rs4988235_samples.csv
data/processed/origin_smc_particles.csv
LINE_COUNTS
    2296 src/LactasePersistenceSpatial.wl
    1000 community/build_notebook.wls
     379 README.md
     168 scripts/digitise_itan_fig3.py
     252 tests/core.wlt
     101 data/processed/abc_posterior.csv
       5 data/processed/cross_validation_by_region.csv
    1786 data/processed/glad_rs4988235_called_samples.csv
    3000 data/processed/glad_rs4988235_samples.csv
    2261 data/processed/itan2009_origin_density_digitised.csv
      12 data/processed/origin_mode_stability.csv
      12 data/processed/origin_posterior_quantiles.csv
       7 data/processed/origin_smc_diagnostics.csv
     801 data/processed/origin_smc_particles.csv
      11 data/processed/posterior_parameter_quantiles.csv
      38 data/processed/posterior_predictive_regional.csv
       5 data/processed/regional_logistic_fits.csv
      49 data/processed/regional_time_binned_frequencies.csv
      21 data/processed/sensitivity_posterior_quantiles.csv
       6 data/processed/smc_diagnostics.csv
     401 data/processed/smc_particles.csv
       8 data/processed/time_slice_posterior_predictive.csv
       2 data/processed/time_slice_validation.csv
   12621 total

exec
/bin/zsh -lc 'nl -ba README.md' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	# Ancient DNA Lactase Persistence Spatial Model
     2	
     3	Extended Markdown specification for a Wolfram Language project that moves from raw ancient DNA genotype data through statistical inference and spatial modelling to a calibrated animation with explicit uncertainty.
     4	
     5	Repository target: `mthiel74/ancient-dna-lactase-spatial-wolfram`
     6	
     7	## Results at a Glance
     8	
     9	![Hero animation: posterior mean LP frequency across Europe, 8000 BC to today](figures/generated/hero_lactase_persistence.gif)
    10	
    11	*The hero time-lapse: kriged posterior mean rs4988235-derived allele frequency over a landmasked 2-degree grid, 8000 BP to the present in 100-year interpolated steps, with the ancient samples of each moving window, a 95% credible-interval inset, and a progress bar. H.264 video: [hero_lactase_persistence.mp4](figures/generated/hero_lactase_persistence.mp4).*
    12	
    13	![Dual-panel calibrated animation](figures/generated/lactase_persistence_spatial_posterior.gif)
    14	
    15	*The calibrated dual-panel version: posterior mean (left) and 95% credible-interval width (right) at equal rank, 500-year steps. H.264 video: [lactase_persistence_spatial_posterior.mp4](figures/generated/lactase_persistence_spatial_posterior.mp4).*
    16	
    17	![Posterior density of the allele's origin](figures/generated/origin_posterior_density.png)
    18	
    19	*The point-source origin model, fitted with the same SMC-ABC plus an explicit gene-culture coupling (the source must sit where dairying already existed, within 800 years of local onset): weighted posterior density of where the allele's selection-driven rise began (star: posterior mode). The posterior is deliberately wide - a handful of early heterozygotes cannot pin a point on the map - but its medians (45.8N, 10.2E; origin 7220 BP [6808, 8526]) sit within a few degrees and a couple of centuries of the Itan et al. 2009 estimate (mode 48.5N 13E, 7441 BP [6256, 8683]), whose entire high-density region lies inside our 95% mass.*
    20	
    21	![Conditional origin fit surface](figures/generated/origin_fit_surface.png)
    22	
    23	*Prior-free cross-check: non-origin parameters pinned at posterior medians, the point source moved through every land cell, coloured by fit to the ancient samples. The data alone prefer a broad northern-central band (latitude far better constrained than longitude); Iberia, the southern Balkans and Ireland are ruled out.*
    24	
    25	![Origin spread animation](figures/generated/origin_spread.gif)
    26	
    27	*Forward simulation from the fitted origin: the travelling wave, 9600 BP to the present (star: posterior modal origin). H.264 video: [origin_spread.mp4](figures/generated/origin_spread.mp4).*
    28	
    29	![HPD comparison against Itan et al. 2009](figures/generated/origin_hpd_comparison.png)
    30	
    31	*The quantitative comparison, on common axes. Itan et al. 2009's Fig 3 was digitised back into a numeric density field (`scripts/digitise_itan_fig3.py`; the recovered mode, 48.5N 14.0E, matches the 48.5N 13E their text reports, which validates the georeferencing), so the two posteriors can be compared as distributions rather than as pictures. The verdict is split and section 11 of the notebook states it plainly: **timing and selection strength agree with the published record; location does not.** Bhattacharyya coefficient 0.62; we place only 0.10 of our mass inside their 50% region and 0.36 inside their 95% region. Their distribution sits inside our 95% region, but that reflects how vague we are, not how right - a posterior wide enough to contain every rival hypothesis has corroborated none of them. The origin's *date* (~7,200 BP) is well identified and does agree with both Itan et al. and the imputed-genome time series of Irving-Pease et al. 2024.*
    32	
    33	![Regional logistic reproduction with Wilson intervals](figures/generated/regional_logistic_reproduction.png)
    34	
    35	*Observed regional binned frequencies (points sized by called-allele count, 95% Wilson intervals) with fitted binomial logistic trajectories.*
    36	
    37	![Posterior parameter distributions with prior overlays](figures/generated/abc_parameter_posteriors.png)
    38	
    39	*Weighted SMC posterior (blue) against the flat prior (dashed orange) for all ten parameters; informed and prior-dominated dimensions are equally visible.*
    40	
    41	![Posterior predictive check](figures/generated/posterior_predictive_regional.png)
    42	
    43	*Posterior predictive 95% intervals against the 37 observed regional time bins; empirical coverage 0.97.*
    44	
    45	![Prior and dairying-onset sensitivity](figures/generated/sensitivity_intervals.png)
    46	
    47	*Posterior medians and 95% intervals under five prior/onset scenarios: the dairying-modulated selection component stays positive throughout; migration tracks its prior.*
    48	
    49	![Kriged posterior mean, 3000 BP](figures/generated/spatial_posterior_mean_3000bp.png)
    50	
    51	![Kriged 95% interval width, 3000 BP](figures/generated/spatial_uncertainty_width_3000bp.png)
    52	
    53	*Kriged posterior mean and uncertainty at 3000 BP; kriging is a display layer over the coarse 4-degree inference grid.*
    54	
    55	The long-form Wolfram Community notebook (figures and animation embedded) is `community/ancient_dna_lactase_persistence.nb` with a PDF export beside it, rebuilt by `community/build_notebook.wls`; an interactive walkthrough of the pipeline is `notebooks/LactasePersistenceSpatial.nb`.
    56	
    57	## Current Executable Baseline
    58	
    59	This repository now contains a runnable Wolfram Language baseline for the full workflow:
    60	
    61	- retrieve the public GLAD ancient `rs4988235` workbook derived from AADR v44.3
    62	- normalize sample age, location, region, and genotype calls
    63	- fit regional published-style logistic trajectories
    64	- run a coarse Europe grid diffusion/selection spatial model
    65	- fit the spatial model with SMC-ABC: adaptive tolerance schedule, Gaussian perturbation kernels, importance weights, and ESS tracking, using regional time-binned frequencies plus spatial-gradient summary statistics
    66	- generate posterior predictive checks, held-out-region and held-out-time-slice validation, prior and dairying-onset sensitivity scenarios, kriged geographic maps, GIF animation, and MP4 video
    67	- copy every generated animation/video version to Marco's iCloud Codex folder with timestamped filenames
    68	
    69	The automated data source is the public GLAD LP Ancient Genotypes 2022 workbook used for the Evershed et al. 2022 lactase-persistence analysis. The original request named Allentoft et al. 2022; this implementation targets the public lactase-persistence genotype source that exposes the required `rs4988235` calls, ages, and coordinates.
    70	
    71	## Quick Start
    72	
    73	Run from the repository root:
    74	
    75	```bash
    76	wolframscript -file scripts/retrieve_data.wls
    77	wolframscript -file scripts/run_pipeline.wls --particles 400 --generations 5 --cv-particles 150 --cv-generations 4
    78	wolframscript -file scripts/run_tests.wls
    79	```
    80	
    81	For a faster smoke run, lower `--particles`, `--generations`, and `--cv-particles`; pass `--sensitivity 0` to skip the sensitivity scenarios.
    82	
    83	## Continuous Integration Note
    84	
    85	GitHub Actions is configured for non-interactive Wolfram tests. The workflow requires a repository secret named `WOLFRAMSCRIPT_ENTITLEMENTID` so the GitHub runner can install and authorize Wolfram Engine. Without that secret, the workflow fails before running tests rather than pretending the Wolfram test suite passed.
    86	
    87	## Generated Outputs
    88	
    89	The pipeline writes:
    90	
    91	- raw immutable workbook and manifest under `data/raw/`
    92	- processed sample tables, regional bins, weighted SMC particles, resampled posterior draws, SMC diagnostics (tolerance, acceptance, ESS per generation), posterior parameter quantiles, posterior predictive checks, held-out-region and time-slice validation, and sensitivity quantiles under `data/processed/`
    93	- regional reproduction (with Wilson intervals), parameter posteriors with prior overlays, posterior predictive, sensitivity intervals, kriged spatial mean, kriged spatial uncertainty, GIF, and MP4 artifacts under `figures/generated/`
    94	- run notes under `docs/run-summary.md`
    95	
    96	Spatial maps are rendered as geographic objects with `GeoGraphics`, `GeoPosition`, and `GeoBackground -> "CountryBorders"`. The inferred model remains the coarse adjacency grid; ordinary kriging is used only as the display layer to make the geographic surface readable without claiming finer inferential resolution.
    97	
    98	Animation outputs:
    99	
   100	- repository GIF: `figures/generated/lactase_persistence_spatial_posterior.gif`
   101	- repository MP4: `figures/generated/lactase_persistence_spatial_posterior.mp4`
   102	- timestamped iCloud copies: `~/Library/Mobile Documents/com~apple~CloudDocs/Documents/Codex/YYYY-MM-DD_HHMMSS_lactase_persistence_spatial_posterior.{gif,mp4}`
   103	
   104	## Project Goals
   105	
   106	Build an end-to-end Wolfram Language pipeline for the evolution of lactase persistence in ancient European DNA:
   107	
   108	- Ingest raw ancient DNA genotype data.
   109	- Parse sample age, geographic location, region, and genotype at `rs4988235`.
   110	- Reproduce the published non-spatial regional trajectory fits first.
   111	- Extend the model to a spatial European grid or mesh.
   112	- Fit selection, migration, and dairying-onset effects with transparent uncertainty.
   113	- Generate calibrated figures and an animation that shows posterior mean frequency and uncertainty without fake precision.
   114	- Package the result as reproducible notebooks, source code, tests, figures, and a Wolfram Community narrative post.
   115	
   116	The initial scientific target is the Allentoft et al. 2022 dataset and supplement.
   117	
   118	## Data Sources
   119	
   120	Primary data target:
   121	
   122	- Allentoft et al. 2022 ancient DNA dataset and supplementary material.
   123	- Public repositories referenced by the study.
   124	- Curated public mirrors only when the original source is unavailable or unsuitable for automated retrieval.
   125	
   126	The pipeline must parse, at minimum:
   127	
   128	- sample identifier
   129	- sample age or calibrated date
   130	- geographic location
   131	- analysis region
   132	- genotype at `rs4988235`
   133	- missingness and genotype-call quality where available
   134	- source file and extraction provenance
   135	
   136	Raw data handling:
   137	
   138	- Store raw files under `data/raw/`.
   139	- Treat raw files as read-only after retrieval.
   140	- Never overwrite raw files in place.
   141	- Create processed versions under `data/processed/`.
   142	- Attach provenance notes to every processed dataset, including retrieval date, source URL, checksum, parser version, and filtering decisions.
   143	
   144	## Published Trajectory Reproduction
   145	
   146	The first analysis milestone is to reproduce the published non-spatial regional fits from the 2022 study before adding spatial dynamics.
   147	
   148	Required reproduction steps:
   149	
   150	- Implement regional logistic fits matching the study's modelling assumptions as closely as possible.
   151	- Bin or otherwise summarize observations through time by region in a way that is explicitly documented.
   152	- Plot observed genotype frequencies through time by region.
   153	- Overlay fitted logistic trajectories.
   154	- Confirm qualitative agreement with the published figures before adding the spatial extension.
   155	
   156	For a region `r`, a starting reproduction model may be written as:
   157	
   158	```text
   159	logit(p_r(t)) = alpha_r + beta_r t
   160	```
   161	
   162	where `p_r(t)` is the lactase-persistence allele or genotype frequency at time `t`. The final implementation should match the published study's parameterization wherever the paper and supplement provide enough detail.
   163	
   164	## Spatial Extension
   165	
   166	After the regional fits are reproduced, extend the model over Europe as a spatial domain.
   167	
   168	Spatial representation:
   169	
   170	- Use Europe as a 2D grid or mesh.
   171	- Encode spatial adjacency for local diffusion, migration, or dispersal.
   172	- Alternatively implement a kernel-based movement model if it is easier to calibrate and validate.
   173	- Keep spatial resolution coarse enough that uncertainty is honest relative to the data density.
   174	
   175	Core biological and cultural components:
   176	
   177	- Let local lactase-persistence frequency evolve through selection and movement.
   178	- Add regional dairying onset as a covariate that modulates the strength or timing of selection.
   179	- Keep priors on selection anchored to the literature, with selection on the order of a few percent per generation.
   180	- Keep migration or diffusion rates in a plausible Holocene European range and test sensitivity.
   181	
   182	A minimal spatial dynamic can be expressed as:
   183	
   184	```text
   185	p_i(t + 1) = p_i(t) + selection_i(t) + migration_i(t)
   186	```
   187	
   188	with:
   189	
   190	```text
   191	selection_i(t) = s_i(t) p_i(t) (1 - p_i(t))
   192	migration_i(t) = m sum_j A_ij (p_j(t) - p_i(t))
   193	s_i(t) = s_0 + s_dairy D_i(t)
   194	```
   195	
   196	where `i` and `j` index grid cells, `A_ij` is spatial adjacency, `m` is a migration or diffusion parameter, `D_i(t)` is a dairying-onset covariate, and `s_i(t)` is the local selection coefficient.
   197	
   198	Likelihood:
   199	
   200	- Link each ancient sample to the closest or most appropriate grid cell.
   201	- Evaluate the expected genotype probability at the sample's location and age.
   202	- Account for genotype uncertainty or missingness where available.
   203	- Avoid overconfident interpolation in regions and periods with sparse data.
   204	
   205	## Inference Plan
   206	
   207	Start with approximate Bayesian computation because it is robust for simulation-heavy models and can be implemented cleanly in Wolfram Language.
   208	
   209	Initial ABC summary statistics:
   210	
   211	- regional time-binned genotype or allele frequencies
   212	- temporal slopes by region
   213	- onset timing or midpoint estimates from logistic fits
   214	- spatial gradients through time
   215	- contrasts between dairying and non-dairying regions
   216	
   217	Inference stages:
   218	
   219	- Begin with rejection ABC to validate the simulator and summaries.
   220	- Move to SMC-ABC if rejection ABC is too inefficient.
   221	- Use simulation-based inference if compute resources and tooling allow.
   222	- Track tolerances, retained particles, summary distances, and effective sample sizes.
   223	
   224	Priors:
   225	
   226	- Selection coefficients: anchored to published lactase-persistence estimates, roughly a few percent per generation.
   227	- Migration or diffusion: plausible for Holocene Europe, with broad sensitivity checks.
   228	- Dairying effect: weakly informative, allowing no effect through strong modulation.
   229	- Regional initial conditions: constrained by early observed ancient DNA where possible.
   230	
   231	Sensitivity:
   232	
   233	- Re-run fits under wider and narrower selection priors.
   234	- Test alternative migration priors.
   235	- Test alternative dairying-onset encodings.
   236	- Report which scientific conclusions are robust and which are prior-sensitive.
   237	
   238	## Validation
   239	
   240	Use posterior predictive checks and cross-validation before presenting the spatial extension as scientifically meaningful.
   241	
   242	Validation tasks:
   243	
   244	- Hold out regions and predict their time trajectories.
   245	- Hold out time slices and predict observed frequencies.
   246	- Compare observed values to posterior predictive distributions.
   247	- Plot calibration diagnostics, not only posterior means.
   248	- Quantify uncertainty in both space and time.
   249	
   250	Required validation figures:
   251	
   252	- observed versus posterior predictive regional frequencies
   253	- held-out region/time-slice predictive checks
   254	- posterior distributions for core parameters
   255	- sensitivity comparison across prior choices
   256	- map panels showing posterior uncertainty, not just posterior mean
   257	
   258	## Visualization And Animation
   259	
   260	Use Wolfram Language visualization tools throughout.
   261	
   262	Required tools:
   263	
   264	- `GeoGraphics` for spatial maps and sample locations.
   265	- `GeoListPlot` for exploratory sample-location checks where useful.
   266	- Ordinary kriging for the exported geographic display surface, with the coarse grid retained as the inferential unit.
   267	- `ListAnimate` or exported animation frames for temporal dynamics.
   268	- Standard plotting functions for regional reproduction and diagnostics.
   269	
   270	Animation requirements:
   271	
   272	- Render posterior mean lactase-persistence frequency over time.
   273	- Add an explicit uncertainty layer, such as credible interval width, opacity, hatching, or separate panels.
   274	- Show ancient sample locations used in each time window.
   275	- Avoid blob visuals and fake precision.
   276	- Use a spatial resolution that reflects data density and posterior uncertainty.
   277	- Include clear legends, time labels, and uncertainty explanations.
   278	
   279	## Testing And Continuous Integration
   280	
   281	Use Wolfram Language tests with `VerificationTest`.
   282	
   283	Test coverage must include:
   284	
   285	- data retrieval metadata parsing
   286	- genotype parsing at `rs4988235`
   287	- age and location normalization
   288	- regional assignment
   289	- logistic-model helper functions
   290	- spatial adjacency or kernel construction
   291	- simulator update rules
   292	- likelihood evaluation
   293	- ABC distance calculations
   294	- visualization helper functions that prepare map layers and animation frames
   295	
   296	Continuous integration:
   297	
   298	- Add GitHub Actions for non-interactive Wolfram tests.
   299	- CI should run parser tests, model-component tests, and visualization-helper tests.
   300	- CI should not require private data or interactive notebooks.
   301	- CI should use small fixture datasets committed under `tests/fixtures/`.
   302	
   303	## Repository Structure
   304	
   305	Use this structure:
   306	
   307	```text
   308	data/
   309	  raw/
   310	  processed/
   311	notebooks/
   312	src/
   313	tests/
   314	figures/
   315	community/
   316	docs/
   317	.github/
   318	  workflows/
   319	```
   320	
   321	Folder roles:
   322	
   323	- `data/raw/`: raw downloaded source files, treated as immutable and read-only.
   324	- `data/processed/`: cleaned and derived datasets with provenance notes.
   325	- `notebooks/`: Wolfram notebooks and Wolfram scripts for data retrieval, exploration, fitting, validation, and animation.
   326	- `src/`: reusable Wolfram Language package code.
   327	- `tests/`: `VerificationTest` files and small fixtures.
   328	- `figures/`: generated plots, maps, and animation frames.
   329	- `community/`: the buildable Wolfram Community notebook (`build_notebook.wls`), the built `.nb`, and its PDF export.
   330	- `docs/`: narrative notes, Wolfram Community post draft, and exported documentation assets.
   331	- `.github/workflows/`: non-interactive CI configuration.
   332	
   333	## Data Retrieval Notebook
   334	
   335	Provide a retrieval notebook that:
   336	
   337	- lists the authoritative source URLs
   338	- downloads raw source files into `data/raw/`
   339	- records checksums
   340	- sets raw files to read-only after retrieval
   341	- writes a retrieval manifest
   342	- documents any manual intervention or mirror fallback
   343	- creates no processed files directly, except metadata needed for provenance
   344	
   345	The retrieval notebook should be reproducible but must not silently overwrite existing raw data.
   346	
   347	## Wolfram Community Deliverable
   348	
   349	Prepare a narrative Wolfram Community post inspired by the structure of the ENSO article:
   350	
   351	- introduction
   352	- data and methods
   353	- model description with clean math
   354	- reproduction of published non-spatial results
   355	- spatial extension
   356	- results
   357	- uncertainty discussion
   358	- validation and posterior predictive checks
   359	- GitHub link
   360	- downloadable notebooks
   361	- calibrated animation with uncertainty explicitly shown
   362	
   363	The post should be written for readers who can follow Wolfram Language code and mathematical modelling, while still making the archaeological genetics motivation clear.
   364	
   365	## Definition Of Done
   366	
   367	The project is done when:
   368	
   369	- the end-to-end pipeline runs from data retrieval through figures and animation
   370	- raw data are preserved read-only and processed data include provenance
   371	- published regional trajectories are reproduced qualitatively
   372	- a spatial extension is fitted to ancient genotype observations
   373	- posterior uncertainty is quantified across space and time
   374	- hold-out validation has been run for regions or time slices
   375	- posterior predictive checks are plotted
   376	- sensitivity to priors is documented
   377	- a calibrated animation is generated with uncertainty explicitly shown
   378	- Wolfram Language tests pass locally and in GitHub Actions
   379	- the Wolfram Community narrative post and downloadable notebooks are ready

exec
/bin/zsh -lc "rg -n '"'^([A-Za-z$][A-Za-z0-9$]*::usage|[A-Za-z$][A-Za-z0-9$]*'"\\[|\\(\\*|Begin|End|Options\\[)' src/LactasePersistenceSpatial.wl" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
1:BeginPackage["LactasePersistenceSpatial`"];
3:$GLADAncientGenotypesURL::usage = "Public URL for the GLAD ancient lactase-persistence genotype workbook.";
4:$GLADAncientGenotypesFileName::usage = "Raw GLAD ancient genotype workbook filename.";
5:MajorRegions::usage = "MajorRegions[] returns the four regional groups used for the published regional reproduction.";
6:EnsureProjectLayout::usage = "EnsureProjectLayout[root] creates the expected project folders.";
7:Sha256File::usage = "Sha256File[file] returns a lowercase SHA-256 checksum string.";
8:RetrieveRawData::usage = "RetrieveRawData[root] downloads the GLAD ancient genotype workbook into data/raw and records provenance.";
9:NormalizeGenotype::usage = "NormalizeGenotype[call] normalizes a genotype call at rs4988235.";
10:DerivedAlleleCopies::usage = "DerivedAlleleCopies[genotype] counts LP-derived A/T alleles.";
11:CalledAlleleCount::usage = "CalledAlleleCount[genotype] returns the number of called alleles.";
12:AssignRegion::usage = "AssignRegion[country, latitude, longitude] assigns a sample or grid cell to a coarse analysis region.";
13:DairyingOnsetBP::usage = "DairyingOnsetBP[region] returns a coarse regional dairying-onset time in years BP.";
14:CleanSampleRow::usage = "CleanSampleRow[rowAssociation] normalizes one raw GLAD row.";
15:ParseGLADWorkbook::usage = "ParseGLADWorkbook[file] parses the GLAD XLSX workbook into normalized sample associations.";
16:WriteProcessedData::usage = "WriteProcessedData[root, rawFile] writes processed sample, binned-frequency, and provenance files.";
17:LoadProcessedSamples::usage = "LoadProcessedSamples[rootOrFile] loads processed samples from CSV.";
18:RegionalBinnedFrequencies::usage = "RegionalBinnedFrequencies[samples] computes time-binned regional allele frequencies.";
19:LogisticProbability::usage = "LogisticProbability[alpha, beta, bp] evaluates the regional logistic trajectory.";
20:FitRegionLogistic::usage = "FitRegionLogistic[samples, region] fits a binomial regional logistic trajectory.";
21:FitAllRegionalLogistics::usage = "FitAllRegionalLogistics[samples] fits all major regional trajectories.";
22:ExportRegionalFitOutputs::usage = "ExportRegionalFitOutputs[root, samples, fits] writes regional fit tables and figures.";
23:BuildEuropeGrid::usage = "BuildEuropeGrid[] returns a coarse European grid with regional annotations.";
24:BuildNeighborList::usage = "BuildNeighborList[grid] returns adjacency lists for the grid.";
25:SimulateSpatialTrajectory::usage = "SimulateSpatialTrajectory[parameters, grid] simulates spatial LP frequency through time.";
26:RunABC::usage = "RunABC[samples, grid] runs rejection ABC for the spatial model.";
27:PosteriorPredictiveRegional::usage = "PosteriorPredictiveRegional[posterior, grid, observedSummaries] computes predictive intervals.";
28:ExportABCOutputs::usage = "ExportABCOutputs[root, samples, grid, abc] writes ABC posterior, PPC, and parameter figures.";
29:RunCrossValidation::usage = "RunCrossValidation[samples, grid] runs held-out-region posterior predictive checks.";
30:ExportSpatialVisualizations::usage = "ExportSpatialVisualizations[root, samples, grid, posterior] writes spatial maps and animation.";
31:OrdinaryKrigingPredictor::usage = "OrdinaryKrigingPredictor[coords, values] returns an ordinary-kriging predictor over projected coordinates.";
32:ICloudCodexDirectory::usage = "ICloudCodexDirectory[] returns Marco's iCloud Codex drop-zone directory.";
33:WriteRunSummary::usage = "WriteRunSummary[root, outputs] writes a Markdown run summary.";
35:RunSMCABC::usage = "RunSMCABC[samples, grid] runs sequential Monte Carlo ABC with adaptive tolerances, Gaussian perturbation kernels, importance weights, and spatial-gradient summary statistics.";
36:ResamplePosterior::usage = "ResamplePosterior[smc, n] draws n equally weighted posterior parameter sets from a weighted SMC result.";
37:PosteriorCellStats::usage = "PosteriorCellStats[posterior, grid, times] returns per-cell posterior mean and 95% band of the simulated allele frequency at each requested time BP.";
38:PosteriorParameterQuantiles::usage = "PosteriorParameterQuantiles[smc] returns weighted posterior quantiles for every model parameter.";
39:ExportSMCOutputs::usage = "ExportSMCOutputs[root, samples, grid, smc, draws] writes SMC posterior tables, diagnostics, and figures.";
40:RunSMCCrossValidation::usage = "RunSMCCrossValidation[samples, grid] reruns SMC-ABC with each analysis region held out and scores held-out predictions.";
41:RunTimeSliceValidation::usage = "RunTimeSliceValidation[samples, grid] trains on older samples only and predicts the held-out most recent time bins.";
42:RunSensitivityAnalysis::usage = "RunSensitivityAnalysis[samples] reruns SMC-ABC under alternative priors and dairying-onset shifts.";
43:ExportSensitivityOutputs::usage = "ExportSensitivityOutputs[root, rows] writes the sensitivity quantile table and figure.";
44:WilsonInterval::usage = "WilsonInterval[derived, called] returns the 95% Wilson score interval for a binomial proportion.";
45:ExtendedObservedData::usage = "ExtendedObservedData[samples, grid] builds binned and spatial-gradient summary data for ABC distances.";
46:ExtendedDistance::usage = "ExtendedDistance[obsData, trajectory, grid] evaluates the weighted summary distance including spatial-gradient terms.";
47:BuildObservationIndex::usage = "BuildObservationIndex[samples, grid] links called samples to grid cells and times for like-for-like summaries.";
49:ExportHeroAnimation::usage = "ExportHeroAnimation[root, samples, grid, posterior] renders the single-panel cinematic hero time-lapse with year badge, uncertainty inset, and progress bar, exporting MP4 and GIF.";
50:LoadOrRunSMCABC::usage = "LoadOrRunSMCABC[root, samples, grid] reloads the stored SMC posterior from data/processed if present, otherwise runs RunSMCABC.";
52:LogisticExplorer::usage = "LogisticExplorer[samples] returns a self-contained Manipulate: regional binned data with Wilson intervals against an adjustable logistic trajectory.";
53:DairyingCovariateExplorer::usage = "DairyingCovariateExplorer[] returns a Manipulate exploring the smooth dairying-onset covariate D(t).";
54:SpatialTimeExplorer::usage = "SpatialTimeExplorer[samples, grid, posterior] returns a Manipulate stepping through posterior-mean maps with embedded frames.";
56:RunOriginSMCABC::usage = "RunOriginSMCABC[samples, grid] fits the point-source origin model (origin latitude, longitude, time, injection frequency, plus selection and migration) with SMC-ABC.";
57:LoadOrRunOriginSMCABC::usage = "LoadOrRunOriginSMCABC[root, samples, grid] reloads the stored origin-model posterior or fits and stores it.";
58:OriginDensityMap::usage = "OriginDensityMap[smc] renders the Itan-style posterior density map of the allele's origin with the weighted median starred.";
59:ExportOriginSpread::usage = "ExportOriginSpread[root, samples, grid, smc] renders the forward-simulated spread animation from the fitted origin (MP4 + GIF).";
61:OriginFitSurface::usage = "OriginFitSurface[samples, grid, smc] returns the ABC distance obtained by placing the point source in each land cell with all other parameters at their posterior medians.";
62:OriginFitSurfaceMap::usage = "OriginFitSurfaceMap[samples, grid, smc] maps the conditional origin fit-quality scan (yellow/red where the data prefer the origin).";
64:Begin["`Private`"];
73:MajorRegions[] := $AnalysisRegions;
75:ValueMissingQ[x_] := MissingQ[x] || x === Null || x === "" || x === Indeterminate;
77:CleanString[x_] := Module[{s},
87:NormalizeHeader[x_] := StringReplace[
92:ParseNumber[x_] := Module[{s = CleanString[x], y},
102:NumericValueQ[x_] := NumericQ[x] && x =!= Indeterminate;
104:NormalizeCoordinate[x_, limit_] := Module[{y = x, k = 0},
115:NormalizeLatitude[x_] := NormalizeCoordinate[x, 90];
116:NormalizeLongitude[x_] := NormalizeCoordinate[x, 180];
118:EnsureProjectLayout[root_String] := Module[
127:ICloudCodexDirectory[] := FileNameJoin[
131:CopyVersionToICloud[sourceFile_String, label_String] := Module[
147:FindFFmpeg[] := SelectFirst[
153:ExportMP4FromFrames[mp4File_String, frames_List, secondsPerFrame_: 0.7] := Module[
183:Sha256File[file_String] := ToLowerCase[IntegerString[FileHash[file, "SHA256"], 16, 64]];
185:FileSizeBytes[file_String] := Quiet@Check[QuantityMagnitude[FileByteCount[file]], Missing["NotAvailable"]];
187:RetrieveRawData[root_String, overwrite_: False] := Module[
232:NormalizeGenotype[x_] := Module[{s = ToUpperCase[StringReplace[CleanString[x], WhitespaceCharacter .. -> ""]]},
236:DerivedAlleleCopies[gt_] := Module[{g = NormalizeGenotype[gt]},
240:CalledAlleleCount[gt_] := Module[{g = NormalizeGenotype[gt]},
244:GenotypeFrequency[gt_] := Module[{n = CalledAlleleCount[gt], d = DerivedAlleleCopies[gt]},
248:AssignRegion[country_, lat_, lon_] := Module[
278:SmoothDairyingOnsetBP[lat_?NumericQ, lon_?NumericQ] := Module[{d2, w},
284:DairyingOnsetBP[region_String] := Switch[region,
293:CleanSampleRow[row_Association] := Module[
326:ParseGLADWorkbook[file_String] := Module[
335:ExportRows[file_String, rows_List] := Module[{headers, table},
342:BinStartBP[bp_, binSize_] := binSize Floor[N[bp]/binSize];
343:BinMidBP[bp_, binSize_] := BinStartBP[bp, binSize] + binSize/2;
345:RegionalBinnedFrequencies[samples_List, binSize_: 1000] := Module[
373:WriteProcessedData[root_String, rawFile_: Automatic] := Module[
415:RestoreSampleTypes[row_Association] := Module[{numeric, bool},
426:LoadProcessedSamples[rootOrFile_String] := Module[{file, data, headers},
437:BoundedProbability[p_] := Min[1 - 10^-9, Max[10^-9, N[p]]];
439:LogisticProbability[alpha_?NumericQ, beta_?NumericQ, bp_?NumericQ] :=
442:FitRegionLogistic[samples_List, region_String] := Module[
490:FitAllRegionalLogistics[samples_List] := FitRegionLogistic[samples, #] & /@ $AnalysisRegions;
492:ExportRegionalFitOutputs[root_String, samples_List, fits_List] := Module[
550:FilterLandCells[cells_List] := Module[{elevations},
562:BuildEuropeGrid[step_: 2, onsetShiftYears_: 0] := Module[{cells, id = 0},
587:BuildNeighborList[grid_List, step_: 4] := Module[{positions, index},
600:DairyCovariate[onsetBP_?NumericQ, bp_?NumericQ, scale_: 350] := 1/(1 + Exp[(bp - onsetBP)/scale]);
602:RegionSelectionMultiplier[params_Association, region_String] := Switch[region,
610:InitialFrequencies[grid_List, params_Association] := Module[
621:SpatialStep[freqs_List, grid_List, neighbors_List, params_Association, bp_?NumericQ, dtYears_?NumericQ] := Module[
642:Options[SimulateSpatialTrajectory] = {"StartBP" -> 10000, "EndBP" -> 0, "TimeStepYears" -> 250};
644:SimulateSpatialTrajectory[params_Association, grid_List, OptionsPattern[]] := Module[
677:FrequenciesAt[trajectory_Association, bp_?NumericQ] := Module[{times, idx},
683:RegionMeanFrequency[grid_List, freqs_List, region_String] := Module[{idx},
688:ObservedSummaries[samples_List, binSize_: 1000] :=
693:PredictedSummariesFromTrajectory[trajectory_Association, grid_List, observed_List] := Module[
703:SummaryDistance[observed_List, predicted_List] := Module[{weights, diffs},
722:PriorVectorSample[spec_: Automatic] := Module[{s},
727:PriorInSupportQ[vector_List, spec_: Automatic] := Module[{s},
732:ParamsFromVector[vector_List, spec_: Automatic] := Module[{s, assoc, logKeys},
742:SamplePrior[] := ParamsFromVector[PriorVectorSample[]];
744:RunABCFromSummaries[observed_List, grid_List, simulationCount_Integer, retainCount_Integer, seed_Integer] := Module[
762:Options[RunABC] = {"SimulationCount" -> 200, "RetainCount" -> 40, "Seed" -> 20260831, "BinSizeYears" -> 1000};
764:RunABC[samples_List, grid_List, OptionsPattern[]] := Module[{observed},
769:PosteriorPredictiveRegional[posterior_List, grid_List, observed_List] := Module[
804:ExportABCOutputs[root_String, samples_List, grid_List, abc_Association] := Module[
865:Options[RunCrossValidation] = {"SimulationCount" -> 80, "RetainCount" -> 25, "Seed" -> 260831};
867:RunCrossValidation[samples_List, grid_List, OptionsPattern[]] := Module[
893:CellPolygon[cell_Association] := Module[
900:GeoCoordinateToKrigingPoint[{lat_?NumericQ, lon_?NumericQ}] := {N[lon Cos[50 Degree]], N[lat]};
902:ExponentialCovariance[a_List, b_List, range_?NumericQ] := Exp[-EuclideanDistance[a, b]/range];
904:OrdinaryKrigingWeights[
931:OrdinaryKrigingPredictor[
942:KrigingSurfaceSupport[grid_List, resolution_: 0.5] := Module[
969:KrigedSurfaceValues[support_Association, values_List] :=
972:GeoTile[{lat_, lon_}, value_, halfStep_, colorFunction_, opacity_, valueRange_] := {
983:KrigedSurfaceLayer[support_Association, values_List, colorFunction_, opacity_, valueRange_] := Module[
992:SamplesInWindow[samples_List, bp_?NumericQ, halfWidth_: 500] :=
997:GeoPointLayer[samples_List] := If[samples === {},
1007:LandMaskImage[width_Integer, height_Integer] := LandMaskImage[width, height] = Module[
1024:FieldOverlayImage[support_Association, values_List, colorFunction_, valueRange_, opacity_, width_Integer, height_Integer] := Module[
1043:BaseMapRaster[width_Integer] := BaseMapRaster[width] = Module[{h, g},
1056:SamplePointsRaster[samples_List, width_Integer, height_Integer] := Module[{pts},
1070:SpatialMap[grid_List, support_Association, values_List, samples_List, label_String, colorFunction_, opacity_: 0.92,
1102:PosteriorCellStats[posterior_List, grid_List, times_List] := Module[
1118:ExportSpatialVisualizations[root_String, samples_List, grid_List, posterior_List] := Module[
1191:WriteRunSummary[root_String, outputs_Association] := Module[
1241:(* ------------------------------------------------------------------ *)
1242:(* Statistical upgrade layer: Wilson intervals, logistic-fit standard *)
1243:(* errors, spatial-gradient summary statistics, and shared styling.   *)
1244:(* ------------------------------------------------------------------ *)
1257:WilsonInterval[derived_?NumericQ, called_?NumericQ, z_: 1.959963984540054] := Module[
1267:LogisticFitStandardErrors[objective_, alpha_?NumericQ, beta_?NumericQ, h_: 0.005] := Module[
1281:WeightedQuantile[values_List, weights_List, q_?NumericQ] := Module[
1292:WeightedComponentVariance[vectors_List, weights_List] := Module[
1298:(* --- observation index and spatial-gradient summary statistics --- *)
1300:BuildObservationIndex[samples_List, grid_List] := Module[{coords, nf, sel},
1324:GradientPoolPositions[index_List, window_: {0, 4000}] := Module[{pos},
1335:PooledFrequency[index_List, positions_List] := Module[{called, derived},
1342:PooledPredictedFrequency[index_List, positions_List, ps_List] := Module[{called},
1348:ObservedGradientStatistics[index_List, window_: {0, 4000}] := Module[{pools, fN, fS, fW, fE, wNS, wWE},
1367:PredictedSampleProbabilities[trajectory_Association, index_List] := Module[{times, freqs},
1376:ExtendedObservedData[samples_List, grid_List, binSize_: 1000] := Module[{binned, index, gradients},
1384:ExtendedDistance[obsData_Association, trajectory_Association, grid_List] := Module[
1414:(* ------------------------------------------------------------------ *)
1415:(* SMC-ABC with adaptive tolerances and importance weights.           *)
1416:(* ------------------------------------------------------------------ *)
1418:SMCDistanceForVector[vector_List, obsData_Association, grid_List, spec_] := Module[
1445:GaussianKernelDensityRows[candidates_List, previous_List, sds_List] := Module[
1458:(* SMC operates in an unbounded logit-transformed space so that Gaussian
1463:ToUnboundedVector[vector_List, spec_] := MapThread[
1470:FromUnboundedVector[y_List, spec_] := MapThread[
1475:LogisticPriorDensity[y_List] := Times @@ (Exp[-#]/(1 + Exp[-#])^2 & /@ y);
1477:Options[RunSMCABC] = {
1488:RunSMCABC[samples_List, grid_List, OptionsPattern[]] := Module[
1577:ResamplePosterior[smc_Association, count_Integer: 100] := BlockRandom[
1584:PosteriorParameterQuantiles[smc_Association, qs_: Automatic] := Module[
1601:(* --- SMC output export: tables, diagnostics, and figures --- *)
1603:PosteriorPriorFigure[smc_Association] := Module[
1633:PosteriorPredictiveFigure[ppc_List] := Module[{coverage},
1660:ExportSMCOutputs[root_String, samples_List, grid_List, smc_Association, posteriorDraws_List] := Module[
1695:(* --- validation layers --- *)
1697:Options[RunSMCCrossValidation] = {
1701:RunSMCCrossValidation[samples_List, grid_List, OptionsPattern[]] := Module[
1730:Options[RunTimeSliceValidation] = {
1734:RunTimeSliceValidation[samples_List, grid_List, OptionsPattern[]] := Module[
1759:(* --- prior and dairying-onset sensitivity analysis --- *)
1761:ModifiedPriorSpec[changes_Association] := Join[$PriorSpec, changes];
1773:Options[RunSensitivityAnalysis] = {"Particles" -> 150, "Generations" -> 4, "Seed" -> 90210};
1775:RunSensitivityAnalysis[samples_List, OptionsPattern[]] := Module[{rows},
1800:SensitivityFigure[rows_List] := Module[
1834:ExportSensitivityOutputs[root_String, rows_List] := Module[{file, fig},
1843:(* ------------------------------------------------------------------ *)
1844:(* Cinematic hero animation: single-panel posterior time-lapse with   *)
1845:(* year badge, progress bar, sample dots, and an uncertainty inset.   *)
1846:(* All frames are pure raster composition over one cached base map,   *)
1847:(* so 80+ frames render in seconds.                                   *)
1848:(* ------------------------------------------------------------------ *)
1854:FormatYearLabel[bp_?NumericQ] := Module[{yr = Round[1950 - bp]},
1858:AugmentedCellStats[posterior_List, grid_List, knotTimes_List] := Module[{raw},
1869:InterpolatedCellStat[stats_Association, knotTimes_List, t_?NumericQ, prop_String] := Module[
1879:YearBadge[t_?NumericQ, widthPx_Integer] := Rasterize[
1886:CaptionStrip[text_String] := Rasterize[
1893:ProgressBarImage[fraction_?NumericQ, width_Integer, barHeight_Integer: 8] := Module[
1902:HeroFrame[t_?NumericQ, stats_Association, knotTimes_List, support_Association,
1932:Options[ExportHeroAnimation] = {
1937:ExportHeroAnimation[root_String, samples_List, grid_List, posterior_List, OptionsPattern[]] := Module[
1961:(* --- reconstruct a stored SMC result so notebooks evaluate fast --- *)
1963:LoadOrRunSMCABC[root_String, samples_List, grid_List, opts___] := Module[
2002:(* --- self-contained interactive explorers for the Community notebook --- *)
2004:LogisticExplorer[samples_List] := Module[{binned, dataAssoc},
2041:DairyingCovariateExplorer[] := Manipulate[
2056:SpatialTimeExplorer[samples_List, grid_List, posterior_List, times_List: {}] := Module[
2083:(* ------------------------------------------------------------------ *)
2084:(* Point-source origin model: where and when did the allele start?    *)
2085:(* ------------------------------------------------------------------ *)
2103:Options[RunOriginSMCABC] = {"Particles" -> 800, "Generations" -> 6, "Seed" -> 19470}; 
2105:RunOriginSMCABC[samples_List, grid_List, OptionsPattern[]] := RunSMCABC[
2113:LoadOrRunOriginSMCABC[root_String, samples_List, grid_List, opts___] := Module[
2157:(* Itan-style origin posterior density map: weighted kernel density of the
2161:OriginPosteriorMode[smc_Association] := Module[
2173:OriginDensityMap[smc_Association, opts___] := Module[
2214:(* Spread video from the fitted origin: posterior-mean field over origin
2217:ExportOriginSpread[root_String, samples_List, grid_List, smc_Association, OptionsPattern[]] := Module[
2253:(* Conditional fit-quality scan: hold every non-origin parameter at its
2258:OriginFitSurface[samples_List, grid_List, smc_Association] := Module[
2284:OriginFitSurfaceMap[samples_List, grid_List, smc_Association] := Module[
2294:End[];
2296:EndPackage[];

exec
/bin/zsh -lc "nl -ba src/LactasePersistenceSpatial.wl | sed -n '1,600p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	BeginPackage["LactasePersistenceSpatial`"];
     2	
     3	$GLADAncientGenotypesURL::usage = "Public URL for the GLAD ancient lactase-persistence genotype workbook.";
     4	$GLADAncientGenotypesFileName::usage = "Raw GLAD ancient genotype workbook filename.";
     5	MajorRegions::usage = "MajorRegions[] returns the four regional groups used for the published regional reproduction.";
     6	EnsureProjectLayout::usage = "EnsureProjectLayout[root] creates the expected project folders.";
     7	Sha256File::usage = "Sha256File[file] returns a lowercase SHA-256 checksum string.";
     8	RetrieveRawData::usage = "RetrieveRawData[root] downloads the GLAD ancient genotype workbook into data/raw and records provenance.";
     9	NormalizeGenotype::usage = "NormalizeGenotype[call] normalizes a genotype call at rs4988235.";
    10	DerivedAlleleCopies::usage = "DerivedAlleleCopies[genotype] counts LP-derived A/T alleles.";
    11	CalledAlleleCount::usage = "CalledAlleleCount[genotype] returns the number of called alleles.";
    12	AssignRegion::usage = "AssignRegion[country, latitude, longitude] assigns a sample or grid cell to a coarse analysis region.";
    13	DairyingOnsetBP::usage = "DairyingOnsetBP[region] returns a coarse regional dairying-onset time in years BP.";
    14	CleanSampleRow::usage = "CleanSampleRow[rowAssociation] normalizes one raw GLAD row.";
    15	ParseGLADWorkbook::usage = "ParseGLADWorkbook[file] parses the GLAD XLSX workbook into normalized sample associations.";
    16	WriteProcessedData::usage = "WriteProcessedData[root, rawFile] writes processed sample, binned-frequency, and provenance files.";
    17	LoadProcessedSamples::usage = "LoadProcessedSamples[rootOrFile] loads processed samples from CSV.";
    18	RegionalBinnedFrequencies::usage = "RegionalBinnedFrequencies[samples] computes time-binned regional allele frequencies.";
    19	LogisticProbability::usage = "LogisticProbability[alpha, beta, bp] evaluates the regional logistic trajectory.";
    20	FitRegionLogistic::usage = "FitRegionLogistic[samples, region] fits a binomial regional logistic trajectory.";
    21	FitAllRegionalLogistics::usage = "FitAllRegionalLogistics[samples] fits all major regional trajectories.";
    22	ExportRegionalFitOutputs::usage = "ExportRegionalFitOutputs[root, samples, fits] writes regional fit tables and figures.";
    23	BuildEuropeGrid::usage = "BuildEuropeGrid[] returns a coarse European grid with regional annotations.";
    24	BuildNeighborList::usage = "BuildNeighborList[grid] returns adjacency lists for the grid.";
    25	SimulateSpatialTrajectory::usage = "SimulateSpatialTrajectory[parameters, grid] simulates spatial LP frequency through time.";
    26	RunABC::usage = "RunABC[samples, grid] runs rejection ABC for the spatial model.";
    27	PosteriorPredictiveRegional::usage = "PosteriorPredictiveRegional[posterior, grid, observedSummaries] computes predictive intervals.";
    28	ExportABCOutputs::usage = "ExportABCOutputs[root, samples, grid, abc] writes ABC posterior, PPC, and parameter figures.";
    29	RunCrossValidation::usage = "RunCrossValidation[samples, grid] runs held-out-region posterior predictive checks.";
    30	ExportSpatialVisualizations::usage = "ExportSpatialVisualizations[root, samples, grid, posterior] writes spatial maps and animation.";
    31	OrdinaryKrigingPredictor::usage = "OrdinaryKrigingPredictor[coords, values] returns an ordinary-kriging predictor over projected coordinates.";
    32	ICloudCodexDirectory::usage = "ICloudCodexDirectory[] returns Marco's iCloud Codex drop-zone directory.";
    33	WriteRunSummary::usage = "WriteRunSummary[root, outputs] writes a Markdown run summary.";
    34	
    35	RunSMCABC::usage = "RunSMCABC[samples, grid] runs sequential Monte Carlo ABC with adaptive tolerances, Gaussian perturbation kernels, importance weights, and spatial-gradient summary statistics.";
    36	ResamplePosterior::usage = "ResamplePosterior[smc, n] draws n equally weighted posterior parameter sets from a weighted SMC result.";
    37	PosteriorCellStats::usage = "PosteriorCellStats[posterior, grid, times] returns per-cell posterior mean and 95% band of the simulated allele frequency at each requested time BP.";
    38	PosteriorParameterQuantiles::usage = "PosteriorParameterQuantiles[smc] returns weighted posterior quantiles for every model parameter.";
    39	ExportSMCOutputs::usage = "ExportSMCOutputs[root, samples, grid, smc, draws] writes SMC posterior tables, diagnostics, and figures.";
    40	RunSMCCrossValidation::usage = "RunSMCCrossValidation[samples, grid] reruns SMC-ABC with each analysis region held out and scores held-out predictions.";
    41	RunTimeSliceValidation::usage = "RunTimeSliceValidation[samples, grid] trains on older samples only and predicts the held-out most recent time bins.";
    42	RunSensitivityAnalysis::usage = "RunSensitivityAnalysis[samples] reruns SMC-ABC under alternative priors and dairying-onset shifts.";
    43	ExportSensitivityOutputs::usage = "ExportSensitivityOutputs[root, rows] writes the sensitivity quantile table and figure.";
    44	WilsonInterval::usage = "WilsonInterval[derived, called] returns the 95% Wilson score interval for a binomial proportion.";
    45	ExtendedObservedData::usage = "ExtendedObservedData[samples, grid] builds binned and spatial-gradient summary data for ABC distances.";
    46	ExtendedDistance::usage = "ExtendedDistance[obsData, trajectory, grid] evaluates the weighted summary distance including spatial-gradient terms.";
    47	BuildObservationIndex::usage = "BuildObservationIndex[samples, grid] links called samples to grid cells and times for like-for-like summaries.";
    48	
    49	ExportHeroAnimation::usage = "ExportHeroAnimation[root, samples, grid, posterior] renders the single-panel cinematic hero time-lapse with year badge, uncertainty inset, and progress bar, exporting MP4 and GIF.";
    50	LoadOrRunSMCABC::usage = "LoadOrRunSMCABC[root, samples, grid] reloads the stored SMC posterior from data/processed if present, otherwise runs RunSMCABC.";
    51	
    52	LogisticExplorer::usage = "LogisticExplorer[samples] returns a self-contained Manipulate: regional binned data with Wilson intervals against an adjustable logistic trajectory.";
    53	DairyingCovariateExplorer::usage = "DairyingCovariateExplorer[] returns a Manipulate exploring the smooth dairying-onset covariate D(t).";
    54	SpatialTimeExplorer::usage = "SpatialTimeExplorer[samples, grid, posterior] returns a Manipulate stepping through posterior-mean maps with embedded frames.";
    55	
    56	RunOriginSMCABC::usage = "RunOriginSMCABC[samples, grid] fits the point-source origin model (origin latitude, longitude, time, injection frequency, plus selection and migration) with SMC-ABC.";
    57	LoadOrRunOriginSMCABC::usage = "LoadOrRunOriginSMCABC[root, samples, grid] reloads the stored origin-model posterior or fits and stores it.";
    58	OriginDensityMap::usage = "OriginDensityMap[smc] renders the Itan-style posterior density map of the allele's origin with the weighted median starred.";
    59	ExportOriginSpread::usage = "ExportOriginSpread[root, samples, grid, smc] renders the forward-simulated spread animation from the fitted origin (MP4 + GIF).";
    60	
    61	OriginFitSurface::usage = "OriginFitSurface[samples, grid, smc] returns the ABC distance obtained by placing the point source in each land cell with all other parameters at their posterior medians.";
    62	OriginFitSurfaceMap::usage = "OriginFitSurfaceMap[samples, grid, smc] maps the conditional origin fit-quality scan (yellow/red where the data prefer the origin).";
    63	
    64	Begin["`Private`"];
    65	
    66	$GLADAncientGenotypesURL =
    67	  "https://www.ucl.ac.uk/biosciences/sites/biosciences/files/glad_adna_15-8-22.xlsx";
    68	
    69	$GLADAncientGenotypesFileName = "glad_adna_15-8-22.xlsx";
    70	
    71	$AnalysisRegions = {"British Isles", "Rhine-Danube", "Mediterranean", "Baltic"};
    72	
    73	MajorRegions[] := $AnalysisRegions;
    74	
    75	ValueMissingQ[x_] := MissingQ[x] || x === Null || x === "" || x === Indeterminate;
    76	
    77	CleanString[x_] := Module[{s},
    78	  Which[
    79	    ValueMissingQ[x], "",
    80	    StringQ[x], StringTrim[x],
    81	    True,
    82	      s = ToString[x, InputForm];
    83	      StringTrim[StringReplace[s, {StartOfString ~~ "\"" -> "", "\"" ~~ EndOfString -> ""}]]
    84	  ]
    85	];
    86	
    87	NormalizeHeader[x_] := StringReplace[
    88	  ToLowerCase[CleanString[x]],
    89	  {" " -> "_", "-" -> "_", "." -> "_", "/" -> "_", "(" -> "", ")" -> "", ":" -> ""}
    90	];
    91	
    92	ParseNumber[x_] := Module[{s = CleanString[x], y},
    93	  Which[
    94	    ValueMissingQ[x] || s == "", Missing["NotAvailable"],
    95	    NumericQ[x], N[x],
    96	    True,
    97	      y = Quiet@Check[ToExpression[StringReplace[s, "," -> "."]], $Failed];
    98	      If[NumericQ[y], N[y], Missing["NotAvailable"]]
    99	  ]
   100	];
   101	
   102	NumericValueQ[x_] := NumericQ[x] && x =!= Indeterminate;
   103	
   104	NormalizeCoordinate[x_, limit_] := Module[{y = x, k = 0},
   105	  If[! NumericValueQ[y], Return[y]];
   106	  y = N[y];
   107	  If[Abs[y] >= 1000, y = y/1000.0];
   108	  While[Abs[y] > limit && k < 8,
   109	    y = y/10.0;
   110	    k++;
   111	  ];
   112	  y
   113	];
   114	
   115	NormalizeLatitude[x_] := NormalizeCoordinate[x, 90];
   116	NormalizeLongitude[x_] := NormalizeCoordinate[x, 180];
   117	
   118	EnsureProjectLayout[root_String] := Module[
   119	  {dirs},
   120	  dirs = FileNameJoin[{root, #}] & /@
   121	    {"data/raw", "data/processed", "notebooks", "src", "tests", "tests/fixtures",
   122	     "figures", "figures/generated", "docs", "scripts", ".github/workflows"};
   123	  Scan[If[! DirectoryQ[#], CreateDirectory[#, CreateIntermediateDirectories -> True]] &, dirs];
   124	  dirs
   125	];
   126	
   127	ICloudCodexDirectory[] := FileNameJoin[
   128	  {$HomeDirectory, "Library", "Mobile Documents", "com~apple~CloudDocs", "Documents", "Codex"}
   129	];
   130	
   131	CopyVersionToICloud[sourceFile_String, label_String] := Module[
   132	  {dir = ICloudCodexDirectory[], extension, stamp, base, destination, version = 1},
   133	  If[! FileExistsQ[sourceFile], Return[Missing["SourceMissing", sourceFile]]];
   134	  If[! DirectoryQ[dir], CreateDirectory[dir, CreateIntermediateDirectories -> True]];
   135	  extension = FileExtension[sourceFile];
   136	  stamp = DateString[Now, {"Year", "Month", "Day", "_", "Hour", "Minute", "Second"}];
   137	  base = stamp <> "_" <> label;
   138	  destination = FileNameJoin[{dir, base <> "." <> extension}];
   139	  While[FileExistsQ[destination],
   140	    version++;
   141	    destination = FileNameJoin[{dir, base <> "_" <> ToString[version] <> "." <> extension}]
   142	  ];
   143	  CopyFile[sourceFile, destination];
   144	  destination
   145	];
   146	
   147	FindFFmpeg[] := SelectFirst[
   148	  {"/opt/homebrew/bin/ffmpeg", "/usr/local/bin/ffmpeg", "/usr/bin/ffmpeg"},
   149	  FileExistsQ,
   150	  Missing["NotFound"]
   151	];
   152	
   153	ExportMP4FromFrames[mp4File_String, frames_List, secondsPerFrame_: 0.7] := Module[
   154	  {ffmpeg, frameDir, exitCode, fallback},
   155	  ffmpeg = FindFFmpeg[];
   156	  If[! MissingQ[ffmpeg],
   157	    If[FileExistsQ[mp4File], DeleteFile[mp4File]];
   158	    frameDir = CreateDirectory[];
   159	    MapIndexed[
   160	      Export[FileNameJoin[{frameDir, "frame_" <> IntegerString[First[#2], 10, 4] <> ".png"}], #1] &,
   161	      frames
   162	    ];
   163	    exitCode = Quiet@RunProcess[
   164	      {ffmpeg, "-y",
   165	       "-framerate", ToString[N[1/secondsPerFrame]],
   166	       "-i", FileNameJoin[{frameDir, "frame_%04d.png"}],
   167	       "-vf", "scale=trunc(iw/2)*2:trunc(ih/2)*2,fps=30",
   168	       "-c:v", "libx264", "-crf", "18", "-preset", "medium",
   169	       "-pix_fmt", "yuv420p", "-movflags", "faststart",
   170	       mp4File},
   171	      "ExitCode"
   172	    ];
   173	    Quiet@Check[DeleteDirectory[frameDir, DeleteContents -> True], Null];
   174	    If[exitCode === 0 && FileExistsQ[mp4File], Return[mp4File]]
   175	  ];
   176	  fallback = Quiet@Check[Export[mp4File, frames, "FrameRate" -> 1], $Failed];
   177	  If[fallback === $Failed || ! FileExistsQ[mp4File],
   178	    Missing["MP4ExportFailed", mp4File],
   179	    mp4File
   180	  ]
   181	];
   182	
   183	Sha256File[file_String] := ToLowerCase[IntegerString[FileHash[file, "SHA256"], 16, 64]];
   184	
   185	FileSizeBytes[file_String] := Quiet@Check[QuantityMagnitude[FileByteCount[file]], Missing["NotAvailable"]];
   186	
   187	RetrieveRawData[root_String, overwrite_: False] := Module[
   188	  {rawDir, file, manifest, downloaded = False, checksum, result},
   189	  EnsureProjectLayout[root];
   190	  rawDir = FileNameJoin[{root, "data", "raw"}];
   191	  file = FileNameJoin[{rawDir, $GLADAncientGenotypesFileName}];
   192	  manifest = FileNameJoin[{rawDir, "manifest.json"}];
   193	
   194	  If[FileExistsQ[file] && ! TrueQ[overwrite],
   195	    Null,
   196	    If[FileExistsQ[file], DeleteFile[file]];
   197	    result = URLDownload[$GLADAncientGenotypesURL, file];
   198	    If[result === $Failed || ! FileExistsQ[file],
   199	      Message[RetrieveRawData::download, $GLADAncientGenotypesURL];
   200	      Return[$Failed]
   201	    ];
   202	    downloaded = True;
   203	  ];
   204	
   205	  checksum = Sha256File[file];
   206	  Quiet@Check[SetPermissions[file, "ReadOnly"], Null];
   207	  If[$OperatingSystem =!= "Windows",
   208	    Quiet@Check[RunProcess[{"/bin/chmod", "444", file}], Null]
   209	  ];
   210	  Export[
   211	    manifest,
   212	    <|
   213	      "dataset" -> "GLAD LP Ancient Genotypes 2022",
   214	      "description" -> "Ancient rs4988235 genotype workbook derived from AADR v44.3 and used for Evershed et al. 2022.",
   215	      "source_url" -> $GLADAncientGenotypesURL,
   216	      "downloaded_this_run" -> downloaded,
   217	      "retrieved_at" -> DateString[Now, "ISODateTime"],
   218	      "raw_file" -> FileNameTake[file],
   219	      "sha256" -> checksum,
   220	      "bytes" -> FileSizeBytes[file],
   221	      "read_only" -> True,
   222	      "primary_reference" -> "Evershed et al. 2022, Nature, Dairying, diseases and the evolution of lactase persistence in Europe",
   223	      "aadr_reference" -> "Allen Ancient DNA Resource v44.3"
   224	    |>,
   225	    "JSON"
   226	  ];
   227	  file
   228	];
   229	
   230	RetrieveRawData::download = "Could not download raw data from `1`.";
   231	
   232	NormalizeGenotype[x_] := Module[{s = ToUpperCase[StringReplace[CleanString[x], WhitespaceCharacter .. -> ""]]},
   233	  If[s == "" || s == "NA" || s == "NAN" || s == "NULL", Missing["NotCalled"], s]
   234	];
   235	
   236	DerivedAlleleCopies[gt_] := Module[{g = NormalizeGenotype[gt]},
   237	  If[MissingQ[g], Missing["NotCalled"], Count[Characters[g], "A" | "T"]]
   238	];
   239	
   240	CalledAlleleCount[gt_] := Module[{g = NormalizeGenotype[gt]},
   241	  If[MissingQ[g], 0, Count[Characters[g], "A" | "T" | "G" | "C"]]
   242	];
   243	
   244	GenotypeFrequency[gt_] := Module[{n = CalledAlleleCount[gt], d = DerivedAlleleCopies[gt]},
   245	  If[n > 0 && NumericQ[d], N[d/n], Missing["NotCalled"]]
   246	];
   247	
   248	AssignRegion[country_, lat_, lon_] := Module[
   249	  {c = ToLowerCase[CleanString[country]], la = lat, lo = lon},
   250	  If[! NumericValueQ[la] || ! NumericValueQ[lo], Return["Unplaced"]];
   251	  Which[
   252	    MemberQ[{"united kingdom", "england", "scotland", "wales", "ireland", "northern ireland", "isle of man", "jersey", "guernsey"}, c] ||
   253	      (-11 <= lo <= 2 && 49 <= la <= 60), "British Isles",
   254	
   255	    MemberQ[{"estonia", "latvia", "lithuania", "finland", "sweden", "denmark", "poland"}, c] && la >= 53 ||
   256	      (10 <= lo <= 32 && 53 <= la <= 62), "Baltic",
   257	
   258	    MemberQ[{"germany", "netherlands", "belgium", "luxembourg", "switzerland", "austria", "czech republic", "czechia", "slovakia", "hungary", "romania", "slovenia"}, c] ||
   259	      (-1 <= lo <= 23 && 45 <= la <= 53.5), "Rhine-Danube",
   260	
   261	    MemberQ[{"spain", "portugal", "italy", "greece", "croatia", "bosnia and herzegovina", "serbia", "montenegro", "albania", "north macedonia", "malta", "cyprus"}, c] ||
   262	      (-10 <= lo <= 30 && 35 <= la < 45), "Mediterranean",
   263	
   264	    -12 <= lo <= 35 && 35 <= la <= 62, "Other Europe",
   265	    True, "Outside Europe"
   266	  ]
   267	];
   268	
   269	$DairyingAnchors = {
   270	  {40., 15., 8200.},
   271	  {38., -4., 7700.},
   272	  {46., 27., 8000.},
   273	  {49., 10., 7600.},
   274	  {53., -2., 6100.},
   275	  {57., 22., 5600.}
   276	};
   277	
   278	SmoothDairyingOnsetBP[lat_?NumericQ, lon_?NumericQ] := Module[{d2, w},
   279	  d2 = Max[(lat - #[[1]])^2 + ((lon - #[[2]]) Cos[lat Degree])^2, 0.25] & /@ $DairyingAnchors;
   280	  w = 1/d2;
   281	  Total[w $DairyingAnchors[[All, 3]]]/Total[w]
   282	];
   283	
   284	DairyingOnsetBP[region_String] := Switch[region,
   285	  "Mediterranean", 8200,
   286	  "Rhine-Danube", 7600,
   287	  "British Isles", 6100,
   288	  "Baltic", 5600,
   289	  "Other Europe", 6500,
   290	  _, 6500
   291	];
   292	
   293	CleanSampleRow[row_Association] := Module[
   294	  {gt, called, derived, lat, lon, bp, depth, region},
   295	  gt = NormalizeGenotype[Lookup[row, "rs4988235_most_likely_genotype", ""]];
   296	  called = CalledAlleleCount[gt];
   297	  derived = DerivedAlleleCopies[gt];
   298	  lat = NormalizeLatitude[ParseNumber[Lookup[row, "lat", ""]]];
   299	  lon = NormalizeLongitude[ParseNumber[Lookup[row, "long", ""]]];
   300	  bp = ParseNumber[Lookup[row, "mean_date", ""]];
   301	  depth = ParseNumber[Lookup[row, "rs4988235_depth", ""]];
   302	  region = AssignRegion[Lookup[row, "country", ""], lat, lon];
   303	  <|
   304	    "VersionID" -> CleanString[Lookup[row, "version_id", ""]],
   305	    "SampleID" -> CleanString[Lookup[row, "master_id", ""]],
   306	    "Publication" -> CleanString[Lookup[row, "publication", ""]],
   307	    "PublicationYear" -> ParseNumber[Lookup[row, "publication_year", ""]],
   308	    "DataGroupID" -> CleanString[Lookup[row, "dr_group_id", ""]],
   309	    "Locality" -> CleanString[Lookup[row, "locality", ""]],
   310	    "Country" -> CleanString[Lookup[row, "country", ""]],
   311	    "Latitude" -> lat,
   312	    "Longitude" -> lon,
   313	    "MeanDateBP" -> bp,
   314	    "DateRange" -> CleanString[Lookup[row, "date_range", ""]],
   315	    "RS4988235Depth" -> depth,
   316	    "RS4988235Genotype" -> If[MissingQ[gt], "", gt],
   317	    "CalledAlleles" -> called,
   318	    "DerivedAlleles" -> If[MissingQ[derived], 0, derived],
   319	    "DerivedAlleleFrequency" -> If[called > 0 && NumericQ[derived], N[derived/called], Missing["NotCalled"]],
   320	    "Region" -> region,
   321	    "DairyingOnsetBP" -> DairyingOnsetBP[region],
   322	    "HasCall" -> called > 0
   323	  |>
   324	];
   325	
   326	ParseGLADWorkbook[file_String] := Module[
   327	  {data, headers, rows},
   328	  data = Import[file, {"Data", 1}];
   329	  If[! ListQ[data] || Length[data] < 2, Return[{}]];
   330	  headers = NormalizeHeader /@ First[data];
   331	  rows = AssociationThread[headers, #] & /@ Rest[data];
   332	  CleanSampleRow /@ rows
   333	];
   334	
   335	ExportRows[file_String, rows_List] := Module[{headers, table},
   336	  If[rows === {}, Return[$Failed]];
   337	  headers = Keys[First[rows]];
   338	  table = Prepend[(Replace[Lookup[#, headers], m_Missing :> ""] & /@ rows), headers];
   339	  Export[file, table, "CSV"]
   340	];
   341	
   342	BinStartBP[bp_, binSize_] := binSize Floor[N[bp]/binSize];
   343	BinMidBP[bp_, binSize_] := BinStartBP[bp, binSize] + binSize/2;
   344	
   345	RegionalBinnedFrequencies[samples_List, binSize_: 1000] := Module[
   346	  {called, groups},
   347	  called = Select[
   348	    samples,
   349	    TrueQ[#["HasCall"]] && NumericValueQ[#["MeanDateBP"]] &&
   350	      MemberQ[Append[$AnalysisRegions, "Other Europe"], #["Region"]] &
   351	  ];
   352	  groups = GatherBy[called, {#["Region"], BinStartBP[#["MeanDateBP"], binSize]} &];
   353	  SortBy[
   354	    Map[
   355	      With[
   356	        {g = #, key = {#[[1, "Region"]], BinStartBP[#[[1, "MeanDateBP"]], binSize]}},
   357	        <|
   358	          "Region" -> key[[1]],
   359	          "TimeBinStartBP" -> key[[2]],
   360	          "TimeBinMidBP" -> key[[2]] + binSize/2,
   361	          "CalledAlleles" -> Total[g[[All, "CalledAlleles"]]],
   362	          "DerivedAlleles" -> Total[g[[All, "DerivedAlleles"]]],
   363	          "Frequency" -> N[Total[g[[All, "DerivedAlleles"]]]/Total[g[[All, "CalledAlleles"]]]],
   364	          "SampleCount" -> Length[g]
   365	        |>
   366	      ] &,
   367	      groups
   368	    ],
   369	    {#Region &, #TimeBinMidBP &}
   370	  ]
   371	];
   372	
   373	WriteProcessedData[root_String, rawFile_: Automatic] := Module[
   374	  {raw, processedDir, samples, called, binned, samplesFile, calledFile, binnedFile, provenanceFile},
   375	  EnsureProjectLayout[root];
   376	  raw = If[rawFile === Automatic, FileNameJoin[{root, "data", "raw", $GLADAncientGenotypesFileName}], rawFile];
   377	  processedDir = FileNameJoin[{root, "data", "processed"}];
   378	  samples = ParseGLADWorkbook[raw];
   379	  called = Select[samples, TrueQ[#["HasCall"]] && NumericValueQ[#["Latitude"]] &&
   380	      NumericValueQ[#["Longitude"]] && NumericValueQ[#["MeanDateBP"]] &];
   381	  binned = RegionalBinnedFrequencies[called];
   382	  samplesFile = FileNameJoin[{processedDir, "glad_rs4988235_samples.csv"}];
   383	  calledFile = FileNameJoin[{processedDir, "glad_rs4988235_called_samples.csv"}];
   384	  binnedFile = FileNameJoin[{processedDir, "regional_time_binned_frequencies.csv"}];
   385	  provenanceFile = FileNameJoin[{processedDir, "provenance.json"}];
   386	  ExportRows[samplesFile, samples];
   387	  ExportRows[calledFile, called];
   388	  ExportRows[binnedFile, binned];
   389	  Export[
   390	    provenanceFile,
   391	    <|
   392	      "created_at" -> DateString[Now, "ISODateTime"],
   393	      "raw_file" -> FileNameTake[raw],
   394	      "raw_sha256" -> Sha256File[raw],
   395	      "parser" -> "LactasePersistenceSpatial` ParseGLADWorkbook",
   396	      "source_url" -> $GLADAncientGenotypesURL,
   397	      "total_rows" -> Length[samples],
   398	      "called_rows_with_age_location" -> Length[called],
   399	      "time_bin_years" -> 1000,
   400	      "region_assignment" -> "Coarse country and latitude/longitude heuristic matching Evershed et al. four-region framing."
   401	    |>,
   402	    "JSON"
   403	  ];
   404	  <|
   405	    "SamplesFile" -> samplesFile,
   406	    "CalledSamplesFile" -> calledFile,
   407	    "BinnedFrequenciesFile" -> binnedFile,
   408	    "ProvenanceFile" -> provenanceFile,
   409	    "Samples" -> samples,
   410	    "CalledSamples" -> called,
   411	    "BinnedFrequencies" -> binned
   412	  |>
   413	];
   414	
   415	RestoreSampleTypes[row_Association] := Module[{numeric, bool},
   416	  numeric = {"PublicationYear", "Latitude", "Longitude", "MeanDateBP", "RS4988235Depth",
   417	    "CalledAlleles", "DerivedAlleles", "DerivedAlleleFrequency", "DairyingOnsetBP"};
   418	  bool = {"HasCall"};
   419	  Join[
   420	    KeyDrop[row, Join[numeric, bool]],
   421	    AssociationThread[numeric, ParseNumber /@ Lookup[row, numeric, ""]],
   422	    AssociationThread[bool, MemberQ[{"True", "true", "1", True}, #] & /@ Lookup[row, bool, ""]]
   423	  ]
   424	];
   425	
   426	LoadProcessedSamples[rootOrFile_String] := Module[{file, data, headers},
   427	  file = If[DirectoryQ[rootOrFile],
   428	    FileNameJoin[{rootOrFile, "data", "processed", "glad_rs4988235_called_samples.csv"}],
   429	    rootOrFile
   430	  ];
   431	  data = Import[file, "CSV"];
   432	  If[! ListQ[data] || Length[data] < 2, Return[{}]];
   433	  headers = First[data];
   434	  RestoreSampleTypes /@ (AssociationThread[headers, #] & /@ Rest[data])
   435	];
   436	
   437	BoundedProbability[p_] := Min[1 - 10^-9, Max[10^-9, N[p]]];
   438	
   439	LogisticProbability[alpha_?NumericQ, beta_?NumericQ, bp_?NumericQ] :=
   440	  BoundedProbability[1/(1 + Exp[-(alpha + beta ((10000 - bp)/1000.0))])];
   441	
   442	FitRegionLogistic[samples_List, region_String] := Module[
   443	  {data, objective, sol, alpha, beta, ll, ses, atBound},
   444	  data = Select[samples, #["Region"] == region && TrueQ[#["HasCall"]] &&
   445	      NumericValueQ[#["MeanDateBP"]] && #["CalledAlleles"] > 0 &];
   446	  If[Length[data] < 4 || Total[data[[All, "CalledAlleles"]]] < 8,
   447	    Return[<|"Region" -> region, "Status" -> "InsufficientData", "SampleCount" -> Length[data]|>]
   448	  ];
   449	  objective[a_?NumericQ, b_?NumericQ] := Total[
   450	    With[{p = LogisticProbability[a, b, #["MeanDateBP"]]},
   451	      #["DerivedAlleles"] Log[p] + (#["CalledAlleles"] - #["DerivedAlleles"]) Log[1 - p]
   452	    ] & /@ data
   453	  ];
   454	  sol = Quiet@Check[
   455	    NMaximize[{objective[a, b], -24 <= a <= 2 && -2 <= b <= 8}, {a, b},
   456	      Method -> {"NelderMead", "RandomSeed" -> 123}],
   457	    $Failed
   458	  ];
   459	  If[sol === $Failed,
   460	    <|"Region" -> region, "Status" -> "Failed", "SampleCount" -> Length[data]|>,
   461	    ll = sol[[1]];
   462	    alpha = a /. sol[[2]];
   463	    beta = b /. sol[[2]];
   464	    ses = Quiet@Check[
   465	      LogisticFitStandardErrors[objective, alpha, beta],
   466	      {Missing["NotAvailable"], Missing["NotAvailable"]}
   467	    ];
   468	    atBound = Abs[alpha - (-24)] < 0.01 || Abs[alpha - 2] < 0.01 ||
   469	      Abs[beta - (-2)] < 0.01 || Abs[beta - 8] < 0.01;
   470	    <|
   471	      "Region" -> region,
   472	      "Status" -> "OK",
   473	      "SampleCount" -> Length[data],
   474	      "CalledAlleles" -> Total[data[[All, "CalledAlleles"]]],
   475	      "DerivedAlleles" -> Total[data[[All, "DerivedAlleles"]]],
   476	      "Alpha" -> N[alpha],
   477	      "BetaPerKyrTowardPresent" -> N[beta],
   478	      "SelectionPerGenerationApprox" -> N[beta*28/1000],
   479	      "LogLikelihood" -> N[ll],
   480	      "AlphaSE" -> ses[[1]],
   481	      "BetaSE" -> ses[[2]],
   482	      "AtParameterBound" -> atBound,
   483	      "FrequencyAt8000BP" -> LogisticProbability[alpha, beta, 8000],
   484	      "FrequencyAt3000BP" -> LogisticProbability[alpha, beta, 3000],
   485	      "FrequencyAtPresent" -> LogisticProbability[alpha, beta, 0]
   486	    |>
   487	  ]
   488	];
   489	
   490	FitAllRegionalLogistics[samples_List] := FitRegionLogistic[samples, #] & /@ $AnalysisRegions;
   491	
   492	ExportRegionalFitOutputs[root_String, samples_List, fits_List] := Module[
   493	  {processedDir, figDir, binned, fitFile, figFile, plots, fitAssoc, regions},
   494	  processedDir = FileNameJoin[{root, "data", "processed"}];
   495	  figDir = FileNameJoin[{root, "figures", "generated"}];
   496	  fitFile = FileNameJoin[{processedDir, "regional_logistic_fits.csv"}];
   497	  figFile = FileNameJoin[{figDir, "regional_logistic_reproduction.png"}];
   498	  ExportRows[fitFile, fits];
   499	  binned = Select[RegionalBinnedFrequencies[samples], #CalledAlleles >= 2 && MemberQ[$AnalysisRegions, #Region] &];
   500	  fitAssoc = AssociationThread[fits[[All, "Region"]], fits];
   501	  regions = $AnalysisRegions;
   502	  plots = Table[
   503	    Module[{sub, fit, curve, intervals, points, color},
   504	      sub = Select[binned, #Region == region &];
   505	      color = Lookup[$RegionColors, region, Black];
   506	      intervals = Table[
   507	        Module[{ci = WilsonInterval[b["DerivedAlleles"], b["CalledAlleles"]]},
   508	          {Directive[color, Opacity[0.55], AbsoluteThickness[1.4]],
   509	           Line[{{b["TimeBinMidBP"], ci[[1]]}, {b["TimeBinMidBP"], ci[[2]]}}]}
   510	        ],
   511	        {b, sub}
   512	      ];
   513	      points = Table[
   514	        {Directive[color, Opacity[0.95]],
   515	         PointSize[0.010 + 0.012 Sqrt[b["CalledAlleles"]/250.]],
   516	         Point[{b["TimeBinMidBP"], b["Frequency"]}]},
   517	        {b, sub}
   518	      ];
   519	      fit = Lookup[fitAssoc, region, <|"Status" -> "Missing"|>];
   520	      curve = If[Lookup[fit, "Status", ""] == "OK",
   521	        Plot[
   522	          LogisticProbability[fit["Alpha"], fit["BetaPerKyrTowardPresent"], bp],
   523	          {bp, 0, 10000},
   524	          PlotStyle -> Directive[GrayLevel[0.25], AbsoluteThickness[1.8]],
   525	          PlotRange -> {0, 1}
   526	        ],
   527	        Graphics[{}]
   528	      ];
   529	      Show[
   530	        Graphics[
   531	          Join[intervals, points],
   532	          Frame -> True, Axes -> False,
   533	          AspectRatio -> 1/GoldenRatio,
   534	          PlotRange -> {{0, 10000}, {-0.03, 1}},
   535	          FrameLabel -> {"years BP", "LP-derived allele frequency"},
   536	          PlotLabel -> Style[
   537	            region <> If[TrueQ[Lookup[fit, "AtParameterBound", False]], " (fit at bound)", ""], 12],
   538	          LabelStyle -> Directive[Black, 10.5],
   539	          ImageSize -> 440
   540	        ],
   541	        curve
   542	      ]
   543	    ],
   544	    {region, regions}
   545	  ];
   546	  Export[figFile, GraphicsGrid[Partition[plots, 2], Spacings -> {0.5, 0.8}], ImageResolution -> 160];
   547	  <|"RegionalFitFile" -> fitFile, "RegionalFigure" -> figFile|>
   548	];
   549	
   550	FilterLandCells[cells_List] := Module[{elevations},
   551	  elevations = Quiet@Check[
   552	    QuantityMagnitude[GeoElevationData[GeoPosition[{#["Latitude"], #["Longitude"]} & /@ cells]]],
   553	    ConstantArray[1., Length[cells]]
   554	  ];
   555	  If[! ListQ[elevations] || Length[elevations] =!= Length[cells], Return[cells]];
   556	  MapIndexed[
   557	    Append[#1, "CellID" -> First[#2]] &,
   558	    Pick[cells, NumericValueQ[#] && # > -10 & /@ elevations]
   559	  ]
   560	];
   561	
   562	BuildEuropeGrid[step_: 2, onsetShiftYears_: 0] := Module[{cells, id = 0},
   563	  cells = Flatten[
   564	    Table[
   565	      Module[{region = AssignRegion["", lat, lon]},
   566	        If[MemberQ[Append[$AnalysisRegions, "Other Europe"], region],
   567	          id++;
   568	          <|
   569	            "CellID" -> id,
   570	            "Latitude" -> N[lat],
   571	            "Longitude" -> N[lon],
   572	            "Region" -> region,
   573	            "DairyingOnsetBP" -> SmoothDairyingOnsetBP[N[lat], N[lon]] + onsetShiftYears,
   574	            "StepDegrees" -> step
   575	          |>,
   576	          Nothing
   577	        ]
   578	      ],
   579	      {lat, 36, 62, step},
   580	      {lon, -10, 34, step}
   581	    ],
   582	    1
   583	  ];
   584	  FilterLandCells[cells]
   585	];
   586	
   587	BuildNeighborList[grid_List, step_: 4] := Module[{positions, index},
   588	  positions = ({#["Latitude"], #["Longitude"]} & /@ grid);
   589	  index = AssociationThread[positions, Range[Length[positions]]];
   590	  Table[
   591	    DeleteMissing[
   592	      Lookup[index, ({grid[[i, "Latitude"]] + #[[1]], grid[[i, "Longitude"]] + #[[2]]} & /@
   593	          {{step, 0}, {-step, 0}, {0, step}, {0, -step},
   594	           {step, step}, {step, -step}, {-step, step}, {-step, -step}}), Missing["NoNeighbor"]]
   595	    ],
   596	    {i, Length[grid]}
   597	  ]
   598	];
   599	
   600	DairyCovariate[onsetBP_?NumericQ, bp_?NumericQ, scale_: 350] := 1/(1 + Exp[(bp - onsetBP)/scale]);

exec
/bin/zsh -lc "nl -ba src/LactasePersistenceSpatial.wl | sed -n '601,1200p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
   601	
   602	RegionSelectionMultiplier[params_Association, region_String] := Switch[region,
   603	  "British Isles", Lookup[params, "SelectionMultiplierBritishIsles", 1.0],
   604	  "Rhine-Danube", Lookup[params, "SelectionMultiplierRhineDanube", 1.0],
   605	  "Mediterranean", Lookup[params, "SelectionMultiplierMediterranean", 1.0],
   606	  "Baltic", Lookup[params, "SelectionMultiplierBaltic", 1.0],
   607	  _, 1.0
   608	];
   609	
   610	InitialFrequencies[grid_List, params_Association] := Module[
   611	  {p0, latGrad, lonGrad},
   612	  p0 = Lookup[params, "InitialFrequency", 0.004];
   613	  latGrad = Lookup[params, "InitialLatitudeGradient", 0.0];
   614	  lonGrad = Lookup[params, "InitialLongitudeGradient", 0.0];
   615	  Clip[
   616	    p0 + latGrad ((grid[[All, "Latitude"]] - 50)/20) + lonGrad ((grid[[All, "Longitude"]] - 10)/35),
   617	    {0.00001, 0.25}
   618	  ]
   619	];
   620	
   621	SpatialStep[freqs_List, grid_List, neighbors_List, params_Association, bp_?NumericQ, dtYears_?NumericQ] := Module[
   622	  {gens, sBase, sDairy, migration, dairy, multipliers, growth, grown, alphaMix, mixed},
   623	  gens = dtYears/28.0;
   624	  sBase = Lookup[params, "SelectionBase", 0.0];
   625	  sDairy = Lookup[params, "SelectionDairying", 0.02];
   626	  migration = Lookup[params, "Migration", 0.002];
   627	  dairy = DairyCovariate[#, bp] & /@ grid[[All, "DairyingOnsetBP"]];
   628	  multipliers = RegionSelectionMultiplier[params, #] & /@ grid[[All, "Region"]];
   629	  (* exact per-step logistic growth: stable and accurate for any s*gens *)
   630	  growth = Exp[gens (sBase + sDairy dairy multipliers)];
   631	  grown = freqs growth/(1. + freqs (growth - 1.));
   632	  (* exponential mixing toward the neighbour mean: stable for any m*gens *)
   633	  alphaMix = 1. - Exp[-gens migration];
   634	  mixed = Table[
   635	    If[neighbors[[i]] === {}, grown[[i]],
   636	      grown[[i]] + alphaMix (Mean[grown[[neighbors[[i]]]]] - grown[[i]])],
   637	    {i, Length[grown]}
   638	  ];
   639	  Clip[mixed, {0., 0.999999}]
   640	];
   641	
   642	Options[SimulateSpatialTrajectory] = {"StartBP" -> 10000, "EndBP" -> 0, "TimeStepYears" -> 250};
   643	
   644	SimulateSpatialTrajectory[params_Association, grid_List, OptionsPattern[]] := Module[
   645	  {start, end, dt, times, neighbors, freqs, snapshots, originMode, originBP,
   646	   originCell, injectFreq, injected},
   647	  start = OptionValue["StartBP"];
   648	  end = OptionValue["EndBP"];
   649	  dt = OptionValue["TimeStepYears"];
   650	  times = Range[start, end, -dt];
   651	  neighbors = BuildNeighborList[grid, Lookup[First[grid], "StepDegrees", 4]];
   652	  originMode = KeyExistsQ[params, "OriginTimeBP"];
   653	  If[originMode,
   654	    originBP = params["OriginTimeBP"];
   655	    injectFreq = Lookup[params, "InjectFrequency", 0.02];
   656	    originCell = First @ Nearest[
   657	      ({#["Latitude"], #["Longitude"]} & /@ grid) -> "Index",
   658	      {params["OriginLatitude"], params["OriginLongitude"]}];
   659	    freqs = ConstantArray[0., Length[grid]];
   660	    injected = False;
   661	    If[times[[1]] <= originBP,
   662	      freqs[[originCell]] = injectFreq; injected = True],
   663	    freqs = InitialFrequencies[grid, params]
   664	  ];
   665	  snapshots = {freqs};
   666	  Do[
   667	    freqs = SpatialStep[freqs, grid, neighbors, params, times[[k]], dt];
   668	    If[originMode && ! injected && times[[k + 1]] <= originBP,
   669	      freqs[[originCell]] = Max[freqs[[originCell]], injectFreq];
   670	      injected = True];
   671	    AppendTo[snapshots, freqs],
   672	    {k, 1, Length[times] - 1}
   673	  ];
   674	  <|"TimesBP" -> times, "Frequencies" -> snapshots|>
   675	];
   676	
   677	FrequenciesAt[trajectory_Association, bp_?NumericQ] := Module[{times, idx},
   678	  times = trajectory["TimesBP"];
   679	  idx = First@Ordering[Abs[times - bp], 1];
   680	  trajectory["Frequencies"][[idx]]
   681	];
   682	
   683	RegionMeanFrequency[grid_List, freqs_List, region_String] := Module[{idx},
   684	  idx = Flatten@Position[grid[[All, "Region"]], region];
   685	  If[idx === {}, Missing["NoCells"], Mean[freqs[[idx]]]]
   686	];
   687	
   688	ObservedSummaries[samples_List, binSize_: 1000] :=
   689	  Select[RegionalBinnedFrequencies[samples, binSize],
   690	    MemberQ[$AnalysisRegions, #Region] && #CalledAlleles >= 2 &
   691	  ];
   692	
   693	PredictedSummariesFromTrajectory[trajectory_Association, grid_List, observed_List] := Module[
   694	  {freqs},
   695	  Map[
   696	    (freqs = FrequenciesAt[trajectory, #["TimeBinMidBP"]];
   697	      <|"Region" -> #["Region"], "TimeBinMidBP" -> #["TimeBinMidBP"],
   698	        "PredictedFrequency" -> RegionMeanFrequency[grid, freqs, #["Region"]]|>) &,
   699	    observed
   700	  ]
   701	];
   702	
   703	SummaryDistance[observed_List, predicted_List] := Module[{weights, diffs},
   704	  weights = observed[[All, "CalledAlleles"]];
   705	  diffs = observed[[All, "Frequency"]] - predicted[[All, "PredictedFrequency"]];
   706	  Sqrt[Total[weights diffs^2]/Total[weights]]
   707	];
   708	
   709	$PriorSpec = <|
   710	  "Log10InitialFrequency" -> {-4.2, -1.5},
   711	  "InitialLatitudeGradient" -> {-0.008, 0.012},
   712	  "InitialLongitudeGradient" -> {-0.008, 0.008},
   713	  "SelectionBase" -> {0.0, 0.015},
   714	  "SelectionDairying" -> {0.0, 0.06},
   715	  "Migration" -> {0.0, 0.015},
   716	  "SelectionMultiplierBritishIsles" -> {0.8, 2.2},
   717	  "SelectionMultiplierRhineDanube" -> {0.6, 1.8},
   718	  "SelectionMultiplierMediterranean" -> {0.4, 1.4},
   719	  "SelectionMultiplierBaltic" -> {0.8, 2.4}
   720	|>;
   721	
   722	PriorVectorSample[spec_: Automatic] := Module[{s},
   723	  s = If[spec === Automatic, $PriorSpec, spec];
   724	  RandomReal /@ Values[s]
   725	];
   726	
   727	PriorInSupportQ[vector_List, spec_: Automatic] := Module[{s},
   728	  s = If[spec === Automatic, $PriorSpec, spec];
   729	  And @@ MapThread[#2[[1]] <= #1 <= #2[[2]] &, {vector, Values[s]}]
   730	];
   731	
   732	ParamsFromVector[vector_List, spec_: Automatic] := Module[{s, assoc, logKeys},
   733	  s = If[spec === Automatic, $PriorSpec, spec];
   734	  assoc = AssociationThread[Keys[s], vector];
   735	  logKeys = Select[Keys[assoc], StringStartsQ[#, "Log10"] &];
   736	  Join[
   737	    KeyDrop[assoc, logKeys],
   738	    Association @ Map[StringDrop[#, 5] -> 10^assoc[#] &, logKeys]
   739	  ]
   740	];
   741	
   742	SamplePrior[] := ParamsFromVector[PriorVectorSample[]];
   743	
   744	RunABCFromSummaries[observed_List, grid_List, simulationCount_Integer, retainCount_Integer, seed_Integer] := Module[
   745	  {sims},
   746	  BlockRandom[
   747	    SeedRandom[seed];
   748	    sims = Table[
   749	      Module[{params = SamplePrior[], trajectory, predicted, distance},
   750	        trajectory = SimulateSpatialTrajectory[params, grid];
   751	        predicted = PredictedSummariesFromTrajectory[trajectory, grid, observed];
   752	        distance = SummaryDistance[observed, predicted];
   753	        Join[params, <|"Distance" -> distance|>]
   754	      ],
   755	      {simulationCount}
   756	    ];
   757	  ];
   758	  <|"AllSimulations" -> sims, "Posterior" -> TakeSmallestBy[sims, #Distance &, Min[retainCount, Length[sims]]],
   759	    "ObservedSummaries" -> observed|>
   760	];
   761	
   762	Options[RunABC] = {"SimulationCount" -> 200, "RetainCount" -> 40, "Seed" -> 20260831, "BinSizeYears" -> 1000};
   763	
   764	RunABC[samples_List, grid_List, OptionsPattern[]] := Module[{observed},
   765	  observed = ObservedSummaries[samples, OptionValue["BinSizeYears"]];
   766	  RunABCFromSummaries[observed, grid, OptionValue["SimulationCount"], OptionValue["RetainCount"], OptionValue["Seed"]]
   767	];
   768	
   769	PosteriorPredictiveRegional[posterior_List, grid_List, observed_List] := Module[
   770	  {trajectories},
   771	  trajectories = SimulateSpatialTrajectory[#, grid] & /@ posterior;
   772	  BlockRandom[
   773	    SeedRandom[9112026];
   774	    Map[
   775	      Module[{obs = #, latent, predictive, called},
   776	        called = Max[1, Round[obs["CalledAlleles"]]];
   777	        latent = Table[
   778	        RegionMeanFrequency[grid, FrequenciesAt[trajectories[[i]], obs["TimeBinMidBP"]], obs["Region"]],
   779	        {i, Length[trajectories]}
   780	        ];
   781	        predictive = Flatten@Table[
   782	          RandomVariate[BinomialDistribution[called, BoundedProbability[p]]]/called,
   783	          {p, latent},
   784	          {4}
   785	        ];
   786	      <|
   787	        "Region" -> obs["Region"],
   788	        "TimeBinMidBP" -> obs["TimeBinMidBP"],
   789	        "ObservedFrequency" -> obs["Frequency"],
   790	          "CalledAlleles" -> called,
   791	          "LatentFrequencyMean" -> N[Mean[latent]],
   792	          "PosteriorMean" -> N[Mean[predictive]],
   793	          "PosteriorMedian" -> N[Quantile[predictive, 0.5]],
   794	          "Lower95" -> N[Quantile[predictive, 0.025]],
   795	          "Upper95" -> N[Quantile[predictive, 0.975]],
   796	          "Covered95" -> (Quantile[predictive, 0.025] <= obs["Frequency"] <= Quantile[predictive, 0.975])
   797	      |>
   798	      ] &,
   799	      observed
   800	    ]
   801	  ]
   802	];
   803	
   804	ExportABCOutputs[root_String, samples_List, grid_List, abc_Association] := Module[
   805	  {processedDir, figDir, allFile, posteriorFile, ppcFile, ppc, paramFig, ppcFig},
   806	  processedDir = FileNameJoin[{root, "data", "processed"}];
   807	  figDir = FileNameJoin[{root, "figures", "generated"}];
   808	  allFile = FileNameJoin[{processedDir, "abc_all_simulations.csv"}];
   809	  posteriorFile = FileNameJoin[{processedDir, "abc_posterior.csv"}];
   810	  ppcFile = FileNameJoin[{processedDir, "posterior_predictive_regional.csv"}];
   811	  ppc = PosteriorPredictiveRegional[abc["Posterior"], grid, abc["ObservedSummaries"]];
   812	  ExportRows[allFile, abc["AllSimulations"]];
   813	  ExportRows[posteriorFile, abc["Posterior"]];
   814	  ExportRows[ppcFile, ppc];
   815	  paramFig = FileNameJoin[{figDir, "abc_parameter_posteriors.png"}];
   816	  Export[
   817	    paramFig,
   818	    GraphicsGrid[
   819	      Partition[
   820	        Table[
   821	          Histogram[abc["Posterior"][[All, param]], 12, "PDF",
   822	            Frame -> True, Axes -> False, PlotLabel -> param, ImageSize -> 300],
   823	          {param, {"InitialFrequency", "SelectionBase", "SelectionDairying", "Migration",
   824	            "SelectionMultiplierBritishIsles", "SelectionMultiplierRhineDanube",
   825	            "SelectionMultiplierMediterranean", "SelectionMultiplierBaltic"}}
   826	        ],
   827	        2
   828	      ],
   829	      Spacings -> {0.5, 0.8}
   830	    ],
   831	    ImageResolution -> 160
   832	  ];
   833	  ppcFig = FileNameJoin[{figDir, "posterior_predictive_regional.png"}];
   834	  Export[
   835	    ppcFig,
   836	    Module[{colors = AssociationThread[$AnalysisRegions, ColorData[97] /@ Range[Length[$AnalysisRegions]]]},
   837	      Graphics[
   838	        Join[
   839	          {{Gray, Dashed, Line[{{0, 0}, {1, 1}}]}},
   840	          Table[
   841	            {
   842	              Directive[Lookup[colors, row["Region"], Black], AbsoluteThickness[1.4]],
   843	              Line[{{row["ObservedFrequency"], row["Lower95"]}, {row["ObservedFrequency"], row["Upper95"]}}],
   844	              Black,
   845	              PointSize[0.013],
   846	              Point[{row["ObservedFrequency"], row["PosteriorMedian"]}]
   847	            },
   848	            {row, ppc}
   849	          ]
   850	        ],
   851	        Frame -> True,
   852	        Axes -> False,
   853	        PlotRange -> {{0, 1}, {0, 1}},
   854	        FrameLabel -> {"observed frequency", "posterior predictive frequency"},
   855	        ImageSize -> 700
   856	      ]
   857	    ],
   858	    ImageResolution -> 160
   859	  ];
   860	  <|"AllSimulationsFile" -> allFile, "PosteriorFile" -> posteriorFile,
   861	    "PosteriorPredictiveFile" -> ppcFile, "ParameterFigure" -> paramFig,
   862	    "PosteriorPredictiveFigure" -> ppcFig, "PosteriorPredictive" -> ppc|>
   863	];
   864	
   865	Options[RunCrossValidation] = {"SimulationCount" -> 80, "RetainCount" -> 25, "Seed" -> 260831};
   866	
   867	RunCrossValidation[samples_List, grid_List, OptionsPattern[]] := Module[
   868	  {obsAll, rows},
   869	  obsAll = ObservedSummaries[samples];
   870	  rows = Table[
   871	    Module[{trainObs, heldObs, abc, ppc, diffs, covered},
   872	      trainObs = Select[obsAll, #Region =!= held &];
   873	      heldObs = Select[obsAll, #Region === held &];
   874	      abc = RunABCFromSummaries[trainObs, grid, OptionValue["SimulationCount"],
   875	        OptionValue["RetainCount"], OptionValue["Seed"] + StringLength[held]];
   876	      ppc = PosteriorPredictiveRegional[abc["Posterior"], grid, heldObs];
   877	      diffs = ppc[[All, "ObservedFrequency"]] - ppc[[All, "PosteriorMedian"]];
   878	      covered = Boole /@ ppc[[All, "Covered95"]];
   879	      <|
   880	        "HeldOutRegion" -> held,
   881	        "HeldOutBins" -> Length[heldObs],
   882	        "TrainingBins" -> Length[trainObs],
   883	        "RMSE" -> If[diffs === {}, Missing["NoHeldOutBins"], Sqrt[Mean[diffs^2]]],
   884	        "Coverage95" -> If[covered === {}, Missing["NoHeldOutBins"], N[Mean[covered]]],
   885	        "MedianDistance" -> Median[abc["Posterior"][[All, "Distance"]]]
   886	      |>
   887	    ],
   888	    {held, $AnalysisRegions}
   889	  ];
   890	  rows
   891	];
   892	
   893	CellPolygon[cell_Association] := Module[
   894	  {lat = cell["Latitude"], lon = cell["Longitude"], h = cell["StepDegrees"]/2},
   895	  GeoPolygon[{{lat - h, lon - h}, {lat - h, lon + h}, {lat + h, lon + h}, {lat + h, lon - h}}]
   896	];
   897	
   898	$EuropeGeoRange = {{34, 63}, {-12, 36}};
   899	
   900	GeoCoordinateToKrigingPoint[{lat_?NumericQ, lon_?NumericQ}] := {N[lon Cos[50 Degree]], N[lat]};
   901	
   902	ExponentialCovariance[a_List, b_List, range_?NumericQ] := Exp[-EuclideanDistance[a, b]/range];
   903	
   904	OrdinaryKrigingWeights[
   905	  dataCoords_List,
   906	  predictionCoords_List,
   907	  range_: 3.5,
   908	  nugget_: 0.02
   909	] := Module[
   910	  {n = Length[dataCoords], covarianceMatrix, systemMatrix, solver},
   911	  covarianceMatrix = Table[
   912	    ExponentialCovariance[dataCoords[[i]], dataCoords[[j]], range] + If[i == j, nugget, 0],
   913	    {i, n}, {j, n}
   914	  ];
   915	  systemMatrix = ArrayFlatten[
   916	    {{covarianceMatrix, ConstantArray[1., {n, 1}]},
   917	     {ConstantArray[1., {1, n}], {{0.}}}}
   918	  ];
   919	  solver = Quiet@Check[LinearSolve[systemMatrix], $Failed];
   920	  If[solver === $Failed,
   921	    ConstantArray[ConstantArray[1./n, n], Length[predictionCoords]],
   922	    Table[
   923	      With[{pred = predictionCoords[[k]]},
   924	        Most[solver[Append[(ExponentialCovariance[#, pred, range] & /@ dataCoords), 1.]]]
   925	      ],
   926	      {k, Length[predictionCoords]}
   927	    ]
   928	  ]
   929	];
   930	
   931	OrdinaryKrigingPredictor[
   932	  coords_List,
   933	  values_List,
   934	  range_: 3.5,
   935	  nugget_: 0.02
   936	] := Module[
   937	  {numericValues = N[values], weightsFor},
   938	  weightsFor[coord_] := First@OrdinaryKrigingWeights[coords, {coord}, range, nugget];
   939	  Function[{coord}, Clip[weightsFor[coord].numericValues, {0, 1}]]
   940	];
   941	
   942	KrigingSurfaceSupport[grid_List, resolution_: 0.5] := Module[
   943	  {latCenters, lonCenters, geoCoordinates, predictionCoords, dataCoords, landMask, domainMask},
   944	  latCenters = Range[$EuropeGeoRange[[1, 1]] + resolution/2, $EuropeGeoRange[[1, 2]] - resolution/2, resolution];
   945	  lonCenters = Range[$EuropeGeoRange[[2, 1]] + resolution/2, $EuropeGeoRange[[2, 2]] - resolution/2, resolution];
   946	  geoCoordinates = Flatten[Table[{lat, lon}, {lat, latCenters}, {lon, lonCenters}], 1];
   947	  predictionCoords = GeoCoordinateToKrigingPoint /@ geoCoordinates;
   948	  dataCoords = GeoCoordinateToKrigingPoint /@ ({#["Latitude"], #["Longitude"]} & /@ grid);
   949	  landMask = Quiet@Check[
   950	    Map[If[NumericValueQ[#] && # > -10, 1., 0.] &,
   951	      QuantityMagnitude[GeoElevationData[GeoPosition[geoCoordinates]]]],
   952	    ConstantArray[1., Length[geoCoordinates]]
   953	  ];
   954	  If[! ListQ[landMask] || Length[landMask] =!= Length[geoCoordinates],
   955	    landMask = ConstantArray[1., Length[geoCoordinates]]];
   956	  domainMask = Module[{nfCells = Nearest[dataCoords]},
   957	    Map[If[EuclideanDistance[#, First[nfCells[#]]] <= 3., 1., 0.] &, predictionCoords]];
   958	  <|
   959	    "GeoCoordinates" -> geoCoordinates,
   960	    "HalfStep" -> resolution/2,
   961	    "LatCount" -> Length[latCenters],
   962	    "LonCount" -> Length[lonCenters],
   963	    "LandMask" -> landMask,
   964	    "DomainMask" -> domainMask,
   965	    "Weights" -> OrdinaryKrigingWeights[dataCoords, predictionCoords]
   966	  |>
   967	];
   968	
   969	KrigedSurfaceValues[support_Association, values_List] :=
   970	  Clip[support["Weights"].N[values], {0, 1}];
   971	
   972	GeoTile[{lat_, lon_}, value_, halfStep_, colorFunction_, opacity_, valueRange_] := {
   973	  GeoStyling[Opacity[opacity, colorFunction[Clip[Rescale[value, valueRange], {0, 1}]^0.55]]],
   974	  EdgeForm[None],
   975	  GeoPolygon[{
   976	    {lat - halfStep, lon - halfStep},
   977	    {lat - halfStep, lon + halfStep},
   978	    {lat + halfStep, lon + halfStep},
   979	    {lat + halfStep, lon - halfStep}
   980	  }]
   981	};
   982	
   983	KrigedSurfaceLayer[support_Association, values_List, colorFunction_, opacity_, valueRange_] := Module[
   984	  {surfaceValues},
   985	  surfaceValues = KrigedSurfaceValues[support, values];
   986	  MapThread[
   987	    GeoTile[#1, #2, support["HalfStep"], colorFunction, opacity, valueRange] &,
   988	    {support["GeoCoordinates"], surfaceValues}
   989	  ]
   990	];
   991	
   992	SamplesInWindow[samples_List, bp_?NumericQ, halfWidth_: 500] :=
   993	  Select[samples, TrueQ[#["HasCall"]] && NumericValueQ[#["Latitude"]] && NumericValueQ[#["Longitude"]] &&
   994	      34 <= #["Latitude"] <= 63 && -12 <= #["Longitude"] <= 36 &&
   995	      Abs[#["MeanDateBP"] - bp] <= halfWidth &];
   996	
   997	GeoPointLayer[samples_List] := If[samples === {},
   998	  {},
   999	  With[{positions = GeoPosition[({#["Latitude"], #["Longitude"]} & /@ samples)]},
  1000	    {
  1001	      White, PointSize[0.014], Point[positions],
  1002	      Black, PointSize[0.008], Point[positions]
  1003	    }
  1004	  ]
  1005	];
  1006	
  1007	LandMaskImage[width_Integer, height_Integer] := LandMaskImage[width, height] = Module[
  1008	  {g, raster},
  1009	  g = GeoGraphics[{},
  1010	    GeoRange -> $EuropeGeoRange,
  1011	    GeoProjection -> "Equirectangular",
  1012	    GeoBackground -> GeoStyling[{"CountryBorders",
  1013	      "Land" -> White, "Ocean" -> Black, "Border" -> White}],
  1014	    GeoGridLines -> None, GeoRangePadding -> None,
  1015	    PlotRangePadding -> None, ImagePadding -> None, ImageMargins -> 0,
  1016	    ImageSize -> {width, height}];
  1017	  raster = Quiet@Check[
  1018	    ImageResize[Rasterize[g, "Image", RasterSize -> {width, height}], {width, height}],
  1019	    $Failed];
  1020	  If[raster === $Failed, Return[Image[ConstantArray[1., {height, width}]]]];
  1021	  Image[Round[ImageData[ColorConvert[raster, "Grayscale"]]]]
  1022	];
  1023	
  1024	FieldOverlayImage[support_Association, values_List, colorFunction_, valueRange_, opacity_, width_Integer, height_Integer] := Module[
  1025	  {vals, matrix, colored, img, maskImg, domainImg},
  1026	  vals = KrigedSurfaceValues[support, values];
  1027	  matrix = Reverse[Partition[vals, support["LonCount"]]];
  1028	  colored = Map[
  1029	    List @@ ColorConvert[colorFunction[Clip[Rescale[#, valueRange], {0, 1}]^0.55], "RGB"] &,
  1030	    matrix, {2}
  1031	  ];
  1032	  img = ImageResize[Image[colored], {width, height}];
  1033	  maskImg = LandMaskImage[width, height];
  1034	  domainImg = ImageResize[
  1035	    Image[Reverse[Partition[Lookup[support, "DomainMask", ConstantArray[1., Length[vals]]], support["LonCount"]]]],
  1036	    {width, height}];
  1037	  SetAlphaChannel[img, ImageMultiply[ImageMultiply[maskImg, domainImg], opacity]]
  1038	];
  1039	
  1040	$MapPixelWidth = 1152;
  1041	$MapAspect = ($EuropeGeoRange[[1, 2]] - $EuropeGeoRange[[1, 1]])/($EuropeGeoRange[[2, 2]] - $EuropeGeoRange[[2, 1]]);
  1042	
  1043	BaseMapRaster[width_Integer] := BaseMapRaster[width] = Module[{h, g},
  1044	  h = Round[width $MapAspect];
  1045	  g = GeoGraphics[{},
  1046	    GeoRange -> $EuropeGeoRange,
  1047	    GeoProjection -> "Equirectangular",
  1048	    GeoBackground -> GeoStyling[{"CountryBorders",
  1049	      "Land" -> GrayLevel[0.985], "Ocean" -> RGBColor[0.82, 0.89, 0.95]}],
  1050	    GeoGridLines -> None, GeoRangePadding -> None,
  1051	    PlotRangePadding -> None, ImagePadding -> None, ImageMargins -> 0,
  1052	    ImageSize -> {width, h}];
  1053	  ImageResize[Rasterize[g, "Image", RasterSize -> {width, h}], {width, h}]
  1054	];
  1055	
  1056	SamplePointsRaster[samples_List, width_Integer, height_Integer] := Module[{pts},
  1057	  If[samples === {}, Return[None]];
  1058	  pts = {#["Longitude"], #["Latitude"]} & /@ samples;
  1059	  Rasterize[
  1060	    Graphics[
  1061	      {White, PointSize[0.011], Point[pts], Black, PointSize[0.0062], Point[pts]},
  1062	      PlotRange -> {{$EuropeGeoRange[[2, 1]], $EuropeGeoRange[[2, 2]]},
  1063	        {$EuropeGeoRange[[1, 1]], $EuropeGeoRange[[1, 2]]}},
  1064	      PlotRangePadding -> None, ImagePadding -> None, ImageMargins -> 0,
  1065	      AspectRatio -> Full, Background -> None,
  1066	      ImageSize -> {width, height}],
  1067	    "Image", RasterSize -> {width, height}, Background -> None]
  1068	];
  1069	
  1070	SpatialMap[grid_List, support_Association, values_List, samples_List, label_String, colorFunction_, opacity_: 0.92,
  1071	  valueRange_: {0, 1}, legendLabel_: "frequency"] := Module[
  1072	  {legendColorFunction, w, h, base, overlay, ptsImg, composed},
  1073	  legendColorFunction = (colorFunction[Clip[Rescale[#, valueRange], {0, 1}]^0.55] &);
  1074	  w = $MapPixelWidth; h = Round[w $MapAspect];
  1075	  base = BaseMapRaster[w];
  1076	  overlay = FieldOverlayImage[support, values, colorFunction, valueRange, opacity, w, h];
  1077	  composed = ImageCompose[base, overlay];
  1078	  ptsImg = SamplePointsRaster[samples, w, h];
  1079	  If[ImageQ[ptsImg], composed = ImageCompose[composed, ptsImg]];
  1080	  Framed[
  1081	    Legended[
  1082	      Labeled[
  1083	        Image[composed, ImageSize -> 640],
  1084	        Style[label, 13, Bold, Black], Top],
  1085	      Placed[
  1086	        BarLegend[
  1087	          {legendColorFunction, valueRange},
  1088	          LegendLabel -> Style[legendLabel, 11, Black],
  1089	          LabelStyle -> Directive[Black, 10],
  1090	          LegendMarkerSize -> 220,
  1091	          LegendFunction -> (Framed[#, Background -> White, FrameStyle -> None] &)
  1092	        ],
  1093	        Right
  1094	      ]
  1095	    ],
  1096	    Background -> White,
  1097	    FrameStyle -> None,
  1098	    FrameMargins -> 4
  1099	  ]
  1100	];
  1101	
  1102	PosteriorCellStats[posterior_List, grid_List, times_List] := Module[
  1103	  {trajectories},
  1104	  trajectories = SimulateSpatialTrajectory[#, grid] & /@ posterior;
  1105	  Association@Table[
  1106	    Module[{matrix},
  1107	      matrix = FrequenciesAt[#, t] & /@ trajectories;
  1108	      t -> <|
  1109	        "Mean" -> Mean /@ Transpose[matrix],
  1110	        "Lower95" -> (Quantile[#, 0.025] & /@ Transpose[matrix]),
  1111	        "Upper95" -> (Quantile[#, 0.975] & /@ Transpose[matrix])
  1112	      |>
  1113	    ],
  1114	    {t, times}
  1115	  ]
  1116	];
  1117	
  1118	ExportSpatialVisualizations[root_String, samples_List, grid_List, posterior_List] := Module[
  1119	  {figDir, times, stats, meanMapFile, uncertaintyMapFile, gifFile, mp4File,
  1120	   iCloudGIFFile, iCloudMP4File, frames, meanValues, uncertaintyValues, meanCF,
  1121	   uncertaintyCF, sampleWindow, krigingSupport},
  1122	  figDir = FileNameJoin[{root, "figures", "generated"}];
  1123	  times = Range[8000, 0, -500];
  1124	  stats = PosteriorCellStats[posterior, grid, times];
  1125	  krigingSupport = KrigingSurfaceSupport[grid, 1.5];
  1126	  meanCF = (ColorData["TemperatureMap"][#] &);
  1127	  uncertaintyCF = (Blend[
  1128	      {RGBColor[0.98, 0.98, 0.98], RGBColor[1.0, 0.88, 0.18],
  1129	       RGBColor[1.0, 0.42, 0.04], RGBColor[0.70, 0.0, 0.70]},
  1130	      #
  1131	    ] &);
  1132	  meanValues = stats[3000]["Mean"];
  1133	  uncertaintyValues = stats[3000]["Upper95"] - stats[3000]["Lower95"];
  1134	  sampleWindow = SamplesInWindow[samples, 3000, 500];
  1135	  meanMapFile = FileNameJoin[{figDir, "spatial_posterior_mean_3000bp.png"}];
  1136	  uncertaintyMapFile = FileNameJoin[{figDir, "spatial_uncertainty_width_3000bp.png"}];
  1137	  Export[
  1138	    meanMapFile,
  1139	    SpatialMap[grid, krigingSupport, meanValues, sampleWindow,
  1140	      "Kriged posterior mean LP frequency, 3000 BP", meanCF, 0.92, {0, 0.5}, "mean frequency"],
  1141	    ImageResolution -> 160
  1142	  ];
  1143	  Export[
  1144	    uncertaintyMapFile,
  1145	    SpatialMap[grid, krigingSupport, uncertaintyValues, sampleWindow,
  1146	      "Kriged 95% interval width, 3000 BP", uncertaintyCF, 0.92, {0, 1.0}, "95% interval width"],
  1147	    ImageResolution -> 160
  1148	  ];
  1149	  frames = Table[
  1150	    Module[{mean = stats[t]["Mean"], width = stats[t]["Upper95"] - stats[t]["Lower95"], s = SamplesInWindow[samples, t, 500]},
  1151	      Rasterize[
  1152	        GraphicsGrid[
  1153	          {{
  1154	            SpatialMap[grid, krigingSupport, mean, s, "Kriged mean frequency, " <> ToString[t] <> " BP",
  1155	              meanCF, 0.92, {0, 0.5}, "mean frequency"],
  1156	            SpatialMap[grid, krigingSupport, width, s, "Kriged uncertainty width, " <> ToString[t] <> " BP",
  1157	              uncertaintyCF, 0.92, {0, 1.0}, "95% width"]
  1158	          }},
  1159	          Spacings -> {0.2, 0.1},
  1160	          ImageSize -> 1500
  1161	        ],
  1162	        "Image",
  1163	        RasterSize -> {1500, 780},
  1164	        Background -> White
  1165	      ]
  1166	    ],
  1167	    {t, times}
  1168	  ];
  1169	  gifFile = FileNameJoin[{figDir, "lactase_persistence_spatial_posterior.gif"}];
  1170	  Export[gifFile, frames, "DisplayDurations" -> 0.7, AnimationRepetitions -> Infinity];
  1171	  mp4File = ExportMP4FromFrames[
  1172	    FileNameJoin[{figDir, "lactase_persistence_spatial_posterior.mp4"}],
  1173	    frames,
  1174	    0.7
  1175	  ];
  1176	  iCloudGIFFile = CopyVersionToICloud[gifFile, "lactase_persistence_spatial_posterior"];
  1177	  iCloudMP4File = If[StringQ[mp4File] && FileExistsQ[mp4File],
  1178	    CopyVersionToICloud[mp4File, "lactase_persistence_spatial_posterior"],
  1179	    Missing["MP4Unavailable"]
  1180	  ];
  1181	  <|
  1182	    "MeanMap" -> meanMapFile,
  1183	    "UncertaintyMap" -> uncertaintyMapFile,
  1184	    "Animation" -> gifFile,
  1185	    "MP4" -> mp4File,
  1186	    "ICloudAnimation" -> iCloudGIFFile,
  1187	    "ICloudMP4" -> iCloudMP4File
  1188	  |>
  1189	];
  1190	
  1191	WriteRunSummary[root_String, outputs_Association] := Module[
  1192	  {file, lines, path, rootClean, rootPrefix, entry},
  1193	  file = FileNameJoin[{root, "docs", "run-summary.md"}];
  1194	  rootClean = If[StringEndsQ[root, $PathnameSeparator] && StringLength[root] > 1, StringDrop[root, -1], root];
  1195	  rootPrefix = rootClean <> $PathnameSeparator;
  1196	  path[key_String] := Module[{value = Lookup[outputs, key, ""]},
  1197	    If[StringQ[value],
  1198	      If[StringStartsQ[value, rootPrefix], StringDrop[value, StringLength[rootPrefix]], value],
  1199	      ToString[value, InputForm]
  1200	    ]

exec
/bin/zsh -lc "nl -ba src/LactasePersistenceSpatial.wl | sed -n '1201,1800p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
  1201	  ];
  1202	  entry[label_String, key_String] :=
  1203	    If[KeyExistsQ[outputs, key], {"- " <> label <> ": `" <> path[key] <> "`"}, {}];
  1204	  lines = Join[
  1205	    {"# Run Summary", "",
  1206	     "Generated: " <> DateString[Now, "ISODateTime"], "",
  1207	     "Pipeline: GLAD ancient rs4988235 genotypes (derived from AADR v44.3), regional binomial logistic reproduction, coarse spatial diffusion-selection model, SMC-ABC inference with spatial-gradient summary statistics, posterior predictive checks, held-out validation, and prior sensitivity analysis.", "",
  1208	     "## Key Outputs", ""},
  1209	    entry["Processed samples", "CalledSamplesFile"],
  1210	    entry["Regional binned frequencies", "BinnedFrequenciesFile"],
  1211	    entry["Regional logistic fits", "RegionalFitFile"],
  1212	    entry["Regional reproduction figure", "RegionalFigure"],
  1213	    entry["SMC particles with weights", "ParticlesFile"],
  1214	    entry["Resampled posterior draws", "PosteriorFile"],
  1215	    entry["SMC diagnostics", "DiagnosticsFile"],
  1216	    entry["Posterior parameter quantiles", "QuantilesFile"],
  1217	    entry["Posterior predictive checks", "PosteriorPredictiveFile"],
  1218	    entry["Parameter posterior figure", "ParameterFigure"],
  1219	    entry["Posterior predictive figure", "PosteriorPredictiveFigure"],
  1220	    entry["Held-out-region cross-validation", "CrossValidationFile"],
  1221	    entry["Time-slice validation", "TimeSliceFile"],
  1222	    entry["Sensitivity quantiles", "SensitivityFile"],
  1223	    entry["Sensitivity figure", "SensitivityFigure"],
  1224	    entry["Spatial mean map", "MeanMap"],
  1225	    entry["Spatial uncertainty map", "UncertaintyMap"],
  1226	    entry["Spatial GIF animation", "Animation"],
  1227	    entry["Spatial MP4 video", "MP4"],
  1228	    entry["iCloud GIF copy", "ICloudAnimation"],
  1229	    entry["iCloud MP4 copy", "ICloudMP4"],
  1230	    {"",
  1231	     "## Inference Notes", "",
  1232	     Lookup[outputs, "InferenceNote", "SMC-ABC settings recorded in smc_diagnostics.csv."], "",
  1233	     "## Scientific Status", "",
  1234	     "The regional logistic layer is a qualitative reproduction of the published four-region framing, not a claim of exact parameter identity with Evershed et al. 2022. The spatial model is deliberately coarse; ordinary kriging is a display layer only. Posterior uncertainty, held-out validation, and prior sensitivity are reported alongside every point summary."}
  1235	  ];
  1236	  Export[file, StringRiffle[lines, "\n"], "Text"];
  1237	  file
  1238	];
  1239	
  1240	
  1241	(* ------------------------------------------------------------------ *)
  1242	(* Statistical upgrade layer: Wilson intervals, logistic-fit standard *)
  1243	(* errors, spatial-gradient summary statistics, and shared styling.   *)
  1244	(* ------------------------------------------------------------------ *)
  1245	
  1246	$RegionColors = <|
  1247	  "British Isles" -> RGBColor[0.20, 0.47, 0.71],
  1248	  "Rhine-Danube" -> RGBColor[0.85, 0.45, 0.11],
  1249	  "Mediterranean" -> RGBColor[0.17, 0.63, 0.37],
  1250	  "Baltic" -> RGBColor[0.62, 0.35, 0.71],
  1251	  "Other Europe" -> GrayLevel[0.45]
  1252	|>;
  1253	
  1254	$PosteriorColor = RGBColor[0.20, 0.47, 0.71];
  1255	$PriorColor = RGBColor[0.85, 0.45, 0.11];
  1256	
  1257	WilsonInterval[derived_?NumericQ, called_?NumericQ, z_: 1.959963984540054] := Module[
  1258	  {p, denom, center, half},
  1259	  If[called <= 0, Return[{0., 1.}]];
  1260	  p = N[derived/called];
  1261	  denom = 1 + z^2/called;
  1262	  center = (p + z^2/(2 called))/denom;
  1263	  half = (z Sqrt[p (1 - p)/called + z^2/(4 called^2)])/denom;
  1264	  {Clip[center - half, {0, 1}], Clip[center + half, {0, 1}]}
  1265	];
  1266	
  1267	LogisticFitStandardErrors[objective_, alpha_?NumericQ, beta_?NumericQ, h_: 0.005] := Module[
  1268	  {faa, fbb, fab, hessian, cov},
  1269	  faa = (objective[alpha + h, beta] - 2 objective[alpha, beta] + objective[alpha - h, beta])/h^2;
  1270	  fbb = (objective[alpha, beta + h] - 2 objective[alpha, beta] + objective[alpha, beta - h])/h^2;
  1271	  fab = (objective[alpha + h, beta + h] - objective[alpha + h, beta - h] -
  1272	      objective[alpha - h, beta + h] + objective[alpha - h, beta - h])/(4 h^2);
  1273	  hessian = {{faa, fab}, {fab, fbb}};
  1274	  cov = Quiet@Check[Inverse[-hessian], $Failed];
  1275	  If[cov === $Failed || AnyTrue[Diagonal[cov], # <= 0 &],
  1276	    {Missing["NotAvailable"], Missing["NotAvailable"]},
  1277	    Sqrt[Diagonal[cov]]
  1278	  ]
  1279	];
  1280	
  1281	WeightedQuantile[values_List, weights_List, q_?NumericQ] := Module[
  1282	  {order, v, w, cum, total, idx},
  1283	  order = Ordering[values];
  1284	  v = values[[order]]; w = weights[[order]];
  1285	  total = Total[w];
  1286	  If[total <= 0, Return[Missing["NoWeight"]]];
  1287	  cum = Accumulate[w]/total;
  1288	  idx = LengthWhile[cum, # < q &] + 1;
  1289	  v[[Min[idx, Length[v]]]]
  1290	];
  1291	
  1292	WeightedComponentVariance[vectors_List, weights_List] := Module[
  1293	  {w = weights/Total[weights], means},
  1294	  means = w . vectors;
  1295	  w . ((# - means)^2 & /@ vectors)
  1296	];
  1297	
  1298	(* --- observation index and spatial-gradient summary statistics --- *)
  1299	
  1300	BuildObservationIndex[samples_List, grid_List] := Module[{coords, nf, sel},
  1301	  coords = ({#["Latitude"], #["Longitude"]} & /@ grid);
  1302	  nf = Nearest[coords -> "Index"];
  1303	  sel = Select[samples,
  1304	    TrueQ[#["HasCall"]] && NumericValueQ[#["Latitude"]] && NumericValueQ[#["Longitude"]] &&
  1305	      NumericValueQ[#["MeanDateBP"]] && #["MeanDateBP"] <= 12000 &&
  1306	      MemberQ[Append[$AnalysisRegions, "Other Europe"], #["Region"]] &
  1307	  ];
  1308	  Map[
  1309	    <|
  1310	      "CellIndex" -> First[nf[{#["Latitude"], #["Longitude"]}]],
  1311	      "TimeBP" -> N[#["MeanDateBP"]],
  1312	      "Called" -> #["CalledAlleles"],
  1313	      "Derived" -> #["DerivedAlleles"],
  1314	      "Latitude" -> #["Latitude"],
  1315	      "Longitude" -> #["Longitude"]
  1316	    |> &,
  1317	    sel
  1318	  ]
  1319	];
  1320	
  1321	$GradientLateWindowBP = 4000;
  1322	$GradientWindows = {{0, 4000}, {4800, 12000}};
  1323	
  1324	GradientPoolPositions[index_List, window_: {0, 4000}] := Module[{pos},
  1325	  pos = Select[Range[Length[index]],
  1326	    window[[1]] < index[[#, "TimeBP"]] <= window[[2]] &];
  1327	  <|
  1328	    "North" -> Select[pos, index[[#, "Latitude"]] >= 52 &],
  1329	    "South" -> Select[pos, index[[#, "Latitude"]] < 46 &],
  1330	    "West" -> Select[pos, index[[#, "Longitude"]] < 5 &],
  1331	    "East" -> Select[pos, index[[#, "Longitude"]] >= 15 &]
  1332	  |>
  1333	];
  1334	
  1335	PooledFrequency[index_List, positions_List] := Module[{called, derived},
  1336	  If[positions === {}, Return[Missing["NoSamples"]]];
  1337	  called = Total[index[[positions, "Called"]]];
  1338	  derived = Total[index[[positions, "Derived"]]];
  1339	  If[called <= 0, Missing["NoSamples"], N[derived/called]]
  1340	];
  1341	
  1342	PooledPredictedFrequency[index_List, positions_List, ps_List] := Module[{called},
  1343	  If[positions === {}, Return[Missing["NoSamples"]]];
  1344	  called = index[[positions, "Called"]];
  1345	  If[Total[called] <= 0, Missing["NoSamples"], N[Total[called ps[[positions]]]/Total[called]]]
  1346	];
  1347	
  1348	ObservedGradientStatistics[index_List, window_: {0, 4000}] := Module[{pools, fN, fS, fW, fE, wNS, wWE},
  1349	  pools = GradientPoolPositions[index, window];
  1350	  fN = PooledFrequency[index, pools["North"]];
  1351	  fS = PooledFrequency[index, pools["South"]];
  1352	  fW = PooledFrequency[index, pools["West"]];
  1353	  fE = PooledFrequency[index, pools["East"]];
  1354	  wNS = If[MissingQ[fN] || MissingQ[fS], 0,
  1355	    Min[Total[index[[pools["North"], "Called"]]], Total[index[[pools["South"], "Called"]]]]];
  1356	  wWE = If[MissingQ[fW] || MissingQ[fE], 0,
  1357	    Min[Total[index[[pools["West"], "Called"]]], Total[index[[pools["East"], "Called"]]]]];
  1358	  <|
  1359	    "Pools" -> pools,
  1360	    "NorthSouth" -> If[wNS > 0, fN - fS, 0.],
  1361	    "WestEast" -> If[wWE > 0, fW - fE, 0.],
  1362	    "NorthSouthWeight" -> wNS,
  1363	    "WestEastWeight" -> wWE
  1364	  |>
  1365	];
  1366	
  1367	PredictedSampleProbabilities[trajectory_Association, index_List] := Module[{times, freqs},
  1368	  times = trajectory["TimesBP"];
  1369	  freqs = trajectory["Frequencies"];
  1370	  Map[
  1371	    freqs[[First@Ordering[Abs[times - #["TimeBP"]], 1], #["CellIndex"]]] &,
  1372	    index
  1373	  ]
  1374	];
  1375	
  1376	ExtendedObservedData[samples_List, grid_List, binSize_: 1000] := Module[{binned, index, gradients},
  1377	  binned = ObservedSummaries[samples, binSize];
  1378	  index = BuildObservationIndex[samples, grid];
  1379	  gradients = ObservedGradientStatistics[index, #] & /@ $GradientWindows;
  1380	  <|"Binned" -> binned, "Index" -> index,
  1381	    "Gradient" -> First[gradients], "Gradients" -> gradients|>
  1382	];
  1383	
  1384	ExtendedDistance[obsData_Association, trajectory_Association, grid_List] := Module[
  1385	  {binned, predicted, binWeights, binDiffs, gradients, ps, num, den},
  1386	  binned = obsData["Binned"];
  1387	  predicted = PredictedSummariesFromTrajectory[trajectory, grid, binned];
  1388	  binWeights = binned[[All, "CalledAlleles"]];
  1389	  binDiffs = binned[[All, "Frequency"]] - predicted[[All, "PredictedFrequency"]];
  1390	  gradients = Lookup[obsData, "Gradients", {obsData["Gradient"]}];
  1391	  ps = If[AnyTrue[gradients, #["NorthSouthWeight"] > 0 || #["WestEastWeight"] > 0 &],
  1392	    PredictedSampleProbabilities[trajectory, obsData["Index"]], {}];
  1393	  num = Total[binWeights binDiffs^2];
  1394	  den = Total[binWeights];
  1395	  Do[
  1396	    Module[{pools = g["Pools"], wNS = g["NorthSouthWeight"], wWE = g["WestEastWeight"],
  1397	      gNSdiff = 0., gWEdiff = 0.},
  1398	      If[wNS > 0,
  1399	        gNSdiff = g["NorthSouth"] -
  1400	          (PooledPredictedFrequency[obsData["Index"], pools["North"], ps] -
  1401	           PooledPredictedFrequency[obsData["Index"], pools["South"], ps])];
  1402	      If[wWE > 0,
  1403	        gWEdiff = g["WestEast"] -
  1404	          (PooledPredictedFrequency[obsData["Index"], pools["West"], ps] -
  1405	           PooledPredictedFrequency[obsData["Index"], pools["East"], ps])];
  1406	      num += wNS gNSdiff^2 + wWE gWEdiff^2;
  1407	      den += wNS + wWE;
  1408	    ],
  1409	    {g, gradients}
  1410	  ];
  1411	  Sqrt[num/den]
  1412	];
  1413	
  1414	(* ------------------------------------------------------------------ *)
  1415	(* SMC-ABC with adaptive tolerances and importance weights.           *)
  1416	(* ------------------------------------------------------------------ *)
  1417	
  1418	SMCDistanceForVector[vector_List, obsData_Association, grid_List, spec_] := Module[
  1419	  {params, trajectory, dOrigin, originPt, gridPts, originIdx, onsetGap},
  1420	  params = ParamsFromVector[vector, spec];
  1421	  (* a point source must sit on land: origins farther than 1.6 degrees from
  1422	     any land cell centre (sea, or outside the modelled domain) are rejected
  1423	     with a large graded distance, so nearest-cell snapping cannot pile
  1424	     prior mass onto coastal cells *)
  1425	  If[KeyExistsQ[params, "OriginTimeBP"],
  1426	    originPt = {params["OriginLatitude"], params["OriginLongitude"] Cos[params["OriginLatitude"] Degree]};
  1427	    gridPts = ({#["Latitude"], #["Longitude"] Cos[#["Latitude"] Degree]} & /@ grid);
  1428	    originIdx = First @ Nearest[gridPts -> "Index", originPt];
  1429	    dOrigin = EuclideanDistance[originPt, gridPts[[originIdx]]];
  1430	    If[dOrigin > 1.6, Return[3. + dOrigin]];
  1431	    (* gene-culture coupling: the point source locates the start of the
  1432	       selection-driven rise, which presupposes dairying \[LongDash] so the
  1433	       origin may precede the local dairying onset by at most
  1434	       $OriginDairyingLeadYears.  Without this the deterministic core (no
  1435	       drift) lets a tiny injection idle for millennia in forager regions
  1436	       and the origin location decouples from the coevolution story. *)
  1437	    onsetGap = params["OriginTimeBP"] - grid[[originIdx]]["DairyingOnsetBP"] -
  1438	      $OriginDairyingLeadYears;
  1439	    If[onsetGap > 0, Return[3. + onsetGap/1000.]];
  1440	  ];
  1441	  trajectory = SimulateSpatialTrajectory[params, grid];
  1442	  ExtendedDistance[obsData, trajectory, grid]
  1443	];
  1444	
  1445	GaussianKernelDensityRows[candidates_List, previous_List, sds_List] := Module[
  1446	  {invTwoVar, norm},
  1447	  invTwoVar = 1/(2 sds^2);
  1448	  norm = 1/(Sqrt[2 Pi] sds);
  1449	  Table[
  1450	    Table[
  1451	      Times @@ (norm Exp[-invTwoVar (candidates[[i]] - previous[[j]])^2]),
  1452	      {j, Length[previous]}
  1453	    ],
  1454	    {i, Length[candidates]}
  1455	  ]
  1456	];
  1457	
  1458	(* SMC operates in an unbounded logit-transformed space so that Gaussian
  1459	   perturbations never leave the prior box. If x ~ Uniform(a, b) and
  1460	   y = logit((x - a)/(b - a)), then y follows a standard logistic
  1461	   distribution, giving a closed-form prior density in y-space. *)
  1462	
  1463	ToUnboundedVector[vector_List, spec_] := MapThread[
  1464	  Module[{u = Clip[(#1 - #2[[1]])/(#2[[2]] - #2[[1]]), {10.^-12, 1 - 10.^-12}]},
  1465	    Log[u/(1 - u)]
  1466	  ] &,
  1467	  {vector, Values[spec]}
  1468	];
  1469	
  1470	FromUnboundedVector[y_List, spec_] := MapThread[
  1471	  #2[[1]] + (#2[[2]] - #2[[1]])/(1 + Exp[-#1]) &,
  1472	  {y, Values[spec]}
  1473	];
  1474	
  1475	LogisticPriorDensity[y_List] := Times @@ (Exp[-#]/(1 + Exp[-#])^2 & /@ y);
  1476	
  1477	Options[RunSMCABC] = {
  1478	  "Particles" -> 400,
  1479	  "Generations" -> 5,
  1480	  "ToleranceQuantile" -> 0.5,
  1481	  "Seed" -> 20260831,
  1482	  "BinSizeYears" -> 1000,
  1483	  "MaxSimulationsPerGeneration" -> Automatic,
  1484	  "PriorSpec" -> Automatic,
  1485	  "ProgressFunction" -> None
  1486	};
  1487	
  1488	RunSMCABC[samples_List, grid_List, OptionsPattern[]] := Module[
  1489	  {spec, n, gens, q, seed, obsData, maxSims, progress,
  1490	   vectors, ys, dists, weights, eps, epsHistory = {}, accHistory = {}, essHistory = {},
  1491	   totalSims = 0, generationShortfall = False},
  1492	  spec = If[OptionValue["PriorSpec"] === Automatic, $PriorSpec, OptionValue["PriorSpec"]];
  1493	  n = OptionValue["Particles"];
  1494	  gens = OptionValue["Generations"];
  1495	  q = OptionValue["ToleranceQuantile"];
  1496	  seed = OptionValue["Seed"];
  1497	  maxSims = If[OptionValue["MaxSimulationsPerGeneration"] === Automatic,
  1498	    30 n, OptionValue["MaxSimulationsPerGeneration"]];
  1499	  progress = OptionValue["ProgressFunction"];
  1500	  obsData = ExtendedObservedData[samples, grid, OptionValue["BinSizeYears"]];
  1501	  BlockRandom[
  1502	    SeedRandom[seed];
  1503	    vectors = Table[PriorVectorSample[spec], {n}];
  1504	    ys = ToUnboundedVector[#, spec] & /@ vectors;
  1505	    dists = SMCDistanceForVector[#, obsData, grid, spec] & /@ vectors;
  1506	    totalSims += n;
  1507	    weights = ConstantArray[1./n, n];
  1508	    eps = Quantile[dists, q];
  1509	    AppendTo[epsHistory, eps];
  1510	    AppendTo[accHistory, 1.];
  1511	    AppendTo[essHistory, N[n]];
  1512	    If[progress =!= None, progress[1, eps, 1., N[n]]];
  1513	    Do[
  1514	      Module[
  1515	        {prevYs = ys, prevWeights = weights, sds,
  1516	         acceptedYs = {}, acceptedXs = {}, acceptedDists = {}, attempts = 0,
  1517	         batch, batchYs, batchXs, batchDists, keepPos, kernelRows, priorDensities, newWeights},
  1518	        sds = Sqrt[2. Clip[WeightedComponentVariance[prevYs, prevWeights], {10.^-12, Infinity}]];
  1519	        While[Length[acceptedYs] < n && attempts < maxSims,
  1520	          batch = Min[2 n, maxSims - attempts];
  1521	          batchYs = Table[
  1522	            RandomChoice[prevWeights -> prevYs] +
  1523	              sds RandomVariate[NormalDistribution[0, 1], Length[sds]],
  1524	            {batch}
  1525	          ];
  1526	          attempts += batch;
  1527	          batchXs = FromUnboundedVector[#, spec] & /@ batchYs;
  1528	          batchDists = SMCDistanceForVector[#, obsData, grid, spec] & /@ batchXs;
  1529	          totalSims += batch;
  1530	          keepPos = Select[Range[Length[batchDists]], batchDists[[#]] < eps &];
  1531	          acceptedYs = Join[acceptedYs, batchYs[[keepPos]]];
  1532	          acceptedXs = Join[acceptedXs, batchXs[[keepPos]]];
  1533	          acceptedDists = Join[acceptedDists, batchDists[[keepPos]]];
  1534	        ];
  1535	        If[Length[acceptedYs] < n,
  1536	          generationShortfall = True;
  1537	          Break[]
  1538	        ];
  1539	        acceptedYs = acceptedYs[[;; n]];
  1540	        acceptedXs = acceptedXs[[;; n]];
  1541	        acceptedDists = acceptedDists[[;; n]];
  1542	        kernelRows = GaussianKernelDensityRows[acceptedYs, prevYs, sds];
  1543	        priorDensities = LogisticPriorDensity /@ acceptedYs;
  1544	        newWeights = Table[
  1545	          priorDensities[[i]]/Max[prevWeights . kernelRows[[i]], 10.^-300],
  1546	          {i, n}
  1547	        ];
  1548	        newWeights = newWeights/Total[newWeights];
  1549	        ys = acceptedYs;
  1550	        vectors = acceptedXs;
  1551	        dists = acceptedDists;
  1552	        weights = newWeights;
  1553	        eps = Quantile[dists, q];
  1554	        AppendTo[epsHistory, eps];
  1555	        AppendTo[accHistory, N[n/Max[attempts, 1]]];
  1556	        AppendTo[essHistory, 1./Total[weights^2]];
  1557	        If[progress =!= None, progress[g, eps, N[n/Max[attempts, 1]], 1./Total[weights^2]]];
  1558	      ],
  1559	      {g, 2, gens}
  1560	    ];
  1561	  ];
  1562	  <|
  1563	    "ParticleVectors" -> vectors,
  1564	    "Particles" -> MapThread[Append[ParamsFromVector[#1, spec], "Distance" -> #2] &, {vectors, dists}],
  1565	    "Weights" -> weights,
  1566	    "ParameterKeys" -> Keys[spec],
  1567	    "EpsilonHistory" -> epsHistory,
  1568	    "AcceptanceHistory" -> accHistory,
  1569	    "ESSHistory" -> essHistory,
  1570	    "TotalSimulations" -> totalSims,
  1571	    "GenerationShortfall" -> generationShortfall,
  1572	    "ObservedSummaries" -> obsData["Binned"],
  1573	    "PriorSpecUsed" -> spec
  1574	  |>
  1575	];
  1576	
  1577	ResamplePosterior[smc_Association, count_Integer: 100] := BlockRandom[
  1578	  SeedRandom[420 + count];
  1579	  RandomChoice[smc["Weights"] -> smc["Particles"], count]
  1580	];
  1581	
  1582	$DefaultQuantileSpec = {{"Lower95", 0.025}, {"Q25", 0.25}, {"Median", 0.5}, {"Q75", 0.75}, {"Upper95", 0.975}};
  1583	
  1584	PosteriorParameterQuantiles[smc_Association, qs_: Automatic] := Module[
  1585	  {spec = smc["PriorSpecUsed"], vectors = smc["ParticleVectors"], weights = smc["Weights"],
  1586	   quantSpec, keys},
  1587	  quantSpec = If[qs === Automatic, $DefaultQuantileSpec, qs];
  1588	  keys = Keys[spec];
  1589	  Table[
  1590	    Join[
  1591	      <|"Parameter" -> keys[[k]]|>,
  1592	      AssociationThread[
  1593	        quantSpec[[All, 1]],
  1594	        WeightedQuantile[vectors[[All, k]], weights, #] & /@ quantSpec[[All, 2]]
  1595	      ]
  1596	    ],
  1597	    {k, Length[keys]}
  1598	  ]
  1599	];
  1600	
  1601	(* --- SMC output export: tables, diagnostics, and figures --- *)
  1602	
  1603	PosteriorPriorFigure[smc_Association] := Module[
  1604	  {spec = smc["PriorSpecUsed"], vectors = smc["ParticleVectors"], weights = smc["Weights"], panels},
  1605	  panels = Table[
  1606	    Module[{pos, vals, range, pad, priorDensity, hist, priorPlot},
  1607	      pos = Position[Keys[spec], key][[1, 1]];
  1608	      vals = vectors[[All, pos]];
  1609	      range = spec[key];
  1610	      pad = 0.03 (range[[2]] - range[[1]]);
  1611	      priorDensity = 1/(range[[2]] - range[[1]]);
  1612	      hist = Histogram[WeightedData[vals, weights], 14, "PDF",
  1613	        ChartStyle -> Directive[$PosteriorColor, Opacity[0.65], EdgeForm[None]],
  1614	        Frame -> True, Axes -> False,
  1615	        PlotLabel -> Style[key, 10.5],
  1616	        ImageSize -> 300,
  1617	        LabelStyle -> Directive[Black, 9.5]];
  1618	      priorPlot = Plot[priorDensity, {x, range[[1]], range[[2]]},
  1619	        PlotStyle -> Directive[$PriorColor, Dashed, AbsoluteThickness[1.6]]];
  1620	      Show[hist, priorPlot, PlotRange -> {{range[[1]] - pad, range[[2]] + pad}, All}]
  1621	    ],
  1622	    {key, Keys[spec]}
  1623	  ];
  1624	  Legended[
  1625	    GraphicsGrid[Partition[panels, 2], Spacings -> {0.6, 0.7}],
  1626	    LineLegend[
  1627	      {Directive[$PosteriorColor, AbsoluteThickness[6]], Directive[$PriorColor, Dashed]},
  1628	      {"weighted SMC posterior", "prior"}
  1629	    ]
  1630	  ]
  1631	];
  1632	
  1633	PosteriorPredictiveFigure[ppc_List] := Module[{coverage},
  1634	  coverage = N[Mean[Boole /@ ppc[[All, "Covered95"]]]];
  1635	  Legended[
  1636	    Graphics[
  1637	      Join[
  1638	        {{GrayLevel[0.6], Dashed, AbsoluteThickness[1], Line[{{0, 0}, {1, 1}}]}},
  1639	        Table[
  1640	          {Directive[Lookup[$RegionColors, row["Region"], Black], Opacity[0.8], AbsoluteThickness[1.6]],
  1641	           Line[{{row["ObservedFrequency"], row["Lower95"]}, {row["ObservedFrequency"], row["Upper95"]}}],
  1642	           Directive[Lookup[$RegionColors, row["Region"], Black], Opacity[1]],
  1643	           PointSize[0.012], Point[{row["ObservedFrequency"], row["PosteriorMedian"]}]},
  1644	          {row, ppc}
  1645	        ]
  1646	      ],
  1647	      Frame -> True, Axes -> False,
  1648	      PlotRange -> {{-0.02, 1.02}, {-0.02, 1.02}},
  1649	      FrameLabel -> {"observed binned frequency", "posterior predictive"},
  1650	      PlotLabel -> Style[
  1651	        "Posterior predictive check, 95% intervals, empirical coverage " <>
  1652	          ToString[NumberForm[coverage, {3, 2}]], 12],
  1653	      LabelStyle -> Directive[Black, 11],
  1654	      ImageSize -> 640
  1655	    ],
  1656	    PointLegend[Values[KeyTake[$RegionColors, $AnalysisRegions]], $AnalysisRegions]
  1657	  ]
  1658	];
  1659	
  1660	ExportSMCOutputs[root_String, samples_List, grid_List, smc_Association, posteriorDraws_List] := Module[
  1661	  {processedDir, figDir, particlesFile, posteriorFile, diagFile, quantFile, ppcFile,
  1662	   ppc, quantiles, paramFig, ppcFig, diag},
  1663	  processedDir = FileNameJoin[{root, "data", "processed"}];
  1664	  figDir = FileNameJoin[{root, "figures", "generated"}];
  1665	  particlesFile = FileNameJoin[{processedDir, "smc_particles.csv"}];
  1666	  posteriorFile = FileNameJoin[{processedDir, "abc_posterior.csv"}];
  1667	  diagFile = FileNameJoin[{processedDir, "smc_diagnostics.csv"}];
  1668	  quantFile = FileNameJoin[{processedDir, "posterior_parameter_quantiles.csv"}];
  1669	  ppcFile = FileNameJoin[{processedDir, "posterior_predictive_regional.csv"}];
  1670	  ExportRows[particlesFile,
  1671	    MapThread[Append[#1, "Weight" -> #2] &, {smc["Particles"], smc["Weights"]}]];
  1672	  ExportRows[posteriorFile, posteriorDraws];
  1673	  diag = Table[
  1674	    <|"Generation" -> k,
  1675	      "Epsilon" -> smc["EpsilonHistory"][[k]],
  1676	      "AcceptanceRate" -> smc["AcceptanceHistory"][[k]],
  1677	      "ESS" -> If[k <= Length[smc["ESSHistory"]], smc["ESSHistory"][[k]], Missing["NotAvailable"]]|>,
  1678	    {k, Length[smc["EpsilonHistory"]]}
  1679	  ];
  1680	  ExportRows[diagFile, diag];
  1681	  quantiles = PosteriorParameterQuantiles[smc];
  1682	  ExportRows[quantFile, quantiles];
  1683	  ppc = PosteriorPredictiveRegional[posteriorDraws, grid, smc["ObservedSummaries"]];
  1684	  ExportRows[ppcFile, ppc];
  1685	  paramFig = FileNameJoin[{figDir, "abc_parameter_posteriors.png"}];
  1686	  Export[paramFig, PosteriorPriorFigure[smc], ImageResolution -> 160];
  1687	  ppcFig = FileNameJoin[{figDir, "posterior_predictive_regional.png"}];
  1688	  Export[ppcFig, PosteriorPredictiveFigure[ppc], ImageResolution -> 160];
  1689	  <|"ParticlesFile" -> particlesFile, "PosteriorFile" -> posteriorFile,
  1690	    "DiagnosticsFile" -> diagFile, "QuantilesFile" -> quantFile,
  1691	    "PosteriorPredictiveFile" -> ppcFile, "ParameterFigure" -> paramFig,
  1692	    "PosteriorPredictiveFigure" -> ppcFig, "PosteriorPredictive" -> ppc|>
  1693	];
  1694	
  1695	(* --- validation layers --- *)
  1696	
  1697	Options[RunSMCCrossValidation] = {
  1698	  "Particles" -> 150, "Generations" -> 4, "Seed" -> 260831, "PosteriorDraws" -> 60
  1699	};
  1700	
  1701	RunSMCCrossValidation[samples_List, grid_List, OptionsPattern[]] := Module[
  1702	  {obsAll, rows},
  1703	  obsAll = ObservedSummaries[samples];
  1704	  rows = Table[
  1705	    Module[{trainSamples, heldObs, smc, draws, ppc, diffs, covered},
  1706	      trainSamples = Select[samples, #["Region"] =!= held &];
  1707	      heldObs = Select[obsAll, #Region === held &];
  1708	      smc = RunSMCABC[trainSamples, grid,
  1709	        "Particles" -> OptionValue["Particles"],
  1710	        "Generations" -> OptionValue["Generations"],
  1711	        "Seed" -> OptionValue["Seed"] + StringLength[held]];
  1712	      draws = ResamplePosterior[smc, OptionValue["PosteriorDraws"]];
  1713	      ppc = PosteriorPredictiveRegional[draws, grid, heldObs];
  1714	      diffs = ppc[[All, "ObservedFrequency"]] - ppc[[All, "PosteriorMedian"]];
  1715	      covered = Boole /@ ppc[[All, "Covered95"]];
  1716	      <|
  1717	        "HeldOutRegion" -> held,
  1718	        "HeldOutBins" -> Length[heldObs],
  1719	        "RMSE" -> If[diffs === {}, Missing["NoHeldOutBins"], Sqrt[Mean[diffs^2]]],
  1720	        "Coverage95" -> If[covered === {}, Missing["NoHeldOutBins"], N[Mean[covered]]],
  1721	        "FinalEpsilon" -> Last[smc["EpsilonHistory"]],
  1722	        "TotalSimulations" -> smc["TotalSimulations"]
  1723	      |>
  1724	    ],
  1725	    {held, $AnalysisRegions}
  1726	  ];
  1727	  rows
  1728	];
  1729	
  1730	Options[RunTimeSliceValidation] = {
  1731	  "CutBP" -> 2500, "Particles" -> 150, "Generations" -> 4, "Seed" -> 311226, "PosteriorDraws" -> 60
  1732	};
  1733	
  1734	RunTimeSliceValidation[samples_List, grid_List, OptionsPattern[]] := Module[
  1735	  {cut, trainSamples, obsAll, heldObs, smc, draws, ppc, diffs, covered},
  1736	  cut = OptionValue["CutBP"];
  1737	  trainSamples = Select[samples, NumericValueQ[#["MeanDateBP"]] && #["MeanDateBP"] > cut &];
  1738	  obsAll = ObservedSummaries[samples];
  1739	  heldObs = Select[obsAll, #TimeBinMidBP <= cut &];
  1740	  smc = RunSMCABC[trainSamples, grid,
  1741	    "Particles" -> OptionValue["Particles"],
  1742	    "Generations" -> OptionValue["Generations"],
  1743	    "Seed" -> OptionValue["Seed"]];
  1744	  draws = ResamplePosterior[smc, OptionValue["PosteriorDraws"]];
  1745	  ppc = PosteriorPredictiveRegional[draws, grid, heldObs];
  1746	  diffs = ppc[[All, "ObservedFrequency"]] - ppc[[All, "PosteriorMedian"]];
  1747	  covered = Boole /@ ppc[[All, "Covered95"]];
  1748	  <|
  1749	    "CutBP" -> cut,
  1750	    "HeldOutBins" -> Length[heldObs],
  1751	    "TrainingSamples" -> Length[trainSamples],
  1752	    "RMSE" -> If[diffs === {}, Missing["NoHeldOutBins"], Sqrt[Mean[diffs^2]]],
  1753	    "Coverage95" -> If[covered === {}, Missing["NoHeldOutBins"], N[Mean[covered]]],
  1754	    "PosteriorPredictive" -> ppc,
  1755	    "TotalSimulations" -> smc["TotalSimulations"]
  1756	  |>
  1757	];
  1758	
  1759	(* --- prior and dairying-onset sensitivity analysis --- *)
  1760	
  1761	ModifiedPriorSpec[changes_Association] := Join[$PriorSpec, changes];
  1762	
  1763	$SensitivityScenarios = <|
  1764	  "Baseline" -> <|"PriorChanges" -> <||>, "OnsetShiftYears" -> 0|>,
  1765	  "NarrowSelection" -> <|
  1766	    "PriorChanges" -> <|"SelectionBase" -> {0.0, 0.008}, "SelectionDairying" -> {0.0, 0.03}|>,
  1767	    "OnsetShiftYears" -> 0|>,
  1768	  "WideMigration" -> <|"PriorChanges" -> <|"Migration" -> {0.0, 0.03}|>, "OnsetShiftYears" -> 0|>,
  1769	  "EarlierDairying" -> <|"PriorChanges" -> <||>, "OnsetShiftYears" -> -400|>,
  1770	  "LaterDairying" -> <|"PriorChanges" -> <||>, "OnsetShiftYears" -> 400|>
  1771	|>;
  1772	
  1773	Options[RunSensitivityAnalysis] = {"Particles" -> 150, "Generations" -> 4, "Seed" -> 90210};
  1774	
  1775	RunSensitivityAnalysis[samples_List, OptionsPattern[]] := Module[{rows},
  1776	  rows = Flatten@Table[
  1777	    Module[{scenario, spec, scenarioGrid, smc, quantiles},
  1778	      scenario = $SensitivityScenarios[name];
  1779	      spec = ModifiedPriorSpec[scenario["PriorChanges"]];
  1780	      scenarioGrid = BuildEuropeGrid[4, scenario["OnsetShiftYears"]];
  1781	      smc = RunSMCABC[samples, scenarioGrid,
  1782	        "Particles" -> OptionValue["Particles"],
  1783	        "Generations" -> OptionValue["Generations"],
  1784	        "Seed" -> OptionValue["Seed"] + StringLength[name],
  1785	        "PriorSpec" -> spec];
  1786	      quantiles = PosteriorParameterQuantiles[smc,
  1787	        {{"Lower95", 0.025}, {"Median", 0.5}, {"Upper95", 0.975}}];
  1788	      Map[
  1789	        Join[<|"Scenario" -> name|>, #] &,
  1790	        Select[quantiles,
  1791	          MemberQ[{"Log10InitialFrequency", "SelectionBase", "SelectionDairying", "Migration"},
  1792	            #["Parameter"]] &]
  1793	      ]
  1794	    ],
  1795	    {name, Keys[$SensitivityScenarios]}
  1796	  ];
  1797	  rows
  1798	];
  1799	
  1800	SensitivityFigure[rows_List] := Module[

exec
/bin/zsh -lc "nl -ba src/LactasePersistenceSpatial.wl | sed -n '1801,2296p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
  1801	  {params = {"SelectionBase", "SelectionDairying", "Migration"}, scenarios, panels},
  1802	  scenarios = DeleteDuplicates[rows[[All, "Scenario"]]];
  1803	  panels = Table[
  1804	    Module[{sub, xmax, xticks},
  1805	      sub = Select[rows, #["Parameter"] === p &];
  1806	      xmax = Max[sub[[All, "Upper95"]]];
  1807	      xticks = N[FindDivisions[{0, 1.05 xmax}, 4]];
  1808	      Graphics[
  1809	        Table[
  1810	          Module[{row},
  1811	            row = SelectFirst[sub, #["Scenario"] === scenarios[[k]] &, Missing["NotFound"]];
  1812	            If[MissingQ[row], {},
  1813	              {Directive[$PosteriorColor, AbsoluteThickness[2.2]],
  1814	               Line[{{row["Lower95"], k}, {row["Upper95"], k}}],
  1815	               PointSize[0.025], Point[{row["Median"], k}]}
  1816	            ]
  1817	          ],
  1818	          {k, Length[scenarios]}
  1819	        ],
  1820	        Frame -> True, Axes -> False,
  1821	        FrameTicks -> {{Table[{k, scenarios[[k]]}, {k, Length[scenarios]}], None}, {xticks, None}},
  1822	        PlotLabel -> Style[p, 11],
  1823	        PlotRange -> {{-0.02 xmax, 1.1 xmax}, {0.4, Length[scenarios] + 0.6}},
  1824	        LabelStyle -> Directive[Black, 9.5],
  1825	        ImageSize -> 400,
  1826	        AspectRatio -> 0.75
  1827	      ]
  1828	    ],
  1829	    {p, params}
  1830	  ];
  1831	  GraphicsRow[panels, Spacings -> 0.4]
  1832	];
  1833	
  1834	ExportSensitivityOutputs[root_String, rows_List] := Module[{file, fig},
  1835	  file = FileNameJoin[{root, "data", "processed", "sensitivity_posterior_quantiles.csv"}];
  1836	  ExportRows[file, rows];
  1837	  fig = FileNameJoin[{root, "figures", "generated", "sensitivity_intervals.png"}];
  1838	  Export[fig, SensitivityFigure[rows], ImageResolution -> 160];
  1839	  <|"SensitivityFile" -> file, "SensitivityFigure" -> fig|>
  1840	];
  1841	
  1842	
  1843	(* ------------------------------------------------------------------ *)
  1844	(* Cinematic hero animation: single-panel posterior time-lapse with   *)
  1845	(* year badge, progress bar, sample dots, and an uncertainty inset.   *)
  1846	(* All frames are pure raster composition over one cached base map,   *)
  1847	(* so 80+ frames render in seconds.                                   *)
  1848	(* ------------------------------------------------------------------ *)
  1849	
  1850	$UncertaintyColorFunction = (Blend[
  1851	   {RGBColor[0.98, 0.98, 0.98], RGBColor[1.0, 0.88, 0.18],
  1852	    RGBColor[1.0, 0.42, 0.04], RGBColor[0.70, 0.0, 0.70]}, #] &);
  1853	
  1854	FormatYearLabel[bp_?NumericQ] := Module[{yr = Round[1950 - bp]},
  1855	  If[yr < 0, ToString[-yr] <> " BC", "AD " <> ToString[Max[yr, 1]]]
  1856	];
  1857	
  1858	AugmentedCellStats[posterior_List, grid_List, knotTimes_List] := Module[{raw},
  1859	  raw = PosteriorCellStats[posterior, grid, knotTimes];
  1860	  Association @ Table[
  1861	    t -> <|
  1862	      "Mean" -> raw[t]["Mean"],
  1863	      "Width" -> raw[t]["Upper95"] - raw[t]["Lower95"]
  1864	    |>,
  1865	    {t, knotTimes}
  1866	  ]
  1867	];
  1868	
  1869	InterpolatedCellStat[stats_Association, knotTimes_List, t_?NumericQ, prop_String] := Module[
  1870	  {pos, t1, t2, w},
  1871	  If[t >= First[knotTimes], Return[stats[First[knotTimes]][prop]]];
  1872	  If[t <= Last[knotTimes], Return[stats[Last[knotTimes]][prop]]];
  1873	  pos = LengthWhile[knotTimes, # > t &];
  1874	  t1 = knotTimes[[pos]]; t2 = knotTimes[[pos + 1]];
  1875	  w = (t1 - t)/(t1 - t2);
  1876	  (1 - w) stats[t1][prop] + w stats[t2][prop]
  1877	];
  1878	
  1879	YearBadge[t_?NumericQ, widthPx_Integer] := Rasterize[
  1880	  Framed[
  1881	    Style[FormatYearLabel[t], White, Bold, FontSize -> 34, FontFamily -> "Helvetica"],
  1882	    Background -> GrayLevel[0.1, 0.62], RoundingRadius -> 8,
  1883	    FrameStyle -> None, FrameMargins -> {{16, 16}, {8, 8}}],
  1884	  "Image", Background -> None];
  1885	
  1886	CaptionStrip[text_String] := Rasterize[
  1887	  Framed[
  1888	    Style[text, White, FontSize -> 15, FontFamily -> "Helvetica"],
  1889	    Background -> GrayLevel[0.1, 0.55], RoundingRadius -> 6,
  1890	    FrameStyle -> None, FrameMargins -> {{10, 10}, {5, 5}}],
  1891	  "Image", Background -> None];
  1892	
  1893	ProgressBarImage[fraction_?NumericQ, width_Integer, barHeight_Integer: 8] := Module[
  1894	  {filled = Clip[Round[fraction width], {1, width}], row},
  1895	  row = Join[
  1896	    ConstantArray[{0.20, 0.45, 0.72}, filled],
  1897	    ConstantArray[{0.82, 0.84, 0.86}, width - filled]
  1898	  ];
  1899	  Image[ConstantArray[row, barHeight]]
  1900	];
  1901	
  1902	HeroFrame[t_?NumericQ, stats_Association, knotTimes_List, support_Association,
  1903	  samples_List, w_Integer, h_Integer] := Module[
  1904	  {means, widths, base, overlay, composed, pts, inset, badge, caption, bar},
  1905	  means = InterpolatedCellStat[stats, knotTimes, t, "Mean"];
  1906	  widths = InterpolatedCellStat[stats, knotTimes, t, "Width"];
  1907	  base = BaseMapRaster[w];
  1908	  overlay = FieldOverlayImage[support, means, (ColorData["TemperatureMap"][#] &), {0, 0.5}, 0.92, w, h];
  1909	  composed = ImageCompose[base, overlay];
  1910	  pts = SamplePointsRaster[SamplesInWindow[samples, t, 400], w, h];
  1911	  If[ImageQ[pts], composed = ImageCompose[composed, pts]];
  1912	  inset = ImagePad[
  1913	    ImageResize[
  1914	      ImageCompose[base,
  1915	        FieldOverlayImage[support, widths, $UncertaintyColorFunction, {0, 1}, 0.92, w, h]],
  1916	      Round[0.28 w]],
  1917	    3, White];
  1918	  composed = ImageCompose[composed, inset,
  1919	    {w - ImageDimensions[inset][[1]]/2 - 14, ImageDimensions[inset][[2]]/2 + 26}];
  1920	  caption = CaptionStrip["95% credible-interval width"];
  1921	  composed = ImageCompose[composed, caption,
  1922	    {w - ImageDimensions[caption][[1]]/2 - 20,
  1923	     ImageDimensions[inset][[2]] + ImageDimensions[caption][[2]]/2 + 34}];
  1924	  badge = YearBadge[t, Round[0.19 w]];
  1925	  composed = ImageCompose[composed, badge,
  1926	    {ImageDimensions[badge][[1]]/2 + 20, h - ImageDimensions[badge][[2]]/2 - 18}];
  1927	  composed = RemoveAlphaChannel[composed, White];
  1928	  bar = ProgressBarImage[(8000. - t)/8000., w];
  1929	  ImageCompose[composed, bar, {w/2, 8}]
  1930	];
  1931	
  1932	Options[ExportHeroAnimation] = {
  1933	  "StartBP" -> 8000, "FrameStepYears" -> 100, "Width" -> 1280,
  1934	  "SecondsPerFrame" -> 0.12, "HoldFrames" -> 10
  1935	};
  1936	
  1937	ExportHeroAnimation[root_String, samples_List, grid_List, posterior_List, OptionsPattern[]] := Module[
  1938	  {figDir, knotTimes, stats, support, frameTimes, w, h, frames, gifFrames,
  1939	   mp4File, gifFile, iCloudMP4, iCloudGIF, spf, hold},
  1940	  figDir = FileNameJoin[{root, "figures", "generated"}];
  1941	  w = OptionValue["Width"]; h = Round[w $MapAspect];
  1942	  spf = OptionValue["SecondsPerFrame"];
  1943	  hold = OptionValue["HoldFrames"];
  1944	  knotTimes = Range[OptionValue["StartBP"], 0, -250];
  1945	  stats = AugmentedCellStats[posterior, grid, knotTimes];
  1946	  support = KrigingSurfaceSupport[grid];
  1947	  frameTimes = Range[OptionValue["StartBP"], 0, -OptionValue["FrameStepYears"]];
  1948	  frames = Table[HeroFrame[t, stats, knotTimes, support, samples, w, h], {t, frameTimes}];
  1949	  frames = Join[frames, ConstantArray[Last[frames], hold]];
  1950	  mp4File = FileNameJoin[{figDir, "hero_lactase_persistence.mp4"}];
  1951	  ExportMP4FromFrames[mp4File, frames, spf];
  1952	  gifFrames = ImageResize[#, 720] & /@ frames[[1 ;; ;; 2]];
  1953	  gifFile = FileNameJoin[{figDir, "hero_lactase_persistence.gif"}];
  1954	  Export[gifFile, gifFrames, "DisplayDurations" -> 2 spf, AnimationRepetitions -> Infinity];
  1955	  iCloudMP4 = CopyVersionToICloud[mp4File, "hero_lactase_persistence"];
  1956	  iCloudGIF = CopyVersionToICloud[gifFile, "hero_lactase_persistence"];
  1957	  <|"HeroMP4" -> mp4File, "HeroGIF" -> gifFile,
  1958	    "ICloudHeroMP4" -> iCloudMP4, "ICloudHeroGIF" -> iCloudGIF|>
  1959	];
  1960	
  1961	(* --- reconstruct a stored SMC result so notebooks evaluate fast --- *)
  1962	
  1963	LoadOrRunSMCABC[root_String, samples_List, grid_List, opts___] := Module[
  1964	  {particlesFile, diagFile, rows, diag, spec, keys, vectors, weights, particles, obsData},
  1965	  particlesFile = FileNameJoin[{root, "data", "processed", "smc_particles.csv"}];
  1966	  diagFile = FileNameJoin[{root, "data", "processed", "smc_diagnostics.csv"}];
  1967	  If[! (FileExistsQ[particlesFile] && FileExistsQ[diagFile]),
  1968	    Return[RunSMCABC[samples, grid, opts]]
  1969	  ];
  1970	  rows = Map[Association, Normal[Import[particlesFile, "Dataset", HeaderLines -> 1]]];
  1971	  diag = Map[Association, Normal[Import[diagFile, "Dataset", HeaderLines -> 1]]];
  1972	  spec = $PriorSpec;
  1973	  keys = Keys[spec];
  1974	  vectors = Map[
  1975	    Function[row,
  1976	      Table[
  1977	        If[k === "Log10InitialFrequency", Log10[row["InitialFrequency"]], row[k]],
  1978	        {k, keys}
  1979	      ]
  1980	    ],
  1981	    rows
  1982	  ];
  1983	  weights = Normalize[rows[[All, "Weight"]], Total];
  1984	  particles = KeyDrop[#, "Weight"] & /@ rows;
  1985	  obsData = ExtendedObservedData[samples, grid];
  1986	  <|
  1987	    "ParticleVectors" -> vectors,
  1988	    "Particles" -> particles,
  1989	    "Weights" -> weights,
  1990	    "ParameterKeys" -> keys,
  1991	    "EpsilonHistory" -> diag[[All, "Epsilon"]],
  1992	    "AcceptanceHistory" -> diag[[All, "AcceptanceRate"]],
  1993	    "ESSHistory" -> DeleteMissing[diag[[All, "ESS"]]],
  1994	    "TotalSimulations" -> Missing["LoadedFromDisk"],
  1995	    "GenerationShortfall" -> False,
  1996	    "ObservedSummaries" -> obsData["Binned"],
  1997	    "PriorSpecUsed" -> spec
  1998	  |>
  1999	];
  2000	
  2001	
  2002	(* --- self-contained interactive explorers for the Community notebook --- *)
  2003	
  2004	LogisticExplorer[samples_List] := Module[{binned, dataAssoc},
  2005	  binned = Select[RegionalBinnedFrequencies[samples],
  2006	    MemberQ[$AnalysisRegions, #Region] && #CalledAlleles >= 2 &];
  2007	  dataAssoc = Association @ Table[
  2008	    r -> Map[
  2009	      Join[{#TimeBinMidBP, #Frequency}, WilsonInterval[#DerivedAlleles, #CalledAlleles], {#CalledAlleles}] &,
  2010	      Select[binned, #Region == r &]],
  2011	    {r, $AnalysisRegions}];
  2012	  With[{data = dataAssoc, regions = $AnalysisRegions, colors = $RegionColors},
  2013	    Manipulate[
  2014	      Module[{pts = data[region], color = Lookup[colors, region, Black]},
  2015	        Show[
  2016	          Graphics[{
  2017	            {color, Opacity[0.5], AbsoluteThickness[1.4],
  2018	             Line[{{#[[1]], #[[3]]}, {#[[1]], #[[4]]}}] & /@ pts},
  2019	            {color, Opacity[0.95],
  2020	             Table[{PointSize[0.008 + 0.010 Sqrt[p[[5]]/250.]],
  2021	               Point[{p[[1]], p[[2]]}]}, {p, pts}]}
  2022	          }],
  2023	          Plot[1/(1 + Exp[-(alpha + beta (10000 - bp)/1000)]), {bp, 0, 10000},
  2024	            PlotStyle -> Directive[GrayLevel[0.2], AbsoluteThickness[1.8]]],
  2025	          Frame -> True, Axes -> False, AspectRatio -> 1/GoldenRatio,
  2026	          PlotRange -> {{0, 10000}, {-0.03, 1.02}},
  2027	          FrameLabel -> {"years BP", "derived-allele frequency"},
  2028	          PlotLabel -> Style["implied selection per generation \[TildeTilde] " <>
  2029	            ToString[NumberForm[beta 28/1000., {4, 3}]], 11.5],
  2030	          ImageSize -> 560, LabelStyle -> Directive[Black, 11]
  2031	        ]
  2032	      ],
  2033	      {{alpha, -9.5, "\[Alpha]"}, -16., 0.},
  2034	      {{beta, 0.9, "\[Beta] per kyr"}, 0., 2.5},
  2035	      {{region, "Mediterranean", "region"}, regions},
  2036	      SaveDefinitions -> False
  2037	    ]
  2038	  ]
  2039	];
  2040	
  2041	DairyingCovariateExplorer[] := Manipulate[
  2042	  Plot[1/(1 + Exp[(t - onset)/scale]), {t, 0, 10000},
  2043	    PlotStyle -> Directive[RGBColor[0.153, 0.51, 0.64], AbsoluteThickness[2]],
  2044	    Frame -> True, Axes -> False,
  2045	    PlotRange -> {{0, 10000}, {-0.03, 1.03}},
  2046	    ScalingFunctions -> {"Reverse", None},
  2047	    FrameLabel -> {"years BP", "dairying covariate D(t)"},
  2048	    Epilog -> {GrayLevel[0.5], Dashed, Line[{{onset, -0.03}, {onset, 1.03}}],
  2049	      Text[Style["onset", 10, GrayLevel[0.35]], {onset, 0.95}]},
  2050	    ImageSize -> 520, LabelStyle -> Directive[Black, 11]],
  2051	  {{onset, 7600., "regional onset BP"}, 5000., 9000.},
  2052	  {{scale, 350., "smoothing scale (years)"}, 100., 900.},
  2053	  SaveDefinitions -> False
  2054	];
  2055	
  2056	SpatialTimeExplorer[samples_List, grid_List, posterior_List, times_List: {}] := Module[
  2057	  {ts, support, stats, frames},
  2058	  ts = If[times === {}, Range[8000, 0, -1000], times];
  2059	  support = KrigingSurfaceSupport[grid];
  2060	  stats = PosteriorCellStats[posterior, grid, ts];
  2061	  frames = Table[
  2062	    Module[{w = 760, h, base, overlay, pts, composed},
  2063	      h = Round[w $MapAspect];
  2064	      base = BaseMapRaster[w];
  2065	      overlay = FieldOverlayImage[support, stats[t]["Mean"],
  2066	        (ColorData["TemperatureMap"][#] &), {0, 0.5}, 0.92, w, h];
  2067	      composed = ImageCompose[base, overlay];
  2068	      pts = SamplePointsRaster[SamplesInWindow[samples, t, 400], w, h];
  2069	      If[ImageQ[pts], composed = ImageCompose[composed, pts]];
  2070	      ImageResize[composed, 560]
  2071	    ],
  2072	    {t, ts}];
  2073	  With[{fr = frames, labels = (ToString[#] <> " years BP" &) /@ ts},
  2074	    Manipulate[
  2075	      Labeled[fr[[k]], Style[labels[[k]], Bold, 13], Top],
  2076	      {{k, 1, "time step"}, 1, Length[fr], 1},
  2077	      SaveDefinitions -> False
  2078	    ]
  2079	  ]
  2080	];
  2081	
  2082	
  2083	(* ------------------------------------------------------------------ *)
  2084	(* Point-source origin model: where and when did the allele start?    *)
  2085	(* ------------------------------------------------------------------ *)
  2086	
  2087	$OriginDairyingLeadYears = 800.;
  2088	
  2089	$OriginPriorSpec = <|
  2090	  "OriginLatitude" -> {36., 62.},
  2091	  "OriginLongitude" -> {-10., 34.},
  2092	  "OriginTimeBP" -> {6800., 9600.},
  2093	  "Log10InjectFrequency" -> {-3., -1.},
  2094	  "SelectionBase" -> {0.0, 0.015},
  2095	  "SelectionDairying" -> {0.0, 0.06},
  2096	  "Migration" -> {0.02, 0.6},
  2097	  "SelectionMultiplierBritishIsles" -> {0.8, 2.2},
  2098	  "SelectionMultiplierRhineDanube" -> {0.6, 1.8},
  2099	  "SelectionMultiplierMediterranean" -> {0.4, 1.4},
  2100	  "SelectionMultiplierBaltic" -> {0.8, 2.4}
  2101	|>;
  2102	
  2103	Options[RunOriginSMCABC] = {"Particles" -> 800, "Generations" -> 6, "Seed" -> 19470}; 
  2104	
  2105	RunOriginSMCABC[samples_List, grid_List, OptionsPattern[]] := RunSMCABC[
  2106	  samples, grid,
  2107	  "Particles" -> OptionValue["Particles"],
  2108	  "Generations" -> OptionValue["Generations"],
  2109	  "Seed" -> OptionValue["Seed"],
  2110	  "PriorSpec" -> $OriginPriorSpec
  2111	];
  2112	
  2113	LoadOrRunOriginSMCABC[root_String, samples_List, grid_List, opts___] := Module[
  2114	  {particlesFile, diagFile, rows, diag, spec, keys, vectors, weights, particles, obsData, smc},
  2115	  particlesFile = FileNameJoin[{root, "data", "processed", "origin_smc_particles.csv"}];
  2116	  diagFile = FileNameJoin[{root, "data", "processed", "origin_smc_diagnostics.csv"}];
  2117	  If[! (FileExistsQ[particlesFile] && FileExistsQ[diagFile]),
  2118	    smc = RunOriginSMCABC[samples, grid, opts];
  2119	    ExportRows[particlesFile,
  2120	      MapThread[Append[#1, "Weight" -> #2] &, {smc["Particles"], smc["Weights"]}]];
  2121	    ExportRows[diagFile,
  2122	      Table[<|"Generation" -> k, "Epsilon" -> smc["EpsilonHistory"][[k]],
  2123	        "AcceptanceRate" -> smc["AcceptanceHistory"][[k]],
  2124	        "ESS" -> If[k <= Length[smc["ESSHistory"]], smc["ESSHistory"][[k]], Missing["NotAvailable"]]|>,
  2125	        {k, Length[smc["EpsilonHistory"]]}]];
  2126	    Return[smc]
  2127	  ];
  2128	  rows = Map[Association, Normal[Import[particlesFile, "Dataset", HeaderLines -> 1]]];
  2129	  diag = Map[Association, Normal[Import[diagFile, "Dataset", HeaderLines -> 1]]];
  2130	  spec = $OriginPriorSpec;
  2131	  keys = Keys[spec];
  2132	  vectors = Map[
  2133	    Function[row,
  2134	      Table[
  2135	        If[StringStartsQ[k, "Log10"], Log10[row[StringDrop[k, 5]]], row[k]],
  2136	        {k, keys}
  2137	      ]
  2138	    ],
  2139	    rows
  2140	  ];
  2141	  weights = Normalize[rows[[All, "Weight"]], Total];
  2142	  particles = KeyDrop[#, "Weight"] & /@ rows;
  2143	  obsData = ExtendedObservedData[samples, grid];
  2144	  <|
  2145	    "ParticleVectors" -> vectors, "Particles" -> particles, "Weights" -> weights,
  2146	    "ParameterKeys" -> keys,
  2147	    "EpsilonHistory" -> diag[[All, "Epsilon"]],
  2148	    "AcceptanceHistory" -> diag[[All, "AcceptanceRate"]],
  2149	    "ESSHistory" -> DeleteMissing[diag[[All, "ESS"]]],
  2150	    "TotalSimulations" -> Missing["LoadedFromDisk"],
  2151	    "GenerationShortfall" -> False,
  2152	    "ObservedSummaries" -> obsData["Binned"],
  2153	    "PriorSpecUsed" -> spec
  2154	  |>
  2155	];
  2156	
  2157	(* Itan-style origin posterior density map: weighted kernel density of the
  2158	   posterior (origin longitude, latitude), rendered on the land-masked map
  2159	   with the weighted-median origin starred. *)
  2160	
  2161	OriginPosteriorMode[smc_Association] := Module[
  2162	  {draws, pts, dist, latC, lonC, matrix, argmax},
  2163	  draws = ResamplePosterior[smc, 400];
  2164	  pts = {#["OriginLongitude"], #["OriginLatitude"]} & /@ draws;
  2165	  dist = SmoothKernelDistribution[pts, {2.6, 2.0}];
  2166	  latC = Table[la, {la, $EuropeGeoRange[[1, 2]] - 0.25, $EuropeGeoRange[[1, 1]] + 0.25, -0.5}];
  2167	  lonC = Table[lo, {lo, $EuropeGeoRange[[2, 1]] + 0.25, $EuropeGeoRange[[2, 2]] - 0.25, 0.5}];
  2168	  matrix = Table[PDF[dist, {lo, la}], {la, latC}, {lo, lonC}];
  2169	  argmax = First @ Position[matrix, Max[matrix]];
  2170	  {latC[[argmax[[1]]]], lonC[[argmax[[2]]]]}
  2171	];
  2172	
  2173	OriginDensityMap[smc_Association, opts___] := Module[
  2174	  {draws, pts, dist, w, h, latC, lonC, matrix, maxd, colored, img, maskImg,
  2175	   overlay, base, medLat, medLon, starImg, composed},
  2176	  draws = ResamplePosterior[smc, 400];
  2177	  pts = {#["OriginLongitude"], #["OriginLatitude"]} & /@ draws;
  2178	  dist = SmoothKernelDistribution[pts, {2.6, 2.0}];
  2179	  w = $MapPixelWidth; h = Round[w $MapAspect];
  2180	  latC = Table[la, {la, $EuropeGeoRange[[1, 2]] - 0.25, $EuropeGeoRange[[1, 1]] + 0.25, -0.5}];
  2181	  lonC = Table[lo, {lo, $EuropeGeoRange[[2, 1]] + 0.25, $EuropeGeoRange[[2, 2]] - 0.25, 0.5}];
  2182	  matrix = Table[PDF[dist, {lo, la}], {la, latC}, {lo, lonC}];
  2183	  maxd = Max[matrix];
  2184	  colored = Map[
  2185	    List @@ ColorConvert[
  2186	      Blend[{RGBColor[1, 1, 1], RGBColor[1.0, 0.85, 0.2], RGBColor[0.95, 0.45, 0.05],
  2187	        RGBColor[0.75, 0.05, 0.05]}, Clip[#/maxd, {0, 1}]^0.7], "RGB"] &,
  2188	    matrix, {2}];
  2189	  img = ImageResize[Image[colored], {w, h}];
  2190	  maskImg = LandMaskImage[w, h];
  2191	  overlay = SetAlphaChannel[img,
  2192	    ImageMultiply[maskImg,
  2193	      ImageResize[Image[Map[0.85 Clip[#/maxd, {0, 1}]^0.5 &, matrix, {2}]], {w, h}]]];
  2194	  base = BaseMapRaster[w];
  2195	  composed = ImageCompose[base, overlay];
  2196	  (* star the joint posterior mode (KDE argmax): for a broad, multimodal
  2197	     2D posterior the coordinate-wise medians can land between modes,
  2198	     which misleads as a location estimate *)
  2199	  With[{argmax = First @ Position[matrix, Max[matrix]]},
  2200	    medLat = latC[[argmax[[1]]]]; medLon = lonC[[argmax[[2]]]]];
  2201	  starImg = Rasterize[
  2202	    Graphics[{EdgeForm[Directive[Black, AbsoluteThickness[1.2]]], White,
  2203	      Polygon[Table[(1 - 0.6 Mod[k, 2]) {Sin[k Pi/5], Cos[k Pi/5]}, {k, 0, 9}]]},
  2204	      Background -> None, ImageSize -> 34], "Image", Background -> None];
  2205	  composed = ImageCompose[composed, starImg,
  2206	    {(medLon - $EuropeGeoRange[[2, 1]])/($EuropeGeoRange[[2, 2]] - $EuropeGeoRange[[2, 1]]) w,
  2207	     (medLat - $EuropeGeoRange[[1, 1]])/($EuropeGeoRange[[1, 2]] - $EuropeGeoRange[[1, 1]]) h}];
  2208	  Framed[
  2209	    Labeled[Image[composed, ImageSize -> 640],
  2210	      Style["Posterior density of the allele's origin (star: posterior mode)", 13, Bold, Black], Top],
  2211	    Background -> White, FrameStyle -> None, FrameMargins -> 4]
  2212	];
  2213	
  2214	(* Spread video from the fitted origin: posterior-mean field over origin
  2215	   draws, hero-style frames with the median origin starred. *)
  2216	
  2217	ExportOriginSpread[root_String, samples_List, grid_List, smc_Association, OptionsPattern[]] := Module[
  2218	  {figDir, draws, knotTimes, stats, support, frameTimes, w, h, frames,
  2219	   medLat, medLon, starImg, gifFrames, mp4File, gifFile, iCloudMP4, iCloudGIF, startBP},
  2220	  figDir = FileNameJoin[{root, "figures", "generated"}];
  2221	  draws = ResamplePosterior[smc, 100];
  2222	  startBP = 9600;
  2223	  knotTimes = Range[startBP, 0, -200];
  2224	  stats = AugmentedCellStats[draws, grid, knotTimes];
  2225	  support = KrigingSurfaceSupport[grid];
  2226	  w = 1280; h = Round[w $MapAspect];
  2227	  {medLat, medLon} = OriginPosteriorMode[smc];
  2228	  starImg = Rasterize[
  2229	    Graphics[{EdgeForm[Directive[Black, AbsoluteThickness[1.4]]], White,
  2230	      Polygon[Table[(1 - 0.6 Mod[k, 2]) {Sin[k Pi/5], Cos[k Pi/5]}, {k, 0, 9}]]},
  2231	      Background -> None, ImageSize -> 40], "Image", Background -> None];
  2232	  frameTimes = Range[startBP, 0, -100];
  2233	  frames = Table[
  2234	    Module[{fr = HeroFrame[t, stats, knotTimes, support, samples, w, h]},
  2235	      ImageCompose[fr, starImg,
  2236	        {(medLon - $EuropeGeoRange[[2, 1]])/($EuropeGeoRange[[2, 2]] - $EuropeGeoRange[[2, 1]]) w,
  2237	         (medLat - $EuropeGeoRange[[1, 1]])/($EuropeGeoRange[[1, 2]] - $EuropeGeoRange[[1, 1]]) h}]
  2238	    ],
  2239	    {t, frameTimes}];
  2240	  frames = Join[frames, ConstantArray[Last[frames], 10]];
  2241	  mp4File = FileNameJoin[{figDir, "origin_spread.mp4"}];
  2242	  ExportMP4FromFrames[mp4File, frames, 0.11];
  2243	  gifFrames = ImageResize[#, 720] & /@ frames[[1 ;; ;; 2]];
  2244	  gifFile = FileNameJoin[{figDir, "origin_spread.gif"}];
  2245	  Export[gifFile, gifFrames, "DisplayDurations" -> 0.22, AnimationRepetitions -> Infinity];
  2246	  iCloudMP4 = CopyVersionToICloud[mp4File, "origin_spread"];
  2247	  iCloudGIF = CopyVersionToICloud[gifFile, "origin_spread"];
  2248	  <|"OriginSpreadMP4" -> mp4File, "OriginSpreadGIF" -> gifFile,
  2249	    "ICloudOriginMP4" -> iCloudMP4, "ICloudOriginGIF" -> iCloudGIF|>
  2250	];
  2251	
  2252	
  2253	(* Conditional fit-quality scan: hold every non-origin parameter at its
  2254	   weighted posterior median, place the point source in each land cell in
  2255	   turn, and map the resulting ABC distance. This separates what the DATA
  2256	   prefer from what the prior geometry contributes. *)
  2257	
  2258	OriginFitSurface[samples_List, grid_List, smc_Association] := Module[
  2259	  {q, med, obsData, base, dists},
  2260	  q = PosteriorParameterQuantiles[smc];
  2261	  med[p_] := SelectFirst[q, #["Parameter"] === p &]["Median"];
  2262	  obsData = ExtendedObservedData[samples, grid];
  2263	  base = <|
  2264	    "OriginTimeBP" -> med["OriginTimeBP"],
  2265	    "InjectFrequency" -> 10^med["Log10InjectFrequency"],
  2266	    "SelectionBase" -> med["SelectionBase"],
  2267	    "SelectionDairying" -> med["SelectionDairying"],
  2268	    "Migration" -> med["Migration"],
  2269	    "SelectionMultiplierBritishIsles" -> med["SelectionMultiplierBritishIsles"],
  2270	    "SelectionMultiplierRhineDanube" -> med["SelectionMultiplierRhineDanube"],
  2271	    "SelectionMultiplierMediterranean" -> med["SelectionMultiplierMediterranean"],
  2272	    "SelectionMultiplierBaltic" -> med["SelectionMultiplierBaltic"]
  2273	  |>;
  2274	  dists = Table[
  2275	    ExtendedDistance[obsData,
  2276	      SimulateSpatialTrajectory[
  2277	        Join[base, <|"OriginLatitude" -> grid[[i, "Latitude"]],
  2278	          "OriginLongitude" -> grid[[i, "Longitude"]]|>], grid],
  2279	      grid],
  2280	    {i, Length[grid]}];
  2281	  dists
  2282	];
  2283	
  2284	OriginFitSurfaceMap[samples_List, grid_List, smc_Association] := Module[
  2285	  {dists, support, fitness},
  2286	  dists = OriginFitSurface[samples, grid, smc];
  2287	  support = KrigingSurfaceSupport[grid];
  2288	  fitness = Rescale[-dists];
  2289	  SpatialMap[grid, support, fitness, {},
  2290	    "Conditional fit quality by origin cell (yellow/red: best fit)",
  2291	    (ColorData["TemperatureMap"][#] &), 0.92, {0, 1}, "relative fit quality"]
  2292	];
  2293	
  2294	End[];
  2295	
  2296	EndPackage[];

codex
The first pass has exposed a central identifiability problem: the “spatial” ABC target is mostly four regional mean trajectories plus four pooled compass contrasts, not a sample-level spatial likelihood. I’m now checking whether the Community prose overstates what those summaries—and the very tight origin priors/constraints—can support.
Repository state is clean at commit 69bbe7c; memory supplied only a read-only audit protocol, not project facts.
  ✓ Inspect prior project-relevant memory and repository state
  → Read model, notebook builder, README, digitisation script, tests, and processed CSVs with line evidence
  • Recompute claimed quantities and test internal consistency
  • Rank all methodological, statistical, and code-level weaknesses with concrete fixes
exec
/bin/zsh -lc "nl -ba community/build_notebook.wls | sed -n '1,500p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	#!/usr/bin/env wolframscript
     2	(* ::Package:: *)
     3	
     4	(*  Build community/ancient_dna_lactase_persistence.nb
     5	    ---------------------------------------------------
     6	    Long-form, EVALUATED Wolfram Community notebook in the house
     7	    format (cf. the rivers-post reference and ENSO-emergence):
     8	
     9	      - private stylesheet: Roboto Condensed headings in the blue
    10	        RGBColor[0.153, 0.51, 0.64], numbered Section cells
    11	      - hero animation at the very top (AnimatedImage: plays inline
    12	        on the Community post page)
    13	      - every Input cell paired with its real evaluated Output
    14	        (graphics rasterized; tables as live boxes)
    15	      - all numbers in the prose computed from the pipeline outputs
    16	        at build time, so text and results cannot drift apart
    17	      - three interactive Manipulates with the data baked in, so
    18	        they work in any downloaded copy without evaluation
    19	      - gpt-image-2 educational illustrations, each preceded by an
    20	        explicit AI-disclosure cell
    21	
    22	    Prerequisites: scripts/run_pipeline.wls has been run (processed
    23	    CSVs + figures exist) and ExportHeroAnimation has been called.
    24	*)
    25	
    26	repoRoot = ParentDirectory @ DirectoryName[$InputFileName];
    27	figDir   = FileNameJoin[{repoRoot, "figures", "generated"}];
    28	genDir   = FileNameJoin[{repoRoot, "docs", "images", "figures-generated"}];
    29	outNb    = FileNameJoin[{repoRoot, "community", "ancient_dna_lactase_persistence.nb"}];
    30	outPdf   = FileNameJoin[{repoRoot, "community", "ancient_dna_lactase_persistence.pdf"}];
    31	
    32	Print["Loading package and pipeline outputs..."];
    33	Get[FileNameJoin[{repoRoot, "src", "LactasePersistenceSpatial.wl"}]];
    34	
    35	(* keep a copy of the package beside the notebook: on Wolfram Community the
    36	   reader downloads the .nb and the .wl into one folder, and the setup cell
    37	   below finds the package there. *)
    38	Quiet @ Check[
    39	  CopyFile[
    40	    FileNameJoin[{repoRoot, "src", "LactasePersistenceSpatial.wl"}],
    41	    FileNameJoin[{repoRoot, "community", "LactasePersistenceSpatial.wl"}],
    42	    OverwriteTarget -> True],
    43	  Null];
    44	
    45	SetDirectory[repoRoot];
    46	samples = LoadProcessedSamples[repoRoot];
    47	grid = BuildEuropeGrid[];
    48	smc = LoadOrRunSMCABC[repoRoot, samples, grid];
    49	draws = ResamplePosterior[smc, 100];
    50	fits = FitAllRegionalLogistics[samples];
    51	quantiles = PosteriorParameterQuantiles[smc];
    52	quantOf[p_] := SelectFirst[quantiles, #["Parameter"] === p &];
    53	cvRows = Map[Association, Normal[Import[FileNameJoin[{repoRoot, "data", "processed", "cross_validation_by_region.csv"}], "Dataset", HeaderLines -> 1]]];
    54	tsRow = First @ Map[Association, Normal[Import[FileNameJoin[{repoRoot, "data", "processed", "time_slice_validation.csv"}], "Dataset", HeaderLines -> 1]]];
    55	ppcRows = Map[Association, Normal[Import[FileNameJoin[{repoRoot, "data", "processed", "posterior_predictive_regional.csv"}], "Dataset", HeaderLines -> 1]]];
    56	ppcCoverage = N[Mean[Boole[TrueQ[#["Covered95"]] || #["Covered95"] === "true" || #["Covered95"] === "True"] & /@ ppcRows]];
    57	
    58	fmt[x_?NumericQ, d_: 3] := ToString[NumberForm[N[x], {12, d}]];
    59	fmt2[x_?NumericQ] := ToString[NumberForm[N[x], {12, 2}]];
    60	pct[x_?NumericQ] := ToString[Round[100 N[x]]] <> "%";
    61	fitOf[r_] := SelectFirst[fits, #["Region"] === r &];
    62	
    63	originSmc = LoadOrRunOriginSMCABC[repoRoot, samples, grid];
    64	originQ = PosteriorParameterQuantiles[originSmc];
    65	oQ[p_] := SelectFirst[originQ, #["Parameter"] === p &];
    66	oLat = oQ["OriginLatitude"]; oLon = oQ["OriginLongitude"]; oT = oQ["OriginTimeBP"];
    67	
    68	nSamples = Length[samples];
    69	epsFirst = First[smc["EpsilonHistory"]];
    70	epsLast = Last[smc["EpsilonHistory"]];
    71	essLast = Last[smc["ESSHistory"]];
    72	nGens = Length[smc["EpsilonHistory"]];
    73	
    74	Print["  samples: ", nSamples, ", grid cells: ", Length[grid],
    75	  ", epsilon ", fmt[epsFirst], " -> ", fmt[epsLast], ", ESS ", fmt[essLast, 1]];
    76	
    77	(* ---------------- house stylesheet (from the reference post) ---------------- *)
    78	
    79	$HouseBlue = RGBColor[0.153, 0.51, 0.64];
    80	
    81	houseStyles = Notebook[{
    82	  Cell[StyleData[StyleDefinitions -> "Default.nb"]],
    83	  Cell[StyleData["Text"], CellMargins -> {{0, 10}, {7, 8}}],
    84	  Cell[StyleData["Title"], CellMargins -> {{0, 3}, {15, 0}},
    85	    FontFamily -> "Roboto Condensed", FontColor -> $HouseBlue],
    86	  Cell[StyleData["Abstract"], CellMargins -> {{0, 10}, {0, 0}}, FontColor -> GrayLevel[0.25]],
    87	  Cell[StyleData["Section"], CellMargins -> {{0, 3}, {10, 18}},
    88	    FontFamily -> "Roboto Condensed", FontSize -> 30, FontColor -> $HouseBlue],
    89	  Cell[StyleData["Subsection"], CellMargins -> {{0, 3}, {8, 15}}, FontFamily -> "Roboto Condensed"],
    90	  Cell[StyleData["Subsubsection"], CellMargins -> {{0, 3}, {8, 12}}, FontFamily -> "Roboto Condensed"],
    91	  Cell[StyleData["Input"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
    92	    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14],
    93	  Cell[StyleData["Output"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
    94	    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14],
    95	  Cell[StyleData["Chapter"], CellMargins -> {{0, 3}, {10, 15}}],
    96	  Cell[StyleData["Subtitle"], CellMargins -> {{0, 3}, {20, -10}}, FontSize -> 17],
    97	  Cell[StyleData["Item"], CellMargins -> {{22, 10.}, {4., 8.}}],
    98	  Cell[StyleData["ItemNumbered"], CellMargins -> {{53, 10.}, {4., 8.}}],
    99	  Cell[StyleData["CodeText"], CellMargins -> {{0, 10}, {7, 8}}],
   100	  Cell[StyleData["Code"], ShowCellBracket -> True, CellMargins -> {{45, 3.}, {4., 4.}},
   101	    StyleHints -> <|"CodeFont" -> "Source Sans Pro"|>, FontSize -> 14],
   102	  Cell[StyleData["DisplayFormulaNumbered"], CellMargins -> {{0, 10}, {7, 8}}],
   103	  Cell[StyleData["Subitem"], CellMargins -> {{53, 10.}, {4., 8.}}],
   104	  Cell[StyleData["Subsubitem"], CellMargins -> {{70, 10.}, {4., 8.}}]},
   105	  Visible -> False, StyleDefinitions -> "PrivateStylesheetFormatting.nb"];
   106	
   107	(* ---------------- cell helpers ---------------- *)
   108	
   109	title[txt_]    := Cell[txt, "Title"];
   110	subtitle[txt_] := Cell[txt, "Subtitle"];
   111	hd1[txt_]      := Cell[txt, "Section"];
   112	
   113	para[stuff_List] := Cell[TextData[stuff], "Text"];
   114	para[s_String]   := Cell[s, "Text"];
   115	
   116	bold[s_] := StyleBox[s, FontWeight -> Bold];
   117	ital[s_] := StyleBox[s, FontSlant -> Italic];
   118	mono[s_] := StyleBox[s, FontFamily -> "Source Code Pro", FontColor -> RGBColor[0.25, 0.35, 0.55]];
   119	
   120	link[txt_String, url_String] := ButtonBox[txt, BaseStyle -> "Hyperlink",
   121	  ButtonData -> {URL[url], None}, ButtonNote -> url];
   122	
   123	captionCell[args__] := Cell[TextData[{args}], "Text",
   124	  FontSize -> 12, FontColor -> GrayLevel[0.4]];
   125	
   126	codeIn[code_String] := Cell[code, "Program",
   127	  CellMargins -> {{45, 30}, {6, 6}}, FontFamily -> "Source Code Pro",
   128	  FontSize -> 12, ShowStringCharacters -> False,
   129	  Background -> RGBColor[0.95, 0.96, 0.98]];
   130	
   131	wlIn[code_String] := Cell[code, "Input"];
   132	
   133	(* Every evalIn cell is EVALUATED here, in this wolframscript kernel, in
   134	   notebook order; the genuine typeset result is embedded as its Output
   135	   cell with matching In[n]:=/Out[n]= labels. Graphics are rasterized;
   136	   tables and Manipulates keep live boxes (Manipulates carry their data,
   137	   so they work in any downloaded copy). *)
   138	
   139	$cellCounter = 0;
   140	
   141	graphicalQ[e_] := MatchQ[e,
   142	  _Graphics | _Legended | _Framed | _Image | _Labeled | _GraphicsGrid |
   143	  _GraphicsRow | _GeoGraphics | _Graphics3D];
   144	
   145	evalIn[code_String] := Module[{res, n, inCell, outCell},
   146	  $cellCounter++; n = $cellCounter;
   147	  Print["  In[", n, "]: ", StringTake[StringReplace[code, "\n" -> " "], UpTo[64]]];
   148	  res = ToExpression[code];
   149	  inCell = Cell[code, "Input", CellLabel -> "In[" <> ToString[n] <> "]:="];
   150	  If[res === Null, Return[inCell]];
   151	  outCell = Which[
   152	    MatchQ[res, _Manipulate],
   153	      Cell[BoxData[ToBoxes[res]], "Output",
   154	        CellLabel -> "Out[" <> ToString[n] <> "]="],
   155	    graphicalQ[res],
   156	      Cell[BoxData[ToBoxes[Rasterize[res, "Image", ImageResolution -> 110]]],
   157	        "Output", CellLabel -> "Out[" <> ToString[n] <> "]=",
   158	        TextAlignment -> Center],
   159	    True,
   160	      Cell[BoxData[ToBoxes[res]], "Output",
   161	        CellLabel -> "Out[" <> ToString[n] <> "]="]
   162	  ];
   163	  Cell[CellGroupData[{inCell, outCell}, Open]]
   164	];
   165	
   166	(* setup cell: shown with its label but not executed at build time (the
   167	   builder has already anchored the directory and loaded the package). *)
   168	evalInSilent[code_String] := Module[{n},
   169	  $cellCounter++; n = $cellCounter;
   170	  Cell[code, "Input", CellLabel -> "In[" <> ToString[n] <> "]:="]
   171	];
   172	
   173	imgFileCell[path_String, width_: 640] := If[FileExistsQ[path],
   174	  Cell[BoxData[ToBoxes[Image[
   175	      With[{im = Import[path]},
   176	        If[ImageDimensions[im][[1]] > 940, ImageResize[im, 940], im]],
   177	      ImageSize -> width]]], "Output",
   178	    ShowCellLabel -> False, TextAlignment -> Center],
   179	  Cell[TextData[{bold["[ missing figure: " <> path <> " ]"]}], "Text",
   180	    FontColor -> RGBColor[0.7, 0.1, 0.1]]];
   181	
   182	genImgCell[file_String, width_: 560] := imgFileCell[FileNameJoin[{genDir, file}], width];
   183	
   184	animCell[path_String, caption_] := Module[{all, anim, boxes},
   185	  If[!FileExistsQ[path],
   186	    Return @ Cell[TextData[{bold["[ missing animation: " <> path <> " ]"]}], "Text",
   187	      FontColor -> RGBColor[0.7, 0.1, 0.1]]];
   188	  all = Import[path, {"GIF", "ImageList"}];
   189	  all = all[[1 ;; ;; 2]];
   190	  all = ColorQuantize[ImageResize[#, {560}], 256] & /@ all;
   191	  anim = AnimatedImage[all, FrameRate -> 2.5,
   192	    AnimationRunning -> True, AnimationRepetitions -> Infinity];
   193	  boxes = ToBoxes[
   194	    If[caption === "", anim,
   195	      Column[{anim,
   196	        Pane[Style[caption, Italic, FontSize -> 10.5, FontFamily -> "Helvetica",
   197	          FontColor -> GrayLevel[0.35]], 660, Alignment -> Center]},
   198	        Alignment -> Center, Spacings -> 0.6]]];
   199	  Cell[BoxData[boxes], "Output", ShowCellLabel -> False, TextAlignment -> Center]
   200	];
   201	
   202	aiNote[fig_String] := Cell[TextData[{
   203	    StyleBox["External asset. ", FontWeight -> Bold, FontSlant -> Italic],
   204	    fig, " was generated outside Wolfram Language with OpenAI's ",
   205	    StyleBox["gpt-image-2", FontFamily -> "Source Code Pro"],
   206	    " model; the prompts and the one-off Python driver are checked into ",
   207	    StyleBox["docs/images/figures-generated/", FontFamily -> "Source Code Pro"],
   208	    " of the project repository. It is a static illustration; there is no WL code to run for this figure."
   209	  }], "Text",
   210	  FontSize -> 11, FontColor -> GrayLevel[0.3],
   211	  Background -> RGBColor[0.88, 0.91, 0.95],
   212	  CellFrame -> {{4, 0}, {0, 0}},
   213	  CellFrameColor -> RGBColor[0.45, 0.55, 0.70]];
   214	
   215	$allCells = {};
   216	writeAll[cs_List] := ($allCells = Join[$allCells, DeleteCases[cs, Null]];
   217	  Print["  writeAll: total = ", Length[$allCells]];);
   218	
   219	
   220	
   221	(* ================= TITLE, HERO, INTRODUCTION ================= *)
   222	
   223	writeAll[{
   224	
   225	title["Watching evolution happen: lactase persistence in 8,000 years of ancient DNA"],
   226	
   227	subtitle["From raw ancient genotypes to a spatial diffusion\[Dash]selection model, \
   228	fitted with sequential Monte Carlo ABC \[LongDash] with the uncertainty carried \
   229	all the way into the pictures"],
   230	
   231	animCell[FileNameJoin[{figDir, "hero_lactase_persistence.gif"}],
   232	  "Posterior mean frequency of the lactase-persistence allele (rs4988235-A) \
   233	across Europe, 8000 BC to today, on the TemperatureMap scale. White-ringed dots \
   234	are the ancient individuals dated within \[PlusMinus]400 years of the moving \
   235	window; the inset tracks the 95% credible-interval width \[LongDash] where the \
   236	map is honest about not knowing. Generated by ExportHeroAnimation in the \
   237	companion package."],
   238	
   239	para[{"Around nine thousand years ago, everyone in Europe \[LongDash] every \
   240	single adult \[LongDash] lost the ability to digest milk sugar a few years \
   241	after weaning, just as almost all mammals do. Today, most northern Europeans \
   242	can drink a glass of milk without a second thought. The switch that changed, \
   243	a single letter of DNA about 14,000 base pairs upstream of the lactase gene, \
   244	is the strongest signal of recent natural selection anywhere in the human \
   245	genome \[LongDash] and thanks to ancient DNA we no longer have to infer its \
   246	history from modern variation: we can simply watch it happen, skeleton by \
   247	dated skeleton, across eight millennia."}],
   248	
   249	para[{"Two recent results make this more interesting than the textbook \
   250	just-so story. ", bold["Evershed et al. (2022, Nature)"], " assembled the \
   251	largest set of prehistoric milk-fat residues from pottery and showed that \
   252	Europeans were dairying enthusiastically for thousands of years while the \
   253	allele stayed rare \[LongDash] and that a selection model tracking milk use \
   254	explains the allele's trajectory ", ital["no better"], " than plain uniform \
   255	selection since the Neolithic. ", bold["Burger et al. (2020, Current \
   256	Biology)"], " showed the flip side: from a Bronze Age battlefield frequency \
   257	of about 7%, reaching today's values requires a selection coefficient of \
   258	roughly 0.06 per generation over the last 3,000 years \[LongDash] enormous \
   259	by the standards of human evolution. Milk was everywhere, the allele was \
   260	nowhere, and then, quite suddenly in evolutionary terms, it was everywhere \
   261	too. Why?"}],
   262	
   263	para[{"This post does not settle that debate. It does something more modest \
   264	and, I hope, more reusable: it builds the ", ital["entire"], " analysis \
   265	pipeline in Wolfram Language, from the public ancient-genotype workbook to a \
   266	calibrated spatial model \[LongDash] and treats uncertainty as a first-class \
   267	output at every step. We will parse and clean 2,999 ancient genotype records, \
   268	reproduce the classic regional frequency curves with proper binomial \
   269	likelihoods, build a spatial diffusion\[Dash]selection model on a landmasked \
   270	grid of Europe, fit it with sequential Monte Carlo approximate Bayesian \
   271	computation (10,000 forward simulations), check it with posterior predictive \
   272	simulation and two kinds of held-out validation, stress-test the priors, and \
   273	render the posterior \[LongDash] mean ", ital["and"], " credible-interval \
   274	width \[LongDash] as the animation above. Every figure sits directly below \
   275	the code that makes it, and the whole thing reruns from two wolframscript \
   276	commands (\[Section]13)."}],
   277	
   278	para[{"All the heavy lifting lives in the companion package ",
   279	  mono["LactasePersistenceSpatial.wl"], " \[LongDash] the only file you need \
   280	beside this notebook (plus an internet connection for the first data \
   281	download). Put the two files in one folder and evaluate: the setup cell finds \
   282	the package next to the notebook (or in ", mono["src/"], " when you are \
   283	inside the cloned repository), the data download and every output re-create \
   284	themselves relative to that folder, and the expensive SMC posterior reloads \
   285	from stored result tables when present and refits from scratch when not. \
   286	Every output you see below was produced by running this notebook top to \
   287	bottom with wolframscript."}]
   288	
   289	}];
   290	
   291	(* ================= 1. SETUP & DATA ================= *)
   292	
   293	writeAll[{
   294	
   295	hd1["1.  Setup and data"],
   296	
   297	para[{"The raw data are the public GLAD ancient-genotype workbook (Global \
   298	Lactase persistence Association Database), derived from the Allen Ancient DNA \
   299	Resource v44.3 and used for the Evershed et al. (2022) analysis. ",
   300	  mono["RetrieveRawData"], " downloads it once, records a SHA-256 checksum \
   301	and a provenance manifest, and marks the file read-only; ",
   302	  mono["WriteProcessedData"], " parses, cleans, and writes tidy CSVs with \
   303	provenance attached."}],
   304	
   305	evalInSilent["nbdir = NotebookDirectory[];\nroot = If[FileExistsQ[FileNameJoin[{ParentDirectory[nbdir], \"src\", \"LactasePersistenceSpatial.wl\"}]],\n   ParentDirectory[nbdir], nbdir];\nSetDirectory[root];\nGet[First[Select[\n   {FileNameJoin[{root, \"src\", \"LactasePersistenceSpatial.wl\"}],\n    FileNameJoin[{nbdir, \"LactasePersistenceSpatial.wl\"}]}, FileExistsQ]]];"],
   306	
   307	evalIn["raw = RetrieveRawData[Directory[]];\nprocessed = WriteProcessedData[Directory[], raw];\nsamples = processed[\"CalledSamples\"];\nLength[samples]"],
   308	
   309	para[{"Parsing ancient genotypes is where silent errors live, so the cleaning \
   310	rules are explicit and tested: genotype strings are normalized so that A \
   311	\[LongDash] and the strand-flipped T, which occurs in exactly 3 heterozygous \
   312	calls \[LongDash] count as the derived (persistence) allele and G/C as \
   313	ancestral; a single-letter pseudo-haploid call contributes one called allele \
   314	and a diploid call two; coordinates accidentally recorded in millidegrees \
   315	(37724 for Sicily) are rescaled; and every sample is assigned to one of four \
   316	coarse analysis regions echoing the published framing. Of 2,999 rows, " <>
   317	ToString[nSamples] <> " have a genotype call plus usable age and location."}],
   318	
   319	evalIn["Counts[#[\"Region\"] & /@ samples]"],
   320	
   321	evalIn["GeoListPlot[GeoPosition[{#[\"Latitude\"], #[\"Longitude\"]} & /@ samples],\n GeoRange -> {{34, 63}, {-12, 36}}, GeoProjection -> \"Equirectangular\",\n PlotStyle -> Directive[Opacity[0.45], RGBColor[0.153, 0.51, 0.64], PointSize[0.005]],\n GeoBackground -> GeoStyling[{\"CountryBorders\", \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 620]"],
   322	
   323	captionCell["Where the ", ToString[nSamples], " usable ancient individuals \
   324	come from. Density is wildly uneven in space and time \[LongDash] the \
   325	Mediterranean is rich, the Baltic sparse, and almost nothing is younger than \
   326	2,500 years \[LongDash] and that unevenness is exactly why the model must \
   327	carry its uncertainty around explicitly."]
   328	
   329	}];
   330	
   331	(* ================= 2. BIOLOGY ================= *)
   332	
   333	writeAll[{
   334	
   335	hd1["2.  What is lactase persistence?"],
   336	
   337	para[{"Lactose, the sugar in milk, cannot be absorbed directly: it must \
   338	first be split into glucose and galactose by the enzyme ", ital["lactase"],
   339	", produced in the lining of the small intestine and encoded by the ",
   340	mono["LCT"], " gene. In the ancestral mammalian program, lactase production \
   341	is switched off after weaning \[LongDash] an adult wolf, cow, or (ancestrally) \
   342	human who drinks milk gets bloating, cramps, and worse, because undigested \
   343	lactose ferments in the colon. The European persistence variant is not a \
   344	change to lactase itself: it is a single C\[RightArrow]T substitution 13,910 \
   345	bases upstream, inside an intron of the neighbouring gene ", mono["MCM6"],
   346	", that acts as an enhancer and simply keeps the LCT switch turned on into \
   347	adulthood. On the reported strand of the association database this is the \
   348	G\[RightArrow]A change at ", mono["rs4988235"], " \[LongDash] one letter, \
   349	one glass of milk, and (as we will see) several percent of extra surviving \
   350	children per generation at its peak."}],
   351	
   352	aiNote["The gene schematic"],
   353	genImgCell["lactase_gene_schematic.png"],
   354	
   355	para[{"A crucial subtlety for what follows: the variant is effectively ",
   356	ital["dominant"], " \[LongDash] one copy is enough to digest milk \[LongDash] \
   357	and it rides on a long shared haplotype, which is how it was first detected \
   358	from modern data alone. But modern data compress history: they can say the \
   359	allele rose fast, not ", ital["when"], ". Ancient DNA turns the same question \
   360	into direct observation."}],
   361	
   362	aiNote["The ancient-DNA workflow illustration"],
   363	genImgCell["adna_timeline_workflow.png"]
   364	
   365	}];
   366	
   367	(* ================= 3. REGIONAL REPRODUCTION ================= *)
   368	
   369	writeAll[{
   370	
   371	hd1["3.  The regional story: four binomial logistic fits"],
   372	
   373	para[{"Before any spatial machinery, the honest first step is to reproduce \
   374	the standard non-spatial description: for each region, a logistic trajectory ",
   375	mono["logit p(t) = \[Alpha] + \[Beta] (10000 \[Minus] t)/1000"], " fitted by \
   376	maximizing the exact binomial log-likelihood over every called allele \
   377	\[LongDash] no time-binning enters the fit; the bins you see in the figure \
   378	are display only, each carrying a 95% Wilson score interval and sized by its \
   379	allele count. Standard errors come from the numerical Hessian at the optimum, \
   380	and the fitter flags any solution that lands on a parameter bound. That flag \
   381	is not decoration: an early version of this project silently reported a \
   382	boundary solution for the British Isles, and the only symptom was a \
   383	suspiciously round \[Alpha]. Fits you cannot audit are fits you cannot \
   384	trust."}],
   385	
   386	evalIn["fits = FitAllRegionalLogistics[samples];\nGrid[\n Prepend[\n  Table[With[{f = SelectFirst[fits, #[\"Region\"] === r &]},\n    {r, f[\"SampleCount\"], f[\"CalledAlleles\"], f[\"DerivedAlleles\"],\n     Row[{NumberForm[f[\"Alpha\"], {5, 2}], \" \[PlusMinus] \", NumberForm[f[\"AlphaSE\"], {4, 2}]}],\n     Row[{NumberForm[f[\"BetaPerKyrTowardPresent\"], {4, 2}], \" \[PlusMinus] \", NumberForm[f[\"BetaSE\"], {4, 2}]}],\n     NumberForm[f[\"SelectionPerGenerationApprox\"], {4, 3}]}],\n   {r, MajorRegions[]}],\n  Style[#, Bold] & /@ {\"region\", \"samples\", \"alleles\", \"derived\", \"\[Alpha]\", \"\[Beta] per kyr\", \"\[TildeTilde]s per gen\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   387	
   388	para[{"With a 28-year generation time, a slope \[Beta] on the logit scale \
   389	translates to an approximate per-generation (genic, codominant) selection \
   390	coefficient s \[TildeTilde] 28\[Beta]/1000. The four regions land between " <>
   391	fmt[Min[#["SelectionPerGenerationApprox"] & /@ fits], 3] <> " and " <>
   392	fmt[Max[#["SelectionPerGenerationApprox"] & /@ fits], 3] <>
   393	" \[LongDash] the familiar few-percent picture, strongest in the north-west, \
   394	and comfortably bracketing Burger et al.'s 0.06 once you note their estimate \
   395	concentrates on the last three millennia while these slopes average over \
   396	eight."}],
   397	
   398	evalIn["regionalOutputs = ExportRegionalFitOutputs[Directory[], samples, fits];\nImport[regionalOutputs[\"RegionalFigure\"]]"],
   399	
   400	captionCell["Observed binned frequencies (Wilson 95% intervals, point area \
   401	\[Proportional] allele count) with the fitted logistic curves. Note the \
   402	Mediterranean's leisurely rise against the British and Baltic sprints \
   403	\[LongDash] and note also how far right of the last data point every \
   404	extrapolation to the present runs. Everything after ~2,000 BP is \
   405	extrapolation, and the spatial model below inherits that caveat."],
   406	
   407	para[{"Rather than take my word for how sensitive these curves are, drag \
   408	them yourself. The Manipulate below overlays an adjustable logistic on each \
   409	region's binned data \[LongDash] the label converts your \[Beta] into an \
   410	implied selection coefficient as you drag. It takes about ten seconds of \
   411	play to internalise two things: how narrow the corridor of plausible \
   412	\[Beta] is for the data-rich Mediterranean, and how wide it is for the \
   413	Baltic."}],
   414	
   415	evalIn["LogisticExplorer[samples]"]
   416	
   417	}];
   418	
   419	(* ================= 4. SPATIAL MODEL ================= *)
   420	
   421	writeAll[{
   422	
   423	hd1["4.  A spatial diffusion\[Dash]selection model"],
   424	
   425	para[{"Regions are administrative conveniences; alleles do not respect them. \
   426	The spatial model discretizes Europe (35\[Dash]63\[Degree]N, \
   427	12\[Degree]W\[Dash]35\[Degree]E) into a 2\[Degree] grid, keeps only cells \
   428	whose centres are on land (" <> ToString[Length[grid]] <> " of them \[LongDash] \
   429	so Britain stays rook-connected to the continent across the Dover cells, \
   430	while Ireland becomes an island in the model's adjacency too, a caveat worth \
   431	knowing), and lets the local allele frequency evolve in 250-year steps from \
   432	10,000 BP:"}],
   433	
   434	codeIn["p[i, t+dt] = p[i, t] + g ( (s0 + sDairy D[i, t] m[region i]) p (1 - p)\n                             + mig mean[ p[j, t] - p[i, t], j adjacent to i ] )\n\ng = dt / 28 generations per step"],
   435	
   436	para[{"Selection has a baseline component s0 and a component sDairy switched \
   437	on by a smoothly varying dairying-onset field D(i, t) \[LongDash] built by \
   438	inverse-distance interpolation from six regional anchor dates (Mediterranean \
   439	~8200 BP through Baltic ~5600 BP) rather than four flat plateaus, so the \
   440	covariate has genuine spatial texture. Per-region multipliers m let the north \
   441	run hotter than the south, and the migration term exchanges frequency with \
   442	adjacent land cells. Here is the model's actual geography \[LongDash] the \
   443	land cells it evolves on, coloured by when dairying arrives in each:"}],
   444	
   445	evalIn["grid = BuildEuropeGrid[];\nLength[grid]"],
   446	
   447	evalIn["Legended[\n GeoGraphics[\n  Flatten@Table[\n    {GeoStyling[Opacity[0.75,\n       ColorData[\"TemperatureMap\"][Rescale[c[\"DairyingOnsetBP\"], {5400, 8500}]]]],\n     EdgeForm[Directive[White, Opacity[0.6], AbsoluteThickness[0.3]]],\n     GeoPolygon[{{c[\"Latitude\"] - 1, c[\"Longitude\"] - 1}, {c[\"Latitude\"] - 1, c[\"Longitude\"] + 1},\n       {c[\"Latitude\"] + 1, c[\"Longitude\"] + 1}, {c[\"Latitude\"] + 1, c[\"Longitude\"] - 1}}]},\n    {c, grid}],\n  GeoRange -> {{34, 63}, {-12, 36}}, GeoProjection -> \"Equirectangular\",\n  GeoBackground -> GeoStyling[{\"CountryBorders\",\n    \"Land\" -> GrayLevel[0.985], \"Ocean\" -> RGBColor[0.82, 0.89, 0.95]}],\n  ImageSize -> 640],\n BarLegend[{(ColorData[\"TemperatureMap\"][Rescale[#, {5400, 8500}]] &), {5400, 8500}},\n  LegendLabel -> \"dairying onset (years BP)\"]]"],
   448	
   449	captionCell["The model's spatial skeleton: the 2\[Degree] land cells \
   450	(sea cells are removed by an elevation test, so diffusion respects \
   451	coastlines \[LongDash] Britain stays connected across the Dover cells, \
   452	Ireland is an island in the adjacency too), coloured by the smooth \
   453	dairying-onset field. Red is early dairying (Mediterranean and the \
   454	southeast, ~8,200 BP), blue is late (the Baltic, ~5,600 BP). This field is \
   455	what the sDairy component of selection switches on, cell by cell, as the \
   456	simulation runs."],
   457	
   458	para[{"The covariate's shape in time is worth ten seconds of interaction \
   459	too:"}],
   460	
   461	evalIn["DairyingCovariateExplorer[]"],
   462	
   463	para[{"One forward simulation of this model costs about 70 ms:"}],
   464	
   465	evalIn["AbsoluteTiming[\n  SimulateSpatialTrajectory[\n   <|\"InitialFrequency\" -> 0.003, \"SelectionBase\" -> 0.002,\n     \"SelectionDairying\" -> 0.02, \"Migration\" -> 0.003|>, grid];\n ][[1]]"],
   466	
   467	para[{"\[LongDash] and that number is the entire strategy. When a simulator \
   468	is this cheap, you do not need to linearize, approximate, or hand-wave the \
   469	likelihood: you can afford tens of thousands of honest forward runs and let \
   470	simulation-based inference do the rest. The model deliberately keeps \
   471	demography implicit; it is a reaction\[Dash]diffusion caricature whose job \
   472	is to let the ", ital["data"], " say how much spatial structure, movement, \
   473	and dairying-modulation they can constrain \[LongDash] not to smuggle \
   474	conclusions in through the architecture."}],
   475	
   476	aiNote["The Neolithic dairying scene"],
   477	genImgCell["neolithic_dairying.png"]
   478	
   479	}];
   480	
   481	(* ================= 5. SMC-ABC ================= *)
   482	
   483	writeAll[{
   484	
   485	hd1["5.  Inference: sequential Monte Carlo ABC"],
   486	
   487	para[{"Approximate Bayesian computation asks the only question a simulator \
   488	can answer: which parameters produce synthetic data that look like the real \
   489	data? \"Look like\" is made precise through summary statistics; here, two \
   490	families. First, the called-allele-weighted regional time-binned frequencies \
   491	(39 bins). Second \[LongDash] because a spatial model scored only on \
   492	regional aggregates can never learn about migration \[LongDash] each sample \
   493	is matched to its nearest grid cell and time step, and pooled \
   494	north\[Minus]south and west\[Minus]east frequency contrasts over the last \
   495	4,000 years are computed ", ital["identically"], " for observed alleles and \
   496	model expectations. The distance is a weighted root-mean-square over all of \
   497	it."}],
   498	
   499	para[{"Plain rejection ABC wastes almost every simulation once the tolerance \
   500	gets interesting, so the fit uses sequential Monte Carlo: a population of \

exec
/bin/zsh -lc "nl -ba community/build_notebook.wls | sed -n '501,1000p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
   501	400 particles is filtered through " <> ToString[nGens] <> " generations of \
   502	shrinking tolerance (each generation's \[Epsilon] is the median of the \
   503	previous population's distances), with Gaussian perturbation kernels and \
   504	importance weights. One implementation lesson worth passing on: with a \
   505	10-dimensional box prior, perturbing in the raw coordinates throws ~97% of \
   506	proposals out of the box (0.7 to the 10th \[TildeTilde] 0.03). The sampler \
   507	therefore works in logit-transformed coordinates, where a uniform prior \
   508	becomes an exact product of standard logistic densities, every proposal is \
   509	automatically valid, and the importance weights stay closed-form."}],
   510	
   511	evalIn["smc = LoadOrRunSMCABC[Directory[], samples, grid];\nGrid[\n Prepend[\n  Table[{k, NumberForm[smc[\"EpsilonHistory\"][[k]], {5, 4}],\n    NumberForm[100. smc[\"AcceptanceHistory\"][[k]], {4, 1}],\n    NumberForm[smc[\"ESSHistory\"][[k]], {5, 1}]}, {k, Length[smc[\"EpsilonHistory\"]]}],\n  Style[#, Bold] & /@ {\"generation\", \"\[Epsilon]\", \"acceptance %\", \"ESS\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   512	
   513	para[{"The tolerance falls from " <> fmt[epsFirst] <> " (the prior median \
   514	\[LongDash] i.e. no information) to " <> fmt[epsLast] <> " over 10,000 \
   515	simulations. The final effective sample size, " <> fmt[essLast, 1] <>
   516	" of 400, deserves a sentence rather than a footnote: importance-weight \
   517	degeneracy is the known cost of this weight formula whenever the posterior \
   518	is much tighter than the prior, every interval in this post is a weighted \
   519	quantile and correspondingly approximate, and the honest cure (an SMC \
   520	sampler with MCMC rejuvenation moves) is on the to-do list in \[Section]11. \
   521	Reporting ESS is what separates a posterior from a scatter plot."}],
   522	
   523	evalIn["draws = ResamplePosterior[smc, 100];\nsmcOutputs = ExportSMCOutputs[Directory[], samples, grid, smc, draws];\nImport[smcOutputs[\"ParameterFigure\"]]"],
   524	
   525	captionCell["Weighted SMC posterior (blue) against the flat prior (dashed \
   526	orange) for all ten parameters. Prior overlays are the fastest honesty check \
   527	in Bayesian workflow: one glance separates the dimensions the data actually \
   528	moved (initial frequency, dairying-modulated selection, the northern \
   529	multipliers) from the ones still wearing their priors (the initial spatial \
   530	gradients)."]
   531	
   532	}];
   533	
   534	(* ================= 6. RESULTS ================= *)
   535	
   536	resultsRow[p_, label_] := Module[{q = quantOf[p]},
   537	  {label, NumberForm[q["Median"], {5, 4}],
   538	   Row[{"[", NumberForm[q["Lower95"], {5, 4}], ", ", NumberForm[q["Upper95"], {5, 4}], "]"}]}];
   539	
   540	writeAll[{
   541	
   542	hd1["6.  What the posterior says"],
   543	
   544	evalIn["quantiles = PosteriorParameterQuantiles[smc];\nGrid[\n Prepend[\n  Table[With[{q = SelectFirst[quantiles, #[\"Parameter\"] === p &]},\n    {p, NumberForm[q[\"Median\"], {6, 4}],\n     Row[{\"[\", NumberForm[q[\"Lower95\"], {6, 4}], \", \", NumberForm[q[\"Upper95\"], {6, 4}], \"]\"}]}],\n   {p, {\"Log10InitialFrequency\", \"SelectionBase\", \"SelectionDairying\", \"Migration\",\n     \"SelectionMultiplierBritishIsles\", \"SelectionMultiplierRhineDanube\",\n     \"SelectionMultiplierMediterranean\", \"SelectionMultiplierBaltic\"}}],\n  Style[#, Bold] & /@ {\"parameter\", \"median\", \"95% interval\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   545	
   546	para[{"Three readings, in decreasing order of confidence. ", bold["First"],
   547	", the total effective selection in a northern dairying cell at the \
   548	posterior median \[LongDash] s0 + sDairy \[Times] multiplier \[TildeTilde] " <>
   549	fmt[quantOf["SelectionBase"]["Median"] + quantOf["SelectionDairying"]["Median"]*quantOf["SelectionMultiplierBritishIsles"]["Median"], 3] <>
   550	" per generation \[LongDash] sits squarely in the published few-percent \
   551	range, with the northern multipliers pulled above one exactly where the \
   552	logistic slopes were steepest. ", bold["Second"], ", the posterior does ",
   553	ital["not"], " cleanly separate dairying-modulated from baseline selection. \
   554	This is not a failure of the sampler; it is the geometry of the problem. \
   555	The dairying covariate saturates to one within a few centuries of onset, so \
   556	for most of the simulated period sDairy acts almost exactly like uniform \
   557	selection; only the early Neolithic carries contrast between the two. \
   558	That the ancient genotypes accommodate both a mostly-uniform and a \
   559	mostly-dairy-modulated reading is this little model's echo of Evershed et \
   560	al.'s conclusion at Nature scale: milk exploitation is not required to \
   561	explain the trajectory. ", bold["Third"], ", migration is only weakly \
   562	identified \[LongDash] \[Section]9 quantifies exactly how weakly, instead \
   563	of letting a prior masquerade as a discovery."}]
   564	
   565	}];
   566	
   567	(* ================= 7. MAPS ================= *)
   568	
   569	writeAll[{
   570	
   571	hd1["7.  The posterior on the map \[LongDash] and its uncertainty"],
   572	
   573	para[{"Every map below is a posterior functional: 100 equally-weighted \
   574	posterior draws, each pushed through the forward model, summarized per cell, \
   575	then interpolated for display by ordinary kriging (range 3.5\[Degree], \
   576	nugget 0.02) and cut to the coastline. Kriging here is a display courtesy, \
   577	not an inferential claim \[LongDash] the 2\[Degree] cells remain the units \
   578	that saw data. Colors are the TemperatureMap scale with a square-root \
   579	stretch so the long rare-allele centuries stay legible."}],
   580	
   581	evalIn["spatialOutputs = ExportSpatialVisualizations[Directory[], samples, grid, draws];\nImport[spatialOutputs[\"MeanMap\"]]"],
   582	
   583	evalIn["Import[spatialOutputs[\"UncertaintyMap\"]]"],
   584	
   585	captionCell["Posterior mean (top) and 95% credible-interval width (bottom) \
   586	at 3000 BP. The two maps are a pair on purpose: the second is the error bar \
   587	of the first, rendered at equal visual rank. The interval is widest exactly \
   588	where the sampling map of \[Section]1 is emptiest \[LongDash] the model has \
   589	the good manners to be unsure where it has seen nothing."],
   590	
   591	para[{"And because a static pair understates how the story unfolds, step \
   592	through it yourself \[LongDash] each frame is the posterior mean with the \
   593	ancient samples of that moment:"}],
   594	
   595	evalIn["SpatialTimeExplorer[samples, grid, draws]"]
   596	
   597	}];
   598	
   599	(* ================= 8. VALIDATION ================= *)
   600	
   601	writeAll[{
   602	
   603	hd1["8.  Does it actually predict anything?"],
   604	
   605	para[{"A posterior that merely redescribes its training data is a \
   606	compression algorithm, not a model. Three checks, in increasing order of \
   607	severity."}],
   608	
   609	para[{bold["Posterior predictive."], " Push posterior draws through the \
   610	model, sample binomial allele counts at each bin's actual sample size, and \
   611	ask how often the observed frequency lands inside the 95% band: " <>
   612	pct[ppcCoverage] <> " of the " <> ToString[Length[ppcRows]] <> " bins. Bins \
   613	with two called alleles correctly get bands covering nearly everything \
   614	\[LongDash] wide honesty beats narrow fiction."}],
   615	
   616	evalIn["Import[smcOutputs[\"PosteriorPredictiveFigure\"]]"],
   617	
   618	para[{bold["Held-out regions."], " Refit the entire SMC from scratch four \
   619	times, each time deleting one region's samples, then predict the deleted \
   620	region:"}],
   621	
   622	evalIn["Dataset[Map[Association, Normal[Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"cross_validation_by_region.csv\"}], \"Dataset\", HeaderLines -> 1]]]]"],
   623	
   624	para[{bold["Held-out time"], " \[LongDash] the killer test. Train only on \
   625	samples older than 2,500 BP (" <> ToString[tsRow["TrainingSamples"]] <>
   626	" of them) and predict the " <> ToString[tsRow["HeldOutBins"]] <>
   627	" most recent bins. The intervals still cover, but the posterior median \
   628	under-predicts the final rise badly (RMSE " <> fmt[tsRow["RMSE"], 2] <>
   629	"). Far from being embarrassing, this is the pipeline independently \
   630	rediscovering Burger et al.'s headline: the evidence for ", ital["strong, \
   631	late"], " selection is concentrated in the last three millennia. Delete \
   632	those millennia and the model, sensibly, refuses to believe in them."}],
   633	
   634	evalIn["Dataset[Map[Association, Normal[Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"time_slice_validation.csv\"}], \"Dataset\", HeaderLines -> 1]]]]"]
   635	
   636	}];
   637	
   638	(* ================= 9. SENSITIVITY ================= *)
   639	
   640	writeAll[{
   641	
   642	hd1["9.  Which conclusions survive the priors?"],
   643	
   644	para[{"Five complete refits: baseline; halved selection priors; doubled \
   645	migration prior; and every dairying onset shifted 400 years earlier or \
   646	later. The dairying-modulated selection component stays positive in all \
   647	five (medians 0.008\[Dash]0.019) \[LongDash] that conclusion belongs to the \
   648	data. The migration posterior, by contrast, faithfully tracks whichever \
   649	prior it is given (median 0.010 baseline \[RightArrow] 0.020 under the \
   650	widened prior): with " <> ToString[Length[grid]] <> " cells and \
   651	regionally-pooled summaries, movement is weakly identified, and the honest \
   652	statement is exactly that."}],
   653	
   654	evalIn["Import[FileNameJoin[{Directory[], \"figures\", \"generated\", \"sensitivity_intervals.png\"}]]"]
   655	
   656	}];
   657	
   658	(* ================= 10. ORIGIN ================= *)
   659	
   660	writeAll[{
   661	
   662	hd1["10.  Where did the allele come from? Origin versus selection"],
   663	
   664	para[{"Everything so far answers \"where did selection push hardest?\" \
   665	\[LongDash] which is a different question from \"where did the allele \
   666	come from?\", and the two are easy to conflate when watching the \
   667	animation. The classic origin estimate is ", bold["Itan et al. (2009)"],
   668	", whose demic coevolution simulations placed the start of the \
   669	lactase-persistence/dairying story around 7,500 years ago in the zone \
   670	between the central Balkans and central Europe \[LongDash] roughly the \
   671	Linearbandkeramik world of modern Hungary, Slovakia, and Austria. What do \
   672	the ancient genotypes in this dataset say about first appearances?"}],
   673	
   674	evalIn["earliest = TakeLargestBy[Select[samples, #[\"DerivedAlleles\"] > 0 &], #[\"MeanDateBP\"] &, 8];\nGrid[\n Prepend[\n  {Round[#[\"MeanDateBP\"]], #[\"Country\"], #[\"Latitude\"], #[\"Longitude\"],\n    #[\"RS4988235Genotype\"], #[\"Publication\"]} & /@ earliest,\n  Style[#, Bold] & /@ {\"years BP\", \"country\", \"lat\", \"lon\", \"call\", \"publication\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   675	
   676	evalIn["GeoGraphics[\n Flatten[Table[{RGBColor[0.8, 0.15, 0.1], PointSize[0.013],\n    Point[GeoPosition[{e[\"Latitude\"], e[\"Longitude\"]}]],\n    Black, Text[Style[ToString[Round[e[\"MeanDateBP\"]]] <> \" BP\", 9.5, Bold],\n      GeoPosition[{e[\"Latitude\"] + 1.1, e[\"Longitude\"]}]]},\n   {e, earliest}], 1],\n GeoRange -> {{34, 63}, {-14, 72}}, GeoProjection -> \"Equirectangular\",\n GeoBackground -> GeoStyling[{\"CountryBorders\",\n   \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 640]"],
   677	
   678	captionCell["The eight oldest derived-allele carriers in the dataset. The \
   679	earliest observations cluster in the southeast \[LongDash] Bulgaria ~6560 \
   680	BP, Ukraine ~5600 BP, Romania ~5390 BP \[LongDash] before Ireland, Iberia, \
   681	Britain, and Hungary appear around 5100\[Dash]4270 BP. Each is a single \
   682	heterozygote, so each is individually weak evidence, and sampling is far \
   683	from spatially uniform \[LongDash] but the pattern is at least compatible \
   684	with a central/southeastern European origin of the kind Itan et al. \
   685	proposed."],
   686	
   687	para[{"The hero animation cannot show any of this, ", ital["by construction"],
   688	": its model starts at 10,000 BP with a near-uniform initial frequency, \
   689	has no mutation event, and \[LongDash] with migration weakly identified \
   690	\[LongDash] moves essentially by in-place logistic growth. Britain lights \
   691	up first there because its late samples demand the fastest growth, not \
   692	because the allele originated there. So let us stop hand-waving and put \
   693	the origin ", ital["into"], " the model: replace the uniform start with a \
   694	point source \[LongDash] four new parameters (origin latitude, longitude, \
   695	time, and the injection frequency), a wider migration prior (a travelling \
   696	wave has to actually travel: m \[Element] [0.02, 0.6] per generation, \
   697	integrated stably with exact per-step logistic growth and exponential \
   698	mixing), and diagonal adjacency so the wave can cross the Dover strait. \
   699	One scientific commitment is made explicit rather than left to the prior: \
   700	the source must sit where dairying already existed (within 800 years of \
   701	the local onset), because the thing being located is the start of the ", \
   702	ital["selection-driven rise"], ", not the first mutation event \[LongDash] \
   703	the same gene\[Dash]culture coupling that Itan et al. build into their \
   704	model. Without it, a drift-free simulator lets a vanishingly small \
   705	injection idle for millennia in pre-dairying forager regions, and the \
   706	origin location quietly decouples from the story being told. The same SMC \
   707	machinery then turns \"where did it start?\" into a posterior \
   708	distribution:"}],
   709	
   710	evalIn["originSmc = LoadOrRunOriginSMCABC[Directory[], samples, grid];\nGrid[\n Prepend[\n  Table[With[{q = SelectFirst[PosteriorParameterQuantiles[originSmc], #[\"Parameter\"] === p &]},\n    {p, NumberForm[q[\"Median\"], {6, 3}],\n     Row[{\"[\", NumberForm[q[\"Lower95\"], {6, 3}], \", \", NumberForm[q[\"Upper95\"], {6, 3}], \"]\"}]}],\n   {p, {\"OriginLatitude\", \"OriginLongitude\", \"OriginTimeBP\",\n     \"Log10InjectFrequency\", \"Migration\", \"SelectionDairying\"}}],\n  Style[#, Bold] & /@ {\"parameter\", \"median\", \"95% interval\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.5, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   711	
   712	evalIn["OriginDensityMap[originSmc]"],
   713	
   714	captionCell["The reverse-diffusion result, in the spirit of Itan et al.'s \
   715	famous origin map: weighted posterior density of the point source's \
   716	location, land-masked. Read the spread, not the star. \[Section]11 shows \
   717	that this posterior is broad and multimodal enough that its mode is not a \
   718	stable quantity \[LongDash] move the kernel bandwidth or reshuffle the \
   719	resampling seed and the starred cell jumps between southwestern France, \
   720	northern Germany and Iberia, a range of some 1,500 km. The star marks the \
   721	modal cell of one particular kernel estimate; it is not a location \
   722	estimate, and \[Section]11 makes the case that this posterior has no \
   723	defensible point summary of location at all."],
   724	
   725	evalIn["OriginFitSurfaceMap[samples, grid, originSmc]"],
   726	
   727	captionCell["A prior-free cross-check on the same question: every \
   728	non-origin parameter is pinned at its posterior median, the point source \
   729	is placed in each land cell in turn, and the map is coloured by how well \
   730	the forward simulation then matches the ancient samples (warmer = better \
   731	fit). Read it honestly, in both directions. The well-fitting region is \
   732	broad: the ancient data constrain the origin's latitude band far more \
   733	sharply than its longitude, and because the northwest of the map is \
   734	sampled most densely, the conditional optimum leans that way. But what \
   735	the scan rules out is just as informative \[LongDash] Iberia, the \
   736	southern Balkans, and the far northeast fit distinctly worse \[LongDash] \
   737	and the posterior concentration above sits comfortably inside the \
   738	preferred band. Where the joint posterior differs from this scan \
   739	\[LongDash] most visibly in pulling mass away from regions where \
   740	dairying arrived late \[LongDash] the difference is the gene\[Dash]culture \
   741	coupling and the joint fitting of origin time and injection frequency, \
   742	not the origin prior, which is uniform over the whole map."],
   743	
   744	para[{"And the forward story from that fitted origin \[LongDash] the \
   745	travelling wave the hero animation could not show \[LongDash] as its own \
   746	video (the star marks the posterior modal origin; the inset again tracks \
   747	the 95% credible-interval width):"}],
   748	
   749	animCell[FileNameJoin[{figDir, "origin_spread.gif"}],
   750	  "Forward simulation from the fitted point source: posterior mean over \
   751	100 origin-model draws, 100-year interpolated steps from 9,600 BP. \
   752	Generated by ExportOriginSpread; the H.264 version is \
   753	figures/generated/origin_spread.mp4."],
   754	
   755	para[{"Read the origin posterior with the same discipline as everything \
   756	else here. The location information comes from a handful of early \
   757	single-heterozygote calls scattered over an unevenly sampled map, filtered \
   758	through a coarse deterministic wave model \[LongDash] so the credible \
   759	region is wide, and it should be. What the fit adds beyond the anecdotal \
   760	table above is that all three ingredients are now estimated ", ital["jointly"],
   761	": an origin location and time, a wave that must actually reach Britain \
   762	and the Baltic in time for their observed rises, and selection on top. \
   763	Whether the posterior mass sits over the Carpathian Basin, the lower \
   764	Danube, or the Pontic steppe is exactly the kind of statement this \
   765	machinery exists to make \[LongDash] and unlike a caption, it comes with \
   766	its uncertainty attached."}]
   767	
   768	}];
   769	
   770	(* ================= 11-14. CLOSING ================= *)
   771	
   772	writeAll[{
   773	
   774	hd1["11.  Checked against the published record"],
   775	
   776	para[{"A model that only agrees with itself is not worth posting, so \
   777	this section tests the fit against estimates it never saw. The benchmark \
   778	is ", bold["Itan et al. (2009)"], " \[LongDash] a demic coevolution \
   779	simulation driven by archaeological settlement dates and ", ital["modern"],
   780	" allele frequencies, with no ancient genotypes at all. Our fit uses ",
   781	ital["only"], " ancient genotypes. The two are about as close to \
   782	independent lines of evidence as this field offers, which is what makes \
   783	the comparison worth doing \[LongDash] and worth doing ",
   784	ital["numerically"], ", not by putting two pictures next to each other and \
   785	inviting the eye to find agreement. Two maps that share a warm patch can \
   786	still be quantitatively far apart, and here they are."}],
   787	
   788	para[{"So the first step is to turn their figure back into numbers. Their \
   789	Fig 3 carries tick marks at known latitudes and longitudes, so the pixel \
   790	grid can be georeferenced exactly, and the filled contour bands run along \
   791	a standard blue\[Dash]cyan\[Dash]green\[Dash]yellow\[Dash]red ramp that \
   792	inverts analytically to a relative density. ", mono["scripts/digitise_itan_fig3.py"],
   793	" does this and writes ", mono["data/processed/itan2009_origin_density_digitised.csv"],
   794	". The digitisation validates itself: the recovered mode lands at \
   795	48.5\[Degree]N, 14.0\[Degree]E against the 48.5\[Degree]N, 13\[Degree]E \
   796	their text reports. With both posteriors as numbers on one grid, the \
   797	comparison becomes arithmetic:"}],
   798	
   799	imgFileCell[FileNameJoin[{repoRoot, "figures", "generated",
   800	  "origin_hpd_comparison.png"}], 660],
   801	
   802	captionCell["Highest-posterior-density contours for both analyses on \
   803	common axes \[LongDash] derived numeric contours only, no part of the \
   804	published image reproduced. Itan et al.'s 50% region (blue, solid) is a \
   805	compact ellipse over Bavaria, Bohemia and the Carpathian Basin. Ours (red, \
   806	solid) sprawls from the Atlantic coast of France to Ukraine in several \
   807	disconnected lobes, and our 95% region covers essentially the whole \
   808	domain. This is the comparison the side-by-side view flattered."],
   809	
   810	evalIn["itanGrid = Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"itan2009_origin_density_digitised.csv\"}], \"Dataset\", HeaderLines -> 1];\nitanRows = Normal[itanGrid];\nlons = Union[#[[1]] & /@ itanRows]; lats = Union[#[[2]] & /@ itanRows];\nitanAssoc = Association[{#[[1]], #[[2]]} -> #[[3]] & /@ itanRows];\noriginDraws2 = ResamplePosterior[originSmc, 2000];\nkdeAt[lo_, la_] := Mean[Map[Exp[-0.5 (((lo - #[\"OriginLongitude\"])/2.6)^2 + ((la - #[\"OriginLatitude\"])/2.0)^2)] &, originDraws2]];\ncells = Keys[itanAssoc];\nwArea = Cos[#[[2]] Degree] & /@ cells;\npI = (Values[itanAssoc] wArea); pI = pI/Total[pI];\npO = (kdeAt @@@ cells) wArea; pO = pO/Total[pO];\nhpdMask[p_, lev_] := Module[{ord = Ordering[-p], c = 0., keep = {}},\n   Do[c += p[[i]]; AppendTo[keep, i]; If[c >= lev, Break[]], {i, ord}]; keep];\nbc = Total[Sqrt[pI pO]];\nGrid[{Style[#, Bold] & /@ {\"statistic\", \"value\", \"reading\"},\n  {\"Bhattacharyya coefficient\", NumberForm[bc, {4, 3}], \"1 = identical, 0 = disjoint\"},\n  {\"our mass in Itan 50% region\", NumberForm[Total[pO[[hpdMask[pI, 0.5]]]], {4, 3}], \"vs 0.50 if we agreed\"},\n  {\"our mass in Itan 95% region\", NumberForm[Total[pO[[hpdMask[pI, 0.95]]]], {4, 3}], \"vs 0.95 if we agreed\"},\n  {\"Itan mass in our 95% region\", NumberForm[Total[pI[[hpdMask[pO, 0.95]]]], {4, 3}], \"ours is broad enough to contain theirs\"}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.4, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   811	
   812	captionCell["The honest verdict on location. If the two posteriors were \
   813	describing the same belief, the mass we place inside their 50% and 95% \
   814	regions would be about 0.50 and 0.95. It is nothing like that. The last \
   815	row is the one that is easy to misread: their whole distribution sits \
   816	inside our 95% region, but that is a statement about how vague we are, \
   817	not how right. A posterior wide enough to contain every rival hypothesis \
   818	has not corroborated any of them."],
   819	
   820	imgFileCell[FileNameJoin[{repoRoot, "docs", "images", "originals",
   821	  "itan2009_fig3_origin_density.png"}], 620],
   822	
   823	captionCell["Reproduced from Itan Y, Powell A, Beaumont MA, Burger J, \
   824	Thomas MG (2009), \[OpenCurlyDoubleQuote]The Origins of Lactase \
   825	Persistence in Europe\[CloseCurlyDoubleQuote], PLoS Computational Biology \
   826	5(8): e1000491, Figure 3, under the Creative Commons Attribution licence. \
   827	Posterior density of the origin of the lactase-persistence/dairying \
   828	coevolution in their model: the mode sits near 48.5\[Degree]N, \
   829	13\[Degree]E and the high-density ridge extends toward the Carpathian \
   830	Basin \[LongDash] the \[OpenCurlyDoubleQuote]Hungary \
   831	result\[CloseCurlyDoubleQuote] of the popular retellings."],
   832	
   833	evalIn["originDraws = ResamplePosterior[originSmc, 2000];\nsTotal = Quantile[Map[#[\"SelectionBase\"] + #[\"SelectionDairying\"] &, originDraws], {0.025, 0.5, 0.975}];\noRow[p_] := SelectFirst[PosteriorParameterQuantiles[originSmc], #[\"Parameter\"] === p &];\nfq[p_, d_] := With[{q = oRow[p]}, {ToString[NumberForm[q[\"Median\"], {8, d}]],\n   \"[\" <> ToString[NumberForm[q[\"Lower95\"], {8, d}]] <> \", \" <> ToString[NumberForm[q[\"Upper95\"], {8, d}]] <> \"]\"}];\nGrid[\n {Style[#, Bold] & /@ {\"quantity\", \"this model\", \"95% interval\", \"published\", \"source\"},\n  Join[{\"origin latitude (\[Degree]N)\"}, fq[\"OriginLatitude\", 1], {\"\[TildeTilde]48.5 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin longitude (\[Degree]E)\"}, fq[\"OriginLongitude\", 1], {\"\[TildeTilde]13 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin date (years BP)\"}, fq[\"OriginTimeBP\", 0], {\"7441 [6256, 8683]\", \"Itan 2009\"}],\n  Join[{\"selection, dairying term\"}, fq[\"SelectionDairying\", 3], {\"0.0953 [0.0518, 0.159]\", \"Itan 2009 (dairyers)\"}],\n  {\"selection, total in dairying cells\", ToString[NumberForm[sTotal[[2]], {8, 3}]],\n   \"[\" <> ToString[NumberForm[sTotal[[1]], {8, 3}]] <> \", \" <> ToString[NumberForm[sTotal[[3]], {8, 3}]] <> \"]\",\n   \"0.014\[Dash]0.15\", \"Bersaglieri 2004\"},\n  {\"\", \"\", \"\", \"\[TildeTilde]0.06 (last 3 kyr)\", \"Burger 2020\"}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   834	
   835	captionCell["Parameter by parameter, the picture splits in two. The \
   836	date is a success: our median of about 7,200 BP sits close to Itan et \
   837	al.'s 7,441 BP with heavily overlapping intervals, and it is consistent \
   838	with Irving-Pease et al. (2024), who date the start of the frequency rise \
   839	to roughly 6,000 BP from 1,664 imputed ancient genomes. Selection is also \
   840	a success: our total in dairying cells, 0.039, falls inside every \
   841	published range \[LongDash] Bersaglieri's 0.014\[Dash]0.15, Burger's \
   842	\[TildeTilde]0.06 for the last three millennia, Irving-Pease's 0.0194 \
   843	genome-wide, Itan's 0.0953 among dairyers. Location is the failure, and \
   844	the marginal medians in this table hide it: a marginal median is a poor \
   845	summary of a broad multimodal joint posterior, and quoting one here \
   846	would manufacture an agreement the joint distribution does not support."],
   847	
   848	para[{"One more check, at the other end of time: extrapolate the fitted \
   849	uniform-start model to the present (0 BP, i.e. 1950) and compare with \
   850	today's measured rs4988235-A frequencies from the 1000 Genomes Project at \
   851	the four sampled populations that sit on our grid:"}],
   852	
   853	evalIn["modern = {\n  {\"Britain (GBR)\", 52.5, -1.5, 0.720},\n  {\"Iberia (IBS)\", 40.4, -3.7, 0.458},\n  {\"Tuscany (TSI)\", 43.5, 11.0, 0.089},\n  {\"Finland (FIN)\", 61.0, 25.0, 0.591}};\npresent = PosteriorCellStats[draws, grid, {0}][0];\nnearCell[la_, lo_] := First[Ordering[\n   Map[EuclideanDistance[{la, lo Cos[la Degree]},\n     {#[\"Latitude\"], #[\"Longitude\"] Cos[#[\"Latitude\"] Degree]}] &, grid], 1]];\nGrid[\n Prepend[\n  Map[Function[row, With[{i = nearCell[row[[2]], row[[3]]]},\n    {row[[1]], ToString[NumberForm[present[\"Mean\"][[i]], {4, 2}]],\n     \"[\" <> ToString[NumberForm[present[\"Lower95\"][[i]], {4, 2}]] <> \", \" <>\n       ToString[NumberForm[present[\"Upper95\"][[i]], {4, 2}]] <> \"]\",\n     ToString[NumberForm[row[[4]], {4, 2}]]}]], modern],\n  Style[#, Bold] & /@ {\"population\", \"model at 0 BP\", \"95% interval\", \"1000G rs4988235-A\"}],\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.4, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
   854	
   855	captionCell["Present-day extrapolation versus 1000 Genomes phase-3 allele \
   856	frequencies (Ensembl). Everything after ~2,000 BP is extrapolation far \
   857	beyond the ancient data, and the intervals say so \[LongDash] they span \
   858	most of the unit interval. The medians put Britain and Finland at the \
   859	top, correctly, but swap the bottom two, and Iberia's observed value \
   860	sits just above its upper bound. Read this the honest way: the model is \
   861	calibrated for the ancient window it was fitted to, and its present-day \
   862	precision is essentially nil \[LongDash] which is itself worth knowing \
   863	before anyone quotes the animation's final frame as a prediction."],
   864	
   865	para[{"Taken together, the verdict is split, and saying so is the \
   866	point of the section. ", bold["Timing and selection strength check out"],
   867	": the origin date agrees with Itan et al. and with the newer \
   868	imputed-genome time series, and the selection coefficient sits inside \
   869	every published interval. ", bold["Location does not"], ". Our joint \
   870	posterior over the origin is broad, multimodal, and mode-unstable; it \
   871	fails to exclude the central-European answer, but failing to exclude is \
   872	not confirming, and this analysis should not be cited as ancient-DNA \
   873	support for the Carpathian origin."}],
   874	
   875	para[{"It is worth being precise about ", ital["why"], " location fails \
   876	while timing succeeds, because the reason is in the data rather than the \
   877	code. Of the 636 called alleles older than 6,000 BP in this dataset, ",
   878	bold["exactly one"], " is derived \[LongDash] a single heterozygote from \
   879	Bulgaria at about 6,560 BP. Timing is identified because the whole \
   880	European frequency curve turns upward at a well-determined moment, and \
   881	thousands of alleles constrain that turn. Location has essentially one \
   882	informative carrier plus a field of zeros, and a zero is only weak \
   883	evidence of absence when sampling is as spatially uneven as this. No \
   884	amount of extra sequencing fixes that directly, because the allele \
   885	genuinely was near zero frequency then; the fix has to come from a \
   886	statistic that reads the geometry of the spread rather than the roster of \
   887	early carriers. Fitting the ", ital["arrival time"], " as a function of \
   888	distance from a candidate source \[LongDash] the classical \
   889	wave-of-advance signal, where a front under Fisher\[Dash]KPP dynamics \
   890	advances at c = 2\!\(\*SqrtBox[\(D\\\\ s\)]\) \[LongDash] uses the \
   891	thousands of ", ital["later"], " samples to locate the apex of the cone, \
   892	and is the obvious next step for this project."}],
   893	
   894	hd1["12.  The animation, assembled"],
   895	
   896	para[{"The hero animation at the top of the post is the whole pipeline in \
   897	one artifact: 81 time-interpolated frames of the kriged posterior mean, the \
   898	moving window of ancient samples, a progress bar, and \[LongDash] \
   899	non-negotiably \[LongDash] the credible-interval inset, so that even a \
   900	viewer who reads nothing else cannot mistake the smooth colours for \
   901	certainty. Because every frame is raster-composited over a single cached \
   902	base map, the full render takes under a minute:"}],
   903	
   904	codeIn["hero = ExportHeroAnimation[Directory[], samples, grid, draws];\n(* figures/generated/hero_lactase_persistence.{mp4, gif} *)"],
   905	
   906	hd1["13.  What this is not"],
   907	
   908	para[{"This is a calibrated caricature, and the caveats are part of the \
   909	result. The regional logistic layer reproduces the published four-region \
   910	picture qualitatively, not parameter-for-parameter. The simulator is \
   911	deterministic \[LongDash] no genetic drift \[LongDash] which flatters the \
   912	posterior's tightness; demography (the steppe migrations!) is implicit; \
   913	Ireland is unreachable in the adjacency; radiocarbon uncertainty enters the \
   914	bins as point dates; the final ESS of " <> fmt[essLast, 1] <> " keeps every \
   915	interval approximate; and everything after ~2,000 BP extrapolates beyond \
   916	the data. Next steps, in rough order of value: a formal model comparison \
   917	between the uniform-start and point-source variants (\[Section]10), a \
   918	Wright\[Dash]Fisher stochastic core, sample-level ancestry-aware \
   919	likelihoods, MCMC rejuvenation inside the SMC, and calibrated-date \
   920	uncertainty propagated end-to-end."}],
   921	
   922	hd1["14.  Reproducibility"],
   923	
   924	para[{"Everything \[LongDash] data retrieval with checksums, processing \
   925	with provenance, fits, SMC, validation, sensitivity, every figure, the \
   926	hero animation, and this notebook itself \[LongDash] regenerates from the \
   927	repository:"}],
   928	
   929	codeIn["git clone https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram\nwolframscript -file scripts/run_pipeline.wls --particles 400 --generations 5\nwolframscript -file scripts/run_tests.wls\nwolframscript -file community/build_notebook.wls"],
   930	
   931	para[{"The package ", mono["src/LactasePersistenceSpatial.wl"],
   932	  " (~2,000 lines) carries the entire workflow behind the one-liners in \
   933	this post; 24 VerificationTests cover the parsers, the simulator, the \
   934	summary statistics, and the SMC machinery, and GitHub Actions runs them \
   935	non-interactively. Repository: ",
   936	  link["mthiel74/ancient-dna-lactase-spatial-wolfram",
   937	    "https://github.com/mthiel74/ancient-dna-lactase-spatial-wolfram"], "."}],
   938	
   939	hd1["15.  References"],
   940	
   941	para[{"Evershed, R. P., et al. (2022). Dairying, diseases and the evolution \
   942	of lactase persistence in Europe. ", ital["Nature"], " 608, 336\[Dash]345. ",
   943	  link["nature.com/articles/s41586-022-05010-7",
   944	    "https://www.nature.com/articles/s41586-022-05010-7"]}],
   945	
   946	para[{"Burger, J., et al. (2020). Low prevalence of lactase persistence in \
   947	Bronze Age Europe indicates ongoing strong selection over the last 3,000 \
   948	years. ", ital["Current Biology"], " 30(21), 4307\[Dash]4315. ",
   949	  link["cell.com/current-biology",
   950	    "https://www.cell.com/current-biology/fulltext/S0960-9822(20)31187-8"]}],
   951	
   952	para[{"Bersaglieri, T., et al. (2004). Genetic signatures of strong \
   953	recent positive selection at the lactase gene. ",
   954	  ital["American Journal of Human Genetics"], " 74(6), 1111\[Dash]1120."}],
   955	
   956	para[{"Irving-Pease, E. K., et al. (2024). The selection landscape and \
   957	genetic legacy of ancient Eurasians. ", ital["Nature"], " 625, \
   958	312\[Dash]320. ",
   959	  link["nature.com/articles/s41586-023-06705-1",
   960	    "https://www.nature.com/articles/s41586-023-06705-1"]}],
   961	
   962	para[{"Itan, Y., Powell, A., Beaumont, M. A., Burger, J., Thomas, M. G. \
   963	(2009). The origins of lactase persistence in Europe. ",
   964	  ital["PLoS Computational Biology"], " 5(8), e1000491 (CC-BY; Figure 3 \
   965	reproduced in \[Section]11). "}],
   966	
   967	para[{"The 1000 Genomes Project Consortium (2015). A global reference for \
   968	human genetic variation. ", ital["Nature"], " 526, 68\[Dash]74. \
   969	rs4988235 population frequencies via Ensembl."}],
   970	
   971	para[{"GLAD LP Ancient Genotypes 2022 workbook (UCL), derived from the Allen \
   972	Ancient DNA Resource v44.3."}],
   973	
   974	para[{Style["Analysis, figures, and notebook generated with Wolfram Language " <>
   975	  StringTake[$Version, 6] <> " on " <>
   976	  DateString[Now, {"MonthName", " ", "DayShort", ", ", "Year"}] <> ".",
   977	  FontSlant -> Italic, FontColor -> GrayLevel[0.4]]}]
   978	
   979	}];
   980	
   981	(* ================= SAVE ================= *)
   982	
   983	Print["assembled ", Length[$allCells], " cells"];
   984	
   985	TimeConstrained[
   986	  UsingFrontEnd[
   987	    nbObj = CreateDocument[$allCells, Visible -> False,
   988	      WindowSize -> {1020, 820}];
   989	    SetOptions[nbObj, StyleDefinitions -> houseStyles];
   990	    NotebookSave[nbObj, outNb];
   991	    Print["wrote evaluated ", outNb, " (", FileByteCount[outNb], " B)"];
   992	    Quiet @ Check[
   993	      Export[outPdf, nbObj];
   994	      Print["wrote ", outPdf, " (", FileByteCount[outPdf], " B)"],
   995	      Print["warn: PDF export failed"]];
   996	    NotebookClose[nbObj];
   997	  ],
   998	  1800,
   999	  Print["warn: notebook save timed out"]
  1000	];

exec
/bin/zsh -lc "nl -ba scripts/digitise_itan_fig3.py && printf '%s\\n' 'TESTS' && nl -ba tests/core.wlt" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	#!/usr/bin/env python3
     2	"""
     3	Digitise Itan 2009 Fig 3 into a numeric posterior-density field on a lat/lon
     4	grid, then compare it quantitatively with our SMC-ABC origin posterior.
     5	
     6	Colour encoding established empirically:
     7	  white (1,1,1)  = sea (no density plotted)
     8	  near-black     = coastlines / graticule / text
     9	  rainbow ramp   = blue -> cyan -> green -> yellow -> red  (low -> high density)
    10	"""
    11	import csv
    12	import numpy as np
    13	from PIL import Image
    14	from scipy.interpolate import PchipInterpolator
    15	
    16	REPO = "/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram"
    17	P = f"{REPO}/docs/images/originals/itan2009_fig3_origin_density.png"
    18	
    19	im = np.asarray(Image.open(P).convert("RGB")).astype(float) / 255.0
    20	H, W, _ = im.shape
    21	
    22	# ---------------------------------------------------------------- georeference
    23	rows = np.array([110., 346., 589., 837., 1088.])
    24	lats = np.array([60., 55., 50., 45., 40.])
    25	row2lat = PchipInterpolator(rows, lats, extrapolate=True)
    26	lat2row = PchipInterpolator(lats[::-1], rows[::-1], extrapolate=True)
    27	def lon_scale(r): return 35.85 + (42.15 - 35.85) * (r - 110.0) / (1290.0 - 110.0)
    28	def lonlat_to_px(lon, lat):
    29	    r = np.asarray(lat2row(lat), dtype=float)
    30	    return 611.0 + lon_scale(r) * np.asarray(lon, dtype=float), r
    31	
    32	# ------------------------------------------------------------- colour -> value
    33	# piecewise-linear rainbow path, densely sampled
    34	def ramp_invert(rgb):
    35	    """Analytic inverse of blue->cyan->green->yellow->red; returns (t, residual)."""
    36	    r, g, b = rgb[:, 0], rgb[:, 1], rgb[:, 2]
    37	    seg0 = (b >= g) & (r < 0.5)                    # blue  -> cyan   (b=1, g up)
    38	    seg1 = (b < g) & (r < 0.5) & (b > 0.02)        # cyan  -> green  (g=1, b down)
    39	    seg3 = (g < r) & (b < 0.5) & (r > 0.5)         # yellow-> red    (r=1, g down)
    40	    seg2 = ~(seg0 | seg1 | seg3)                   # green -> yellow (g=1, r up)
    41	    t = np.empty(len(rgb)); rec = np.empty_like(rgb)
    42	    t[seg0] = g[seg0] / 4.0
    43	    rec[seg0] = np.stack([np.zeros(seg0.sum()), g[seg0], np.ones(seg0.sum())], 1)
    44	    t[seg1] = (2.0 - b[seg1]) / 4.0
    45	    rec[seg1] = np.stack([np.zeros(seg1.sum()), np.ones(seg1.sum()), b[seg1]], 1)
    46	    t[seg2] = (2.0 + r[seg2]) / 4.0
    47	    rec[seg2] = np.stack([r[seg2], np.ones(seg2.sum()), np.zeros(seg2.sum())], 1)
    48	    t[seg3] = (4.0 - g[seg3]) / 4.0
    49	    rec[seg3] = np.stack([np.ones(seg3.sum()), g[seg3], np.zeros(seg3.sum())], 1)
    50	    return t, np.linalg.norm(rgb - rec, axis=1)
    51	
    52	TOP, BOT, LEF, RIG = 112, 1288, 177, 1888
    53	patch = im[TOP:BOT, LEF:RIG]
    54	ph, pw, _ = patch.shape
    55	flat = patch.reshape(-1, 3)
    56	
    57	val, resid = ramp_invert(flat)
    58	
    59	lum = flat.mean(axis=1)
    60	is_white = (flat.min(axis=1) > 0.90)          # sea
    61	is_black = (lum < 0.25) & (flat.max(axis=1) < 0.35)   # ink
    62	on_ramp = (resid < 0.28) & ~is_white & ~is_black
    63	
    64	value = np.where(on_ramp, val, np.nan).reshape(ph, pw)
    65	print(f"plot area {pw}x{ph}; on-ramp pixels: {on_ramp.sum():,} "
    66	      f"({100*on_ramp.mean():.1f}%), sea {100*is_white.mean():.1f}%, "
    67	      f"ink {100*is_black.mean():.1f}%")
    68	
    69	# ------------------------------------------------ resample onto a lat/lon grid
    70	LON = np.arange(-10.0, 32.01, 0.5)
    71	LAT = np.arange(36.0, 60.01, 0.5)
    72	GL, GA = np.meshgrid(LON, LAT)
    73	cc, rr = lonlat_to_px(GL, GA)
    74	ci = np.round(cc - LEF).astype(int)
    75	ri = np.round(rr - TOP).astype(int)
    76	ok = (ci >= 0) & (ci < pw) & (ri >= 0) & (ri < ph)
    77	
    78	itan = np.full(GL.shape, np.nan)
    79	# average a small window to beat anti-aliasing and thin coastlines
    80	for dy in (-2, -1, 0, 1, 2):
    81	    for dx in (-2, -1, 0, 1, 2):
    82	        cj = np.clip(ci + dx, 0, pw - 1); rj = np.clip(ri + dy, 0, ph - 1)
    83	        v = value[rj, cj]
    84	        itan = np.where(np.isnan(itan), v, itan)
    85	itan = np.where(ok, itan, np.nan)
    86	land = ~np.isnan(itan)
    87	print(f"grid {GL.shape}, cells with digitised density: {land.sum()} of {land.size}")
    88	
    89	np.savez(f"{REPO}/data/processed/itan2009_fig3_digitised.npz",
    90	         lon=LON, lat=LAT, value=itan)
    91	
    92	# ---------------------------------------------------------- our own posterior
    93	rows_p = list(csv.DictReader(open(f"{REPO}/data/processed/origin_smc_particles.csv")))
    94	plat = np.array([float(r["OriginLatitude"]) for r in rows_p])
    95	plon = np.array([float(r["OriginLongitude"]) for r in rows_p])
    96	pw_ = np.array([float(r["Weight"]) for r in rows_p]); pw_ /= pw_.sum()
    97	
    98	# weighted Gaussian KDE matching the bandwidth used in the notebook map
    99	bwlon, bwlat = 2.6, 2.0
   100	ours = np.zeros(GL.shape)
   101	for la, lo, w in zip(plat, plon, pw_):
   102	    ours += w * np.exp(-0.5*(((GL-lo)/bwlon)**2 + ((GA-la)/bwlat)**2))
   103	ours = np.where(land, ours, np.nan)
   104	
   105	# ------------------------------------------------------------------ normalise
   106	wgt = np.cos(np.radians(GA))          # equal-area weights
   107	def norm(f):
   108	    g = np.where(np.isnan(f), 0.0, f) * wgt
   109	    return g / g.sum()
   110	Pi = norm(itan)      # Itan, as digitised (assumes contour bands linear in density)
   111	Po = norm(ours)      # ours
   112	
   113	def mode_of(P):
   114	    i = np.unravel_index(np.nanargmax(P), P.shape)
   115	    return LAT[i[0]], LON[i[1]]
   116	
   117	def hpd_mask(P, level):
   118	    flat = P.ravel(); order = np.argsort(-flat)
   119	    cum = np.cumsum(flat[order]); k = np.searchsorted(cum, level) + 1
   120	    m = np.zeros_like(flat, bool); m[order[:k]] = True
   121	    return m.reshape(P.shape)
   122	
   123	def gc_km(la1, lo1, la2, lo2):
   124	    p1, p2 = np.radians(la1), np.radians(la2)
   125	    dl = np.radians(lo2 - lo1)
   126	    return 6371.0*np.arccos(np.clip(np.sin(p1)*np.sin(p2)+np.cos(p1)*np.cos(p2)*np.cos(dl), -1, 1))
   127	
   128	mi, mo = mode_of(Pi), mode_of(Po)
   129	print("\n=== quantitative comparison ===")
   130	print(f"Itan digitised mode : {mi[0]:.1f}N {mi[1]:.1f}E   (paper states ~48.5N, 13E)")
   131	print(f"our posterior mode  : {mo[0]:.1f}N {mo[1]:.1f}E")
   132	print(f"mode separation     : {gc_km(*mi, *mo):.0f} km")
   133	
   134	bc = np.sum(np.sqrt(Pi*Po))
   135	print(f"\nBhattacharyya coefficient : {bc:.3f}   (1 = identical, 0 = disjoint)")
   136	print(f"Hellinger distance        : {np.sqrt(max(0.0,1-bc)):.3f}")
   137	
   138	for lev in (0.50, 0.95):
   139	    mI, mO = hpd_mask(Pi, lev), hpd_mask(Po, lev)
   140	    inter = (mI & mO).sum(); union = (mI | mO).sum()
   141	    print(f"\n{int(lev*100)}% HPD regions:")
   142	    print(f"  Itan area {mI.sum():5d} cells, ours {mO.sum():5d} cells, "
   143	          f"Jaccard overlap {inter/union:.3f}")
   144	    print(f"  our posterior mass inside Itan's {int(lev*100)}% region : {Po[mI].sum():.3f}")
   145	    print(f"  Itan mass inside our {int(lev*100)}% region             : {Pi[mO].sum():.3f}")
   146	
   147	# where does each put its mass, by region?
   148	regions = {
   149	    "Carpathian basin (45-49N,16-23E)": (45, 49, 16, 23),
   150	    "Bavaria/Bohemia  (47-51N,10-17E)": (47, 51, 10, 17),
   151	    "N Germany/Poland (51-55N, 8-20E)": (51, 55, 8, 20),
   152	    "Pontic steppe    (45-52N,25-32E)": (45, 52, 25, 32),
   153	    "France/Iberia    (36-50N,-10-5E)": (36, 50, -10, 5),
   154	    "Scandinavia      (   >55N      )": (55, 61, -10, 32),
   155	}
   156	print("\nposterior mass by region:      Itan(digitised)   ours")
   157	for name, (a, b, c_, d_) in regions.items():
   158	    m = (GA >= a) & (GA < b) & (GL >= c_) & (GL < d_)
   159	    print(f"  {name:34s} {Pi[m].sum():6.3f}        {Po[m].sum():6.3f}")
   160	
   161	# the reported point estimate, treated as a fact rather than an image
   162	c, r = 13.0, 48.5
   163	iy = np.argmin(np.abs(LAT-r)); ix = np.argmin(np.abs(LON-c))
   164	for lev in (0.50, 0.95):
   165	    inside = hpd_mask(Po, lev)[iy, ix]
   166	    print(f"\nItan's REPORTED mode (48.5N,13E) inside our {int(lev*100)}% HPD? {bool(inside)}")
   167	print(f"distance from Itan's reported mode to our mode: "
   168	      f"{gc_km(48.5,13.0,*mo):.0f} km")
TESTS
     1	Get[FileNameJoin[{DirectoryName[DirectoryName[$InputFileName]], "src", "LactasePersistenceSpatial.wl"}]];
     2	
     3	VerificationTest[
     4	  LactasePersistenceSpatial`NormalizeGenotype[" ga "],
     5	  "GA",
     6	  TestID -> "normalize-genotype"
     7	]
     8	
     9	VerificationTest[
    10	  LactasePersistenceSpatial`DerivedAlleleCopies["GA"],
    11	  1,
    12	  TestID -> "derived-copy-count"
    13	]
    14	
    15	VerificationTest[
    16	  LactasePersistenceSpatial`DerivedAlleleCopies["GT"],
    17	  1,
    18	  TestID -> "derived-copy-count-t-strand-notation"
    19	]
    20	
    21	VerificationTest[
    22	  LactasePersistenceSpatial`CalledAlleleCount["G"],
    23	  1,
    24	  TestID -> "single-read-called-allele-count"
    25	]
    26	
    27	VerificationTest[
    28	  LactasePersistenceSpatial`AssignRegion["United Kingdom", 52.1, -1.5],
    29	  "British Isles",
    30	  TestID -> "british-region"
    31	]
    32	
    33	VerificationTest[
    34	  LactasePersistenceSpatial`AssignRegion["Germany", 50.5, 8.1],
    35	  "Rhine-Danube",
    36	  TestID -> "rhine-danube-region"
    37	]
    38	
    39	VerificationTest[
    40	  LactasePersistenceSpatial`AssignRegion["Spain", 40.4, -3.7],
    41	  "Mediterranean",
    42	  TestID -> "mediterranean-region"
    43	]
    44	
    45	VerificationTest[
    46	  LactasePersistenceSpatial`AssignRegion["Latvia", 56.9, 24.1],
    47	  "Baltic",
    48	  TestID -> "baltic-region"
    49	]
    50	
    51	VerificationTest[
    52	  Module[{row},
    53	    row = <|
    54	      "version_id" -> "I1",
    55	      "master_id" -> "I1",
    56	      "publication" -> "Fixture",
    57	      "publication_year" -> 2026,
    58	      "dr_group_id" -> "Fixture_Group",
    59	      "locality" -> "Fixture",
    60	      "country" -> "Germany",
    61	      "lat" -> "51.0",
    62	      "long" -> "8.0",
    63	      "mean_date" -> "4200",
    64	      "date_range" -> "2500-2200 BCE",
    65	      "rs4988235_depth" -> 3,
    66	      "rs4988235_most_likely_genotype" -> "GA"
    67	    |>;
    68	    Lookup[LactasePersistenceSpatial`CleanSampleRow[row], {"DerivedAlleles", "CalledAlleles", "Region"}]
    69	  ],
    70	  {1, 2, "Rhine-Danube"},
    71	  TestID -> "clean-sample-row"
    72	]
    73	
    74	VerificationTest[
    75	  Module[{row, sample},
    76	    row = <|
    77	      "version_id" -> "I2",
    78	      "master_id" -> "I2",
    79	      "publication" -> "Fixture",
    80	      "publication_year" -> 2026,
    81	      "dr_group_id" -> "Italy_Sicily_MN",
    82	      "locality" -> "Sicily",
    83	      "country" -> "Italy",
    84	      "lat" -> 37724.,
    85	      "long" -> 12916.,
    86	      "mean_date" -> 6832,
    87	      "date_range" -> "4987-4794 calBCE",
    88	      "rs4988235_depth" -> 31,
    89	      "rs4988235_most_likely_genotype" -> "GG"
    90	    |>;
    91	    sample = LactasePersistenceSpatial`CleanSampleRow[row];
    92	    Round[Lookup[sample, {"Latitude", "Longitude"}], 0.001]
    93	  ],
    94	  {37.724, 12.916},
    95	  TestID -> "scaled-coordinate-normalization"
    96	]
    97	
    98	VerificationTest[
    99	  LactasePersistenceSpatial`LogisticProbability[-6, 1.2, 3000] > LactasePersistenceSpatial`LogisticProbability[-6, 1.2, 8000],
   100	  True,
   101	  TestID -> "logistic-increases-toward-present"
   102	]
   103	
   104	VerificationTest[
   105	  Module[{grid = LactasePersistenceSpatial`BuildEuropeGrid[]},
   106	    Length[grid] > 20 && AllTrue[grid, KeyExistsQ[#, "DairyingOnsetBP"] &]
   107	  ],
   108	  True,
   109	  TestID -> "grid-builds"
   110	]
   111	
   112	VerificationTest[
   113	  Module[{grid = LactasePersistenceSpatial`BuildEuropeGrid[], traj},
   114	    traj = LactasePersistenceSpatial`SimulateSpatialTrajectory[
   115	      <|"InitialFrequency" -> 0.003, "SelectionBase" -> 0.001,
   116	        "SelectionDairying" -> 0.02, "Migration" -> 0.002|>,
   117	      grid,
   118	      "StartBP" -> 10000,
   119	      "EndBP" -> 9500,
   120	      "TimeStepYears" -> 250
   121	    ];
   122	    Length[traj["TimesBP"]] == 3 && Length[traj["Frequencies"][[1]]] == Length[grid]
   123	  ],
   124	  True,
   125	  TestID -> "spatial-simulator-shape"
   126	]
   127	
   128	VerificationTest[
   129	  Module[{predictor, value},
   130	    predictor = LactasePersistenceSpatial`OrdinaryKrigingPredictor[
   131	      {{0., 0.}, {1., 0.}, {0., 1.}},
   132	      {0.05, 0.2, 0.35}
   133	    ];
   134	    value = predictor[{0.25, 0.25}];
   135	    NumericQ[value] && 0 <= value <= 1
   136	  ],
   137	  True,
   138	  TestID -> "ordinary-kriging-predictor-bounded"
   139	]
   140	
   141	VerificationTest[
   142	  Module[{v = LactasePersistenceSpatial`Private`PriorVectorSample[]},
   143	    LactasePersistenceSpatial`Private`PriorInSupportQ[v]
   144	  ],
   145	  True,
   146	  TestID -> "prior-sample-in-support"
   147	]
   148	
   149	VerificationTest[
   150	  Module[{params},
   151	    params = LactasePersistenceSpatial`Private`ParamsFromVector[
   152	      LactasePersistenceSpatial`Private`PriorVectorSample[]];
   153	    0 < params["InitialFrequency"] < 1 && KeyExistsQ[params, "Migration"] &&
   154	      ! KeyExistsQ[params, "Log10InitialFrequency"]
   155	  ],
   156	  True,
   157	  TestID -> "params-from-vector"
   158	]
   159	
   160	VerificationTest[
   161	  Round[LactasePersistenceSpatial`WilsonInterval[5, 10], 0.001],
   162	  {0.237, 0.763},
   163	  TestID -> "wilson-interval"
   164	]
   165	
   166	VerificationTest[
   167	  LactasePersistenceSpatial`Private`WeightedQuantile[{1., 2., 3., 4.}, {1., 1., 1., 1.}, 0.5],
   168	  2.,
   169	  TestID -> "weighted-quantile-median"
   170	]
   171	
   172	VerificationTest[
   173	  Module[{obj, ses},
   174	    obj[a_?NumericQ, b_?NumericQ] := -(a^2 + 2 b^2);
   175	    ses = LactasePersistenceSpatial`Private`LogisticFitStandardErrors[obj, 0., 0.];
   176	    Round[ses, 0.001]
   177	  ],
   178	  {0.707, 0.5},
   179	  TestID -> "logistic-standard-errors"
   180	]
   181	
   182	VerificationTest[
   183	  Module[{index, stats},
   184	    index = {
   185	      <|"CellIndex" -> 1, "TimeBP" -> 3000., "Called" -> 10, "Derived" -> 6,
   186	        "Latitude" -> 55., "Longitude" -> 0.|>,
   187	      <|"CellIndex" -> 2, "TimeBP" -> 3200., "Called" -> 10, "Derived" -> 1,
   188	        "Latitude" -> 40., "Longitude" -> 20.|>
   189	    };
   190	    stats = LactasePersistenceSpatial`Private`ObservedGradientStatistics[index];
   191	    {Round[stats["NorthSouth"], 0.01], stats["NorthSouthWeight"]}
   192	  ],
   193	  {0.5, 10},
   194	  TestID -> "gradient-statistics"
   195	]
   196	
   197	VerificationTest[
   198	  Module[{g0, gShift},
   199	    g0 = LactasePersistenceSpatial`BuildEuropeGrid[4, 0];
   200	    gShift = LactasePersistenceSpatial`BuildEuropeGrid[4, -400];
   201	    Round[g0[[1, "DairyingOnsetBP"]] - gShift[[1, "DairyingOnsetBP"]]]
   202	  ],
   203	  400,
   204	  TestID -> "grid-onset-shift"
   205	]
   206	
   207	VerificationTest[
   208	  Module[{grid, samples, obsData, traj, d},
   209	    grid = LactasePersistenceSpatial`BuildEuropeGrid[];
   210	    samples = {
   211	      <|"HasCall" -> True, "Latitude" -> 50., "Longitude" -> 8., "MeanDateBP" -> 4200.,
   212	        "CalledAlleles" -> 2, "DerivedAlleles" -> 1, "Region" -> "Rhine-Danube"|>,
   213	      <|"HasCall" -> True, "Latitude" -> 40., "Longitude" -> 15., "MeanDateBP" -> 6800.,
   214	        "CalledAlleles" -> 2, "DerivedAlleles" -> 0, "Region" -> "Mediterranean"|>
   215	    };
   216	    obsData = LactasePersistenceSpatial`ExtendedObservedData[samples, grid];
   217	    traj = LactasePersistenceSpatial`SimulateSpatialTrajectory[
   218	      <|"InitialFrequency" -> 0.003, "SelectionBase" -> 0.002,
   219	        "SelectionDairying" -> 0.02, "Migration" -> 0.003|>, grid];
   220	    d = LactasePersistenceSpatial`ExtendedDistance[obsData, traj, grid];
   221	    NumericQ[d] && d >= 0
   222	  ],
   223	  True,
   224	  TestID -> "extended-distance-numeric"
   225	]
   226	
   227	VerificationTest[
   228	  Module[{grid, samples, smc},
   229	    grid = LactasePersistenceSpatial`BuildEuropeGrid[8];
   230	    samples = Flatten@Table[
   231	      <|"HasCall" -> True, "Latitude" -> lat, "Longitude" -> lon, "MeanDateBP" -> bp,
   232	        "CalledAlleles" -> 4, "DerivedAlleles" -> If[bp < 4000, 1, 0],
   233	        "Region" -> LactasePersistenceSpatial`AssignRegion["", lat, lon]|>,
   234	      {lat, {42., 50., 56.}}, {lon, {0., 12.}}, {bp, {2600., 5400., 7400.}}
   235	    ];
   236	    smc = LactasePersistenceSpatial`RunSMCABC[samples, grid,
   237	      "Particles" -> 12, "Generations" -> 2, "Seed" -> 7];
   238	    Length[smc["Weights"]] == 12 && Abs[Total[smc["Weights"]] - 1.] < 10^-8 &&
   239	      Length[smc["EpsilonHistory"]] >= 1 && smc["TotalSimulations"] >= 12
   240	  ],
   241	  True,
   242	  TestID -> "smc-abc-smoke"
   243	]
   244	
   245	VerificationTest[
   246	  Module[{smc},
   247	    smc = <|"Weights" -> {0.5, 0.5}, "Particles" -> {<|"A" -> 1|>, <|"A" -> 2|>}|>;
   248	    Length[LactasePersistenceSpatial`ResamplePosterior[smc, 5]]
   249	  ],
   250	  5,
   251	  TestID -> "resample-posterior-count"
   252	]

exec
/bin/zsh -lc "rg -c 'VerificationTest\\[' tests/core.wlt && rg -n 'TestID' tests/core.wlt" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
24
6:  TestID -> "normalize-genotype"
12:  TestID -> "derived-copy-count"
18:  TestID -> "derived-copy-count-t-strand-notation"
24:  TestID -> "single-read-called-allele-count"
30:  TestID -> "british-region"
36:  TestID -> "rhine-danube-region"
42:  TestID -> "mediterranean-region"
48:  TestID -> "baltic-region"
71:  TestID -> "clean-sample-row"
95:  TestID -> "scaled-coordinate-normalization"
101:  TestID -> "logistic-increases-toward-present"
109:  TestID -> "grid-builds"
125:  TestID -> "spatial-simulator-shape"
138:  TestID -> "ordinary-kriging-predictor-bounded"
146:  TestID -> "prior-sample-in-support"
157:  TestID -> "params-from-vector"
163:  TestID -> "wilson-interval"
169:  TestID -> "weighted-quantile-median"
179:  TestID -> "logistic-standard-errors"
194:  TestID -> "gradient-statistics"
204:  TestID -> "grid-onset-shift"
224:  TestID -> "extended-distance-numeric"
242:  TestID -> "smc-abc-smoke"
251:  TestID -> "resample-posterior-count"

exec
/bin/zsh -lc "python3 -c 'import csv,glob,os,collections; fs=sorted(glob.glob(\"data/processed/*.csv\"));
for f in fs:
 with open(f,newline=\"\") as h:
  r=csv.reader(h); rows=list(r)
 print(os.path.basename(f), \"rows=\",len(rows)-1,\"cols=\",len(rows[0]) if rows else 0)
 print(\"  \"+\" | \".join(rows[0] if rows else []))'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
abc_posterior.csv rows= 100 cols= 11
  InitialLatitudeGradient | InitialLongitudeGradient | SelectionBase | SelectionDairying | Migration | SelectionMultiplierBritishIsles | SelectionMultiplierRhineDanube | SelectionMultiplierMediterranean | SelectionMultiplierBaltic | InitialFrequency | Distance
cross_validation_by_region.csv rows= 4 cols= 6
  HeldOutRegion | HeldOutBins | RMSE | Coverage95 | FinalEpsilon | TotalSimulations
glad_rs4988235_called_samples.csv rows= 1785 cols= 19
  VersionID | SampleID | Publication | PublicationYear | DataGroupID | Locality | Country | Latitude | Longitude | MeanDateBP | DateRange | RS4988235Depth | RS4988235Genotype | CalledAlleles | DerivedAlleles | DerivedAlleleFrequency | Region | DairyingOnsetBP | HasCall
glad_rs4988235_samples.csv rows= 2999 cols= 19
  VersionID | SampleID | Publication | PublicationYear | DataGroupID | Locality | Country | Latitude | Longitude | MeanDateBP | DateRange | RS4988235Depth | RS4988235Genotype | CalledAlleles | DerivedAlleles | DerivedAlleleFrequency | Region | DairyingOnsetBP | HasCall
itan2009_origin_density_digitised.csv rows= 2260 cols= 3
  Longitude | Latitude | RelativeDensity
origin_mode_stability.csv rows= 11 cols= 4
  Estimator | Bandwidth | ModeLatitude | ModeLongitude
origin_posterior_quantiles.csv rows= 11 cols= 6
  Parameter | Lower95 | Q25 | Median | Q75 | Upper95
origin_smc_diagnostics.csv rows= 6 cols= 4
  Generation | Epsilon | AcceptanceRate | ESS
origin_smc_particles.csv rows= 800 cols= 13
  OriginLatitude | OriginLongitude | OriginTimeBP | SelectionBase | SelectionDairying | Migration | SelectionMultiplierBritishIsles | SelectionMultiplierRhineDanube | SelectionMultiplierMediterranean | SelectionMultiplierBaltic | InjectFrequency | Distance | Weight
posterior_parameter_quantiles.csv rows= 10 cols= 6
  Parameter | Lower95 | Q25 | Median | Q75 | Upper95
posterior_predictive_regional.csv rows= 37 cols= 10
  Region | TimeBinMidBP | ObservedFrequency | CalledAlleles | LatentFrequencyMean | PosteriorMean | PosteriorMedian | Lower95 | Upper95 | Covered95
regional_logistic_fits.csv rows= 4 cols= 15
  Region | Status | SampleCount | CalledAlleles | DerivedAlleles | Alpha | BetaPerKyrTowardPresent | SelectionPerGenerationApprox | LogLikelihood | AlphaSE | BetaSE | AtParameterBound | FrequencyAt8000BP | FrequencyAt3000BP | FrequencyAtPresent
regional_time_binned_frequencies.csv rows= 48 cols= 7
  Region | TimeBinStartBP | TimeBinMidBP | CalledAlleles | DerivedAlleles | Frequency | SampleCount
sensitivity_posterior_quantiles.csv rows= 20 cols= 5
  Scenario | Parameter | Lower95 | Median | Upper95
smc_diagnostics.csv rows= 5 cols= 4
  Generation | Epsilon | AcceptanceRate | ESS
smc_particles.csv rows= 400 cols= 12
  InitialLatitudeGradient | InitialLongitudeGradient | SelectionBase | SelectionDairying | Migration | SelectionMultiplierBritishIsles | SelectionMultiplierRhineDanube | SelectionMultiplierMediterranean | SelectionMultiplierBaltic | InitialFrequency | Distance | Weight
time_slice_posterior_predictive.csv rows= 7 cols= 10
  Region | TimeBinMidBP | ObservedFrequency | CalledAlleles | LatentFrequencyMean | PosteriorMean | PosteriorMedian | Lower95 | Upper95 | Covered95
time_slice_validation.csv rows= 1 cols= 6
  CutBP | HeldOutBins | TrainingSamples | RMSE | Coverage95 | TotalSimulations

exec
/bin/zsh -lc "for f in data/processed/cross_validation_by_region.csv data/processed/origin_mode_stability.csv data/processed/origin_posterior_quantiles.csv data/processed/origin_smc_diagnostics.csv data/processed/posterior_parameter_quantiles.csv data/processed/posterior_predictive_regional.csv data/processed/regional_logistic_fits.csv data/processed/regional_time_binned_frequencies.csv data/processed/sensitivity_posterior_quantiles.csv data/processed/smc_diagnostics.csv data/processed/time_slice_posterior_predictive.csv data/processed/time_slice_validation.csv; do printf '\\n%s\\n' \""'$f"; nl -ba "$f"; done' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:

data/processed/cross_validation_by_region.csv
     1	"HeldOutRegion","HeldOutBins","RMSE","Coverage95","FinalEpsilon","TotalSimulations"
     2	"British Isles",5,0.08968418252487845,1,0.05017144531033286,840
     3	"Rhine-Danube",10,0.06493814322382853,1,0.0493997370524844,840
     4	"Mediterranean",13,0.023622679386335187,1,0.04661228277425687,1320
     5	"Baltic",9,0.24004514420840695,1,0.04345619108371249,1080

data/processed/origin_mode_stability.csv
     1	Estimator,Bandwidth,ModeLatitude,ModeLongitude
     2	"weighted, all 800",1.6/1.2,52.5,10.0
     3	"weighted, all 800",2.0/1.6,44.5,-0.5
     4	"weighted, all 800",2.6/2.0,44.0,-0.5
     5	"weighted, all 800",3.2/2.6,44.0,-0.5
     6	"weighted, all 800",4.0/3.2,43.0,-0.5
     7	"resampled 400, seed 0",2.6/2.0,52.0,10.0
     8	"resampled 400, seed 1",2.6/2.0,52.0,10.0
     9	"resampled 400, seed 2",2.6/2.0,44.5,-0.5
    10	"resampled 400, seed 3",2.6/2.0,44.5,-1.0
    11	"resampled 400, seed 4",2.6/2.0,39.5,-4.5
    12	"resampled 400, seed 5",2.6/2.0,44.0,-0.5

data/processed/origin_posterior_quantiles.csv
     1	"Parameter","Lower95","Q25","Median","Q75","Upper95"
     2	"OriginLatitude",36.532654771486975,41.36295762452626,45.83146504443139,51.38642517770411,58.52434398025669
     3	"OriginLongitude",-7.218501439039128,2.319154614370383,10.190650284847138,21.14728022537714,33.15347529841399
     4	"OriginTimeBP",6807.7923405014835,6974.451724042083,7220.134721859113,7656.23333110707,8525.950738675418
     5	"Log10InjectFrequency",-2.9271824956670898,-2.459906272199956,-1.8937279383929433,-1.4537438564114833,-1.0823864409280797
     6	"SelectionBase",0.00039630111933540945,0.0045468192345941095,0.007649636926264396,0.011451419615475618,0.014806371524982868
     7	"SelectionDairying",0.012787546149774209,0.02417817292760035,0.03093100898643031,0.03949363721348708,0.053855390798653015
     8	"Migration",0.0396079722115624,0.14644745024398298,0.3487742921015955,0.4545936329131199,0.5878965402852386
     9	"SelectionMultiplierBritishIsles",0.8543267942722166,1.092875857810566,1.4986585075234602,1.899025182574073,2.1667670005746396
    10	"SelectionMultiplierRhineDanube",0.6596732270605454,0.8501736385368758,1.1793421556974595,1.384023135753913,1.7728532582802794
    11	"SelectionMultiplierMediterranean",0.43941920415322855,0.5665376013646641,0.785086434776691,0.9767424131369297,1.3359497870019232
    12	"SelectionMultiplierBaltic",0.8648750436016011,1.2763949507895151,1.6048812045913534,2.1037241438488947,2.355987775886356

data/processed/origin_smc_diagnostics.csv
     1	"Generation","Epsilon","AcceptanceRate","ESS"
     2	1,3.613699093682798,1,800
     3	2,0.06108474892760456,0.25,50.649284724612755
     4	3,0.05285955665108026,0.25,19.09554569870688
     5	4,0.04939756556189664,0.16666666666666666,30.524440352670457
     6	5,0.044348517643937956,0.1,20.959422794297563
     7	6,0.04204896009134267,0.07142857142857142,68.68734850212515

data/processed/posterior_parameter_quantiles.csv
     1	"Parameter","Lower95","Q25","Median","Q75","Upper95"
     2	"Log10InitialFrequency",-4.181155939483398,-3.3573780989048174,-3.0907198368039,-2.0991334730214395,-1.638084110714583
     3	"InitialLatitudeGradient",-0.007690885864167735,-0.003593980147026464,-0.0015777657515412095,0.0021903276989907773,0.010784425727089528
     4	"InitialLongitudeGradient",-0.007612900327765399,-0.004412074692804864,-0.0019210774119858822,0.0027629752096439628,0.007396281282905632
     5	"SelectionBase",0.00014658770787030713,0.001501852778620053,0.004409215452985962,0.008582467236375096,0.013840125651928843
     6	"SelectionDairying",0.0016053558007144446,0.005152950602351832,0.010316260515146926,0.014195119904563758,0.025765212446223956
     7	"Migration",0.0002085128443453891,0.004060043269433821,0.009041160176976029,0.012731358282305151,0.014811011272594734
     8	"SelectionMultiplierBritishIsles",0.8114861652900159,1.1377606814188757,1.3772504174689013,1.861799597999674,2.189504434267116
     9	"SelectionMultiplierRhineDanube",0.6320225321447254,0.9788646459393671,1.2170308160754963,1.4612209395987898,1.7685612309614491
    10	"SelectionMultiplierMediterranean",0.40928294735626963,0.5245885140967107,0.6252686279833334,0.9417550066329846,1.3759358451848158
    11	"SelectionMultiplierBaltic",0.8123345852374981,1.0570894654573397,1.274810666873238,1.8644879697025074,2.334225807017333

data/processed/posterior_predictive_regional.csv
     1	"Region","TimeBinMidBP","ObservedFrequency","CalledAlleles","LatentFrequencyMean","PosteriorMean","PosteriorMedian","Lower95","Upper95","Covered95"
     2	"Baltic",1500,0.5,2,0.15732379490862564,0.16875,0,0,1,true
     3	"Baltic",2500,0.5,2,0.09469115049921616,0.0925,0,0,1,true
     4	"Baltic",3500,0,4,0.05142517927742446,0.0525,0,0,0.5,true
     5	"Baltic",4500,0.13636363636363635,22,0.0269058842775726,0.026590909090909092,0,0,0.13636363636363635,true
     6	"Baltic",5500,0,12,0.014533671089967073,0.015,0,0,0.16666666666666666,true
     7	"Baltic",6500,0,9,0.009198539887034937,0.008055555555555555,0,0,0.1111111111111111,true
     8	"Baltic",7500,0,34,0.007143763858385007,0.007279411764705882,0,0,0.058823529411764705,true
     9	"Baltic",8500,0,2,0.005979769850400334,0.0025,0,0,0,true
    10	"Baltic",9500,0,2,0.0051786069098895505,0.00875,0,0,0,true
    11	"British Isles",2500,0.4,5,0.12352859024076937,0.1275,0,0,0.6,true
    12	"British Isles",3500,0.06493506493506493,77,0.05800986144505575,0.05944805194805195,0.03896103896103896,0,0.2077922077922078,true
    13	"British Isles",4500,0.014705882352941176,68,0.026128890064429963,0.026544117647058822,0.014705882352941176,0,0.08823529411764706,true
    14	"British Isles",5500,0.007407407407407408,135,0.012807379013147213,0.013092592592592593,0.007407407407407408,0,0.044444444444444446,true
    15	"British Isles",6500,0,19,0.007873794532705059,0.007894736842105263,0,0,0.05263157894736842,true
    16	"Mediterranean",500,0.21153846153846154,52,0.12474207253117758,0.12567307692307692,0.11538461538461539,0.019230769230769232,0.3076923076923077,true
    17	"Mediterranean",1500,0.07758620689655173,116,0.07946863295912958,0.0797198275862069,0.06896551724137931,0.008620689655172414,0.1896551724137931,true
    18	"Mediterranean",2500,0.06557377049180328,61,0.04935875994793416,0.04942622950819672,0.04918032786885246,0,0.13114754098360656,true
    19	"Mediterranean",3500,0.016,125,0.03083107264116907,0.03054,0.032,0,0.08,true
    20	"Mediterranean",4500,0.005649717514124294,177,0.01978150539589932,0.01961864406779661,0.01694915254237288,0,0.06779661016949153,true
    21	"Mediterranean",5500,0,76,0.013127790457238407,0.01299342105263158,0.013157894736842105,0,0.05263157894736842,true
    22	"Mediterranean",6500,0.016666666666666666,60,0.009030586153983933,0.009333333333333334,0,0,0.05,true
    23	"Mediterranean",7500,0,74,0.006631203360525544,0.006722972972972973,0,0,0.04054054054054054,true
    24	"Mediterranean",8500,0,68,0.0055718904345325206,0.005955882352941176,0,0,0.04411764705882353,true
    25	"Mediterranean",9500,0,10,0.005016408272454571,0.00525,0,0,0.1,true
    26	"Mediterranean",10500,0,12,0.004793137087262115,0.004375,0,0,0.08333333333333333,true
    27	"Mediterranean",11500,0,3,0.004793137087262115,0.005833333333333334,0,0,0,true
    28	"Mediterranean",24500,0,2,0.004793137087262115,0.00375,0,0,0,true
    29	"Rhine-Danube",2500,0.2,10,0.10172759246573565,0.1015,0.1,0,0.4,true
    30	"Rhine-Danube",3500,0.038461538461538464,52,0.05282439820893722,0.054375,0.038461538461538464,0,0.15384615384615385,true
    31	"Rhine-Danube",4500,0.04721030042918455,233,0.027447019682204775,0.027993562231759656,0.02575107296137339,0,0.07725321888412018,true
    32	"Rhine-Danube",5500,0.017543859649122806,57,0.014942089407780957,0.016578947368421054,0.017543859649122806,0,0.07017543859649122,true
    33	"Rhine-Danube",6500,0,122,0.00873649595788677,0.008463114754098361,0.00819672131147541,0,0.040983606557377046,true
    34	"Rhine-Danube",7500,0,101,0.006012952153002987,0.005643564356435643,0,0,0.0297029702970297,true
    35	"Rhine-Danube",8500,0,6,0.005094077585130343,0.0033333333333333335,0,0,0,true
    36	"Rhine-Danube",9500,0,5,0.004600280374013086,0.004,0,0,0,true
    37	"Rhine-Danube",10500,0,2,0.00440247796376739,0.005,0,0,0,true
    38	"Rhine-Danube",14500,0,2,0.00440247796376739,0.005,0,0,0,true

data/processed/regional_logistic_fits.csv
     1	"Region","Status","SampleCount","CalledAlleles","DerivedAlleles","Alpha","BetaPerKyrTowardPresent","SelectionPerGenerationApprox","LogLikelihood","AlphaSE","BetaSE","AtParameterBound","FrequencyAt8000BP","FrequencyAt3000BP","FrequencyAtPresent"
     2	"British Isles","OK",171,304,9,-12.020730478021978,1.4630872752042627,0.040966443705719356,-34.591879292109894,3.2443055408742807,0.514497095555407,false,0.00011226277866653531,0.14441188568164542,0.9315114736093063
     3	"Rhine-Danube","OK",341,591,16,-8.599910263366063,0.9359065892868818,0.02620538450003269,-64.9731387110842,1.5843090312711543,0.26527296481637924,false,0.0011953775794894892,0.11419754753048382,0.6811703837497978
     4	"Mediterranean","OK",486,837,28,-9.541741992692279,0.8645456992890066,0.024207279580092184,-96.8095923540762,1.346692621785073,0.1627000624843816,false,0.0004044206145279102,0.029600341776274332,0.2898145289330023
     5	"Baltic","OK",56,90,5,-7.547628829437066,0.8966770288085025,0.025106956806638072,-13.704145614757188,2.0138275817265834,0.314852942807572,false,0.003159192049378136,0.21910500051863457,0.8052037889264033

data/processed/regional_time_binned_frequencies.csv
     1	"Region","TimeBinStartBP","TimeBinMidBP","CalledAlleles","DerivedAlleles","Frequency","SampleCount"
     2	"Baltic",0,500,1,0,0,1
     3	"Baltic",1000,1500,2,1,0.5,1
     4	"Baltic",2000,2500,2,1,0.5,2
     5	"Baltic",3000,3500,4,0,0,3
     6	"Baltic",4000,4500,22,3,0.13636363636363635,16
     7	"Baltic",5000,5500,12,0,0,7
     8	"Baltic",6000,6500,9,0,0,5
     9	"Baltic",7000,7500,34,0,0,19
    10	"Baltic",8000,8500,2,0,0,1
    11	"Baltic",9000,9500,2,0,0,1
    12	"British Isles",2000,2500,5,2,0.4,3
    13	"British Isles",3000,3500,77,5,0.06493506493506493,41
    14	"British Isles",4000,4500,68,1,0.014705882352941176,38
    15	"British Isles",5000,5500,135,1,0.007407407407407408,79
    16	"British Isles",6000,6500,19,0,0,10
    17	"Mediterranean",0,500,52,11,0.21153846153846154,31
    18	"Mediterranean",1000,1500,116,9,0.07758620689655173,75
    19	"Mediterranean",2000,2500,61,4,0.06557377049180328,37
    20	"Mediterranean",3000,3500,125,2,0.016,70
    21	"Mediterranean",4000,4500,177,1,0.005649717514124294,100
    22	"Mediterranean",5000,5500,76,0,0,44
    23	"Mediterranean",6000,6500,60,1,0.016666666666666666,33
    24	"Mediterranean",7000,7500,74,0,0,44
    25	"Mediterranean",8000,8500,68,0,0,36
    26	"Mediterranean",9000,9500,10,0,0,6
    27	"Mediterranean",10000,10500,12,0,0,6
    28	"Mediterranean",11000,11500,3,0,0,2
    29	"Mediterranean",13000,13500,1,0,0,1
    30	"Mediterranean",24000,24500,2,0,0,1
    31	"Other Europe",0,500,1,0,0,1
    32	"Other Europe",2000,2500,16,2,0.125,12
    33	"Other Europe",3000,3500,3,0,0,2
    34	"Other Europe",4000,4500,24,0,0,13
    35	"Other Europe",5000,5500,19,0,0,12
    36	"Other Europe",6000,6500,4,0,0,2
    37	"Other Europe",7000,7500,9,0,0,6
    38	"Other Europe",8000,8500,3,0,0,2
    39	"Rhine-Danube",1000,1500,1,0,0,1
    40	"Rhine-Danube",2000,2500,10,2,0.2,8
    41	"Rhine-Danube",3000,3500,52,2,0.038461538461538464,29
    42	"Rhine-Danube",4000,4500,233,11,0.04721030042918455,133
    43	"Rhine-Danube",5000,5500,57,1,0.017543859649122806,32
    44	"Rhine-Danube",6000,6500,122,0,0,67
    45	"Rhine-Danube",7000,7500,101,0,0,62
    46	"Rhine-Danube",8000,8500,6,0,0,3
    47	"Rhine-Danube",9000,9500,5,0,0,4
    48	"Rhine-Danube",10000,10500,2,0,0,1
    49	"Rhine-Danube",14000,14500,2,0,0,1

data/processed/sensitivity_posterior_quantiles.csv
     1	"Scenario","Parameter","Lower95","Median","Upper95"
     2	"Baseline","Log10InitialFrequency",-4.195404293530352,-3.444605485687857,-2.0403672255850562
     3	"Baseline","SelectionBase",0.0008284948679365109,0.0071775006875669555,0.012388546360952508
     4	"Baseline","SelectionDairying",0.002221458865618797,0.003944708565617494,0.018156617467316925
     5	"Baseline","Migration",0.0004967600452462109,0.0071625266315972725,0.013866814137076244
     6	"NarrowSelection","Log10InitialFrequency",-4.156707503316994,-3.1785177698792846,-1.6150449045505075
     7	"NarrowSelection","SelectionBase",0.00019903985755589612,0.0028752830476184575,0.007816711046719787
     8	"NarrowSelection","SelectionDairying",0.0008798560026460643,0.013999441656651545,0.026565507376132495
     9	"NarrowSelection","Migration",0.000060248002754497954,0.012966053523138482,0.014364720239183802
    10	"WideMigration","Log10InitialFrequency",-4.113164135966076,-2.579621127794705,-2.105554699912759
    11	"WideMigration","SelectionBase",0.000027696033897498063,0.00329649852343019,0.013190780537524963
    12	"WideMigration","SelectionDairying",0.0002670131822031803,0.0048627696435165355,0.021759203510636323
    13	"WideMigration","Migration",0.0025488129146599855,0.005390126693484875,0.029243328305902136
    14	"EarlierDairying","Log10InitialFrequency",-4.181125415318097,-3.440813267849506,-2.1364791032596266
    15	"EarlierDairying","SelectionBase",0.00021323762018618192,0.007895729310344652,0.01243238746544501
    16	"EarlierDairying","SelectionDairying",0.0002352901574939837,0.002058676177724154,0.02552474266828279
    17	"EarlierDairying","Migration",0.00041033312885047687,0.0074629471342744485,0.014693303518170565
    18	"LaterDairying","Log10InitialFrequency",-4.116816945169425,-2.5787752199256815,-2.10255516140331
    19	"LaterDairying","SelectionBase",0.000028162526003137462,0.003296199633436506,0.013580149998774911
    20	"LaterDairying","SelectionDairying",0.00026715291918759403,0.003763301236307045,0.02175824874772882
    21	"LaterDairying","Migration",0.0012670691058360296,0.002685248449804276,0.01462418414977075

data/processed/smc_diagnostics.csv
     1	"Generation","Epsilon","AcceptanceRate","ESS"
     2	1,0.25816711449199126,1,400
     3	2,0.05296803456920254,0.25,15.682274374263136
     4	3,0.04831993669618505,0.25,46.0478508132909
     5	4,0.04393767212141695,0.25,16.02014629904246
     6	5,0.04080321918842591,0.125,26.570633832685978

data/processed/time_slice_posterior_predictive.csv
     1	"Region","TimeBinMidBP","ObservedFrequency","CalledAlleles","LatentFrequencyMean","PosteriorMean","PosteriorMedian","Lower95","Upper95","Covered95"
     2	"Baltic",1500,0.5,2,0.28674332147598336,0.27708333333333335,0,0,1,true
     3	"Baltic",2500,0.5,2,0.18979622801697724,0.19791666666666666,0,0,1,true
     4	"British Isles",2500,0.4,5,0.07021794985095275,0.0625,0,0,0.4,true
     5	"Mediterranean",500,0.21153846153846154,52,0.12495096234071575,0.12355769230769231,0.11538461538461539,0,0.28846153846153844,true
     6	"Mediterranean",1500,0.07758620689655173,116,0.07199793641486193,0.0728448275862069,0.07758620689655173,0,0.16379310344827586,true
     7	"Mediterranean",2500,0.06557377049180328,61,0.039922963452755277,0.0407103825136612,0.03278688524590164,0,0.13114754098360656,true
     8	"Rhine-Danube",2500,0.2,10,0.059115531822672485,0.060833333333333336,0,0,0.3,true

data/processed/time_slice_validation.csv
     1	"CutBP","HeldOutBins","TrainingSamples","RMSE","Coverage95","TotalSimulations"
     2	2500,7,1543,0.3185504091022118,1,1080

exec
/bin/zsh -lc "rg -n \"origin_posterior_quantiles|origin_mode_stability|itan2009_origin_density_digitised|Bhattacharyya|0\\.62|0\\.10|0\\.36|0\\.039|636 called|exactly one|39 bins|37 bins|10,000|0\\.008|0\\.019|0\\.020|0\\.010|0\\.97\" . --glob '"'!community/*.nb'"' --glob '"'!community/*.pdf'"' --glob '"'!figures/**'"' --glob '"'!data/processed/*.csv'"' --glob '"'!data/processed/*.npz'"'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
./src/LactasePersistenceSpatial.wl:515:         PointSize[0.010 + 0.012 Sqrt[b["CalledAlleles"]/250.]],
./src/LactasePersistenceSpatial.wl:711:  "InitialLatitudeGradient" -> {-0.008, 0.012},
./src/LactasePersistenceSpatial.wl:712:  "InitialLongitudeGradient" -> {-0.008, 0.008},
./src/LactasePersistenceSpatial.wl:795:          "Upper95" -> N[Quantile[predictive, 0.975]],
./src/LactasePersistenceSpatial.wl:796:          "Covered95" -> (Quantile[predictive, 0.025] <= obs["Frequency"] <= Quantile[predictive, 0.975])
./src/LactasePersistenceSpatial.wl:1002:      Black, PointSize[0.008], Point[positions]
./src/LactasePersistenceSpatial.wl:1111:        "Upper95" -> (Quantile[#, 0.975] & /@ Transpose[matrix])
./src/LactasePersistenceSpatial.wl:1250:  "Baltic" -> RGBColor[0.62, 0.35, 0.71],
./src/LactasePersistenceSpatial.wl:1582:$DefaultQuantileSpec = {{"Lower95", 0.025}, {"Q25", 0.25}, {"Median", 0.5}, {"Q75", 0.75}, {"Upper95", 0.975}};
./src/LactasePersistenceSpatial.wl:1766:    "PriorChanges" -> <|"SelectionBase" -> {0.0, 0.008}, "SelectionDairying" -> {0.0, 0.03}|>,
./src/LactasePersistenceSpatial.wl:1787:        {{"Lower95", 0.025}, {"Median", 0.5}, {"Upper95", 0.975}}];
./src/LactasePersistenceSpatial.wl:1882:    Background -> GrayLevel[0.1, 0.62], RoundingRadius -> 8,
./src/LactasePersistenceSpatial.wl:2020:             Table[{PointSize[0.008 + 0.010 Sqrt[p[[5]]/250.]],
./README.md:31:*The quantitative comparison, on common axes. Itan et al. 2009's Fig 3 was digitised back into a numeric density field (`scripts/digitise_itan_fig3.py`; the recovered mode, 48.5N 14.0E, matches the 48.5N 13E their text reports, which validates the georeferencing), so the two posteriors can be compared as distributions rather than as pictures. The verdict is split and section 11 of the notebook states it plainly: **timing and selection strength agree with the published record; location does not.** Bhattacharyya coefficient 0.62; we place only 0.10 of our mass inside their 50% region and 0.36 inside their 95% region. Their distribution sits inside our 95% region, but that reflects how vague we are, not how right - a posterior wide enough to contain every rival hypothesis has corroborated none of them. The origin's *date* (~7,200 BP) is well identified and does agree with both Itan et al. and the imputed-genome time series of Irving-Pease et al. 2024.*
./README.md:43:*Posterior predictive 95% intervals against the 37 observed regional time bins; empirical coverage 0.97.*
./community/LactasePersistenceSpatial.wl:515:         PointSize[0.010 + 0.012 Sqrt[b["CalledAlleles"]/250.]],
./community/LactasePersistenceSpatial.wl:711:  "InitialLatitudeGradient" -> {-0.008, 0.012},
./community/LactasePersistenceSpatial.wl:712:  "InitialLongitudeGradient" -> {-0.008, 0.008},
./community/LactasePersistenceSpatial.wl:795:          "Upper95" -> N[Quantile[predictive, 0.975]],
./community/LactasePersistenceSpatial.wl:796:          "Covered95" -> (Quantile[predictive, 0.025] <= obs["Frequency"] <= Quantile[predictive, 0.975])
./community/LactasePersistenceSpatial.wl:1002:      Black, PointSize[0.008], Point[positions]
./community/LactasePersistenceSpatial.wl:1111:        "Upper95" -> (Quantile[#, 0.975] & /@ Transpose[matrix])
./community/LactasePersistenceSpatial.wl:1250:  "Baltic" -> RGBColor[0.62, 0.35, 0.71],
./community/LactasePersistenceSpatial.wl:1582:$DefaultQuantileSpec = {{"Lower95", 0.025}, {"Q25", 0.25}, {"Median", 0.5}, {"Q75", 0.75}, {"Upper95", 0.975}};
./community/LactasePersistenceSpatial.wl:1766:    "PriorChanges" -> <|"SelectionBase" -> {0.0, 0.008}, "SelectionDairying" -> {0.0, 0.03}|>,
./community/LactasePersistenceSpatial.wl:1787:        {{"Lower95", 0.025}, {"Median", 0.5}, {"Upper95", 0.975}}];
./community/LactasePersistenceSpatial.wl:1882:    Background -> GrayLevel[0.1, 0.62], RoundingRadius -> 8,
./community/LactasePersistenceSpatial.wl:2020:             Table[{PointSize[0.008 + 0.010 Sqrt[p[[5]]/250.]],
./community/build_notebook.wls:271:computation (10,000 forward simulations), check it with posterior predictive \
./community/build_notebook.wls:321:evalIn["GeoListPlot[GeoPosition[{#[\"Latitude\"], #[\"Longitude\"]} & /@ samples],\n GeoRange -> {{34, 63}, {-12, 36}}, GeoProjection -> \"Equirectangular\",\n PlotStyle -> Directive[Opacity[0.45], RGBColor[0.153, 0.51, 0.64], PointSize[0.005]],\n GeoBackground -> GeoStyling[{\"CountryBorders\", \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 620]"],
./community/build_notebook.wls:432:10,000 BP:"}],
./community/build_notebook.wls:491:(39 bins). Second \[LongDash] because a spatial model scored only on \
./community/build_notebook.wls:514:\[LongDash] i.e. no information) to " <> fmt[epsLast] <> " over 10,000 \
./community/build_notebook.wls:647:five (medians 0.008\[Dash]0.019) \[LongDash] that conclusion belongs to the \
./community/build_notebook.wls:649:prior it is given (median 0.010 baseline \[RightArrow] 0.020 under the \
./community/build_notebook.wls:676:evalIn["GeoGraphics[\n Flatten[Table[{RGBColor[0.8, 0.15, 0.1], PointSize[0.013],\n    Point[GeoPosition[{e[\"Latitude\"], e[\"Longitude\"]}]],\n    Black, Text[Style[ToString[Round[e[\"MeanDateBP\"]]] <> \" BP\", 9.5, Bold],\n      GeoPosition[{e[\"Latitude\"] + 1.1, e[\"Longitude\"]}]]},\n   {e, earliest}], 1],\n GeoRange -> {{34, 63}, {-14, 72}}, GeoProjection -> \"Equirectangular\",\n GeoBackground -> GeoStyling[{\"CountryBorders\",\n   \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 640]"],
./community/build_notebook.wls:688:": its model starts at 10,000 BP with a near-uniform initial frequency, \
./community/build_notebook.wls:793:" does this and writes ", mono["data/processed/itan2009_origin_density_digitised.csv"],
./community/build_notebook.wls:810:evalIn["itanGrid = Import[FileNameJoin[{Directory[], \"data\", \"processed\", \"itan2009_origin_density_digitised.csv\"}], \"Dataset\", HeaderLines -> 1];\nitanRows = Normal[itanGrid];\nlons = Union[#[[1]] & /@ itanRows]; lats = Union[#[[2]] & /@ itanRows];\nitanAssoc = Association[{#[[1]], #[[2]]} -> #[[3]] & /@ itanRows];\noriginDraws2 = ResamplePosterior[originSmc, 2000];\nkdeAt[lo_, la_] := Mean[Map[Exp[-0.5 (((lo - #[\"OriginLongitude\"])/2.6)^2 + ((la - #[\"OriginLatitude\"])/2.0)^2)] &, originDraws2]];\ncells = Keys[itanAssoc];\nwArea = Cos[#[[2]] Degree] & /@ cells;\npI = (Values[itanAssoc] wArea); pI = pI/Total[pI];\npO = (kdeAt @@@ cells) wArea; pO = pO/Total[pO];\nhpdMask[p_, lev_] := Module[{ord = Ordering[-p], c = 0., keep = {}},\n   Do[c += p[[i]]; AppendTo[keep, i]; If[c >= lev, Break[]], {i, ord}]; keep];\nbc = Total[Sqrt[pI pO]];\nGrid[{Style[#, Bold] & /@ {\"statistic\", \"value\", \"reading\"},\n  {\"Bhattacharyya coefficient\", NumberForm[bc, {4, 3}], \"1 = identical, 0 = disjoint\"},\n  {\"our mass in Itan 50% region\", NumberForm[Total[pO[[hpdMask[pI, 0.5]]]], {4, 3}], \"vs 0.50 if we agreed\"},\n  {\"our mass in Itan 95% region\", NumberForm[Total[pO[[hpdMask[pI, 0.95]]]], {4, 3}], \"vs 0.95 if we agreed\"},\n  {\"Itan mass in our 95% region\", NumberForm[Total[pI[[hpdMask[pO, 0.95]]]], {4, 3}], \"ours is broad enough to contain theirs\"}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.4, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
./community/build_notebook.wls:833:evalIn["originDraws = ResamplePosterior[originSmc, 2000];\nsTotal = Quantile[Map[#[\"SelectionBase\"] + #[\"SelectionDairying\"] &, originDraws], {0.025, 0.5, 0.975}];\noRow[p_] := SelectFirst[PosteriorParameterQuantiles[originSmc], #[\"Parameter\"] === p &];\nfq[p_, d_] := With[{q = oRow[p]}, {ToString[NumberForm[q[\"Median\"], {8, d}]],\n   \"[\" <> ToString[NumberForm[q[\"Lower95\"], {8, d}]] <> \", \" <> ToString[NumberForm[q[\"Upper95\"], {8, d}]] <> \"]\"}];\nGrid[\n {Style[#, Bold] & /@ {\"quantity\", \"this model\", \"95% interval\", \"published\", \"source\"},\n  Join[{\"origin latitude (\[Degree]N)\"}, fq[\"OriginLatitude\", 1], {\"\[TildeTilde]48.5 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin longitude (\[Degree]E)\"}, fq[\"OriginLongitude\", 1], {\"\[TildeTilde]13 (mode)\", \"Itan 2009, Fig 3\"}],\n  Join[{\"origin date (years BP)\"}, fq[\"OriginTimeBP\", 0], {\"7441 [6256, 8683]\", \"Itan 2009\"}],\n  Join[{\"selection, dairying term\"}, fq[\"SelectionDairying\", 3], {\"0.0953 [0.0518, 0.159]\", \"Itan 2009 (dairyers)\"}],\n  {\"selection, total in dairying cells\", ToString[NumberForm[sTotal[[2]], {8, 3}]],\n   \"[\" <> ToString[NumberForm[sTotal[[1]], {8, 3}]] <> \", \" <> ToString[NumberForm[sTotal[[3]], {8, 3}]] <> \"]\",\n   \"0.014\[Dash]0.15\", \"Bersaglieri 2004\"},\n  {\"\", \"\", \"\", \"\[TildeTilde]0.06 (last 3 kyr)\", \"Burger 2020\"}},\n Frame -> All, FrameStyle -> GrayLevel[0.8], Spacings -> {1.2, 0.6},\n Background -> {None, {GrayLevel[0.93], None}}]"],
./community/build_notebook.wls:840:a success: our total in dairying cells, 0.039, falls inside every \
./community/build_notebook.wls:842:\[TildeTilde]0.06 for the last three millennia, Irving-Pease's 0.0194 \
./community/build_notebook.wls:877:code. Of the 636 called alleles older than 6,000 BP in this dataset, ",
./community/build_notebook.wls:878:bold["exactly one"], " is derived \[LongDash] a single heterozygote from \
./scripts/run_pipeline.wls:82:  FileNameJoin[{root, "data", "processed", "origin_posterior_quantiles.csv"}], originQuantiles];
./docs/wolfram-community-post.md:41:Europe (35–63°N, 12°W–35°E) is discretized into a 4° grid of 84 cells. Each cell `i` carries its region label and a regional dairying-onset time (Mediterranean 8200 BP, Rhine–Danube 7600, British Isles 6100, Baltic 5600, other 6500), smoothed into a covariate `D_i(t) = 1/(1 + exp((t - onset_i)/350))`. The local derived-allele frequency evolves in 250-year steps from 10,000 BP to the present:
./docs/wolfram-community-post.md:55:1. **Regional time-binned frequencies** — pooled derived-allele frequency per region per 1,000-year bin, weighted by called-allele count (39 bins).
./docs/wolfram-community-post.md:60:Priors are uniform: `log10 p0 ∈ [−4.2, −1.5]`, `s0 ∈ [0, 0.015]`, `s_dairy ∈ [0, 0.06]` (spanning the published estimates), `mig ∈ [0, 0.015]`, regional multipliers within [0.4, 2.4], initial gradients small. The tolerance fell from 0.245 (prior median) to 0.044 over five generations and 10,000 simulations. The final effective sample size is 35 of 400 particles — importance-weight degeneracy is the known price of this weight formula when the posterior is much tighter than the prior, and it is reported rather than hidden; every interval below is a weighted quantile and should be read as approximate.
./docs/wolfram-community-post.md:85:**Posterior predictive checks.** For each of the 37 regional time bins, the posterior predictive distribution (posterior draws → forward simulation → binomial sampling at the bin's allele count) covers the observed frequency in 36 cases — empirical 95% coverage of 0.97 on in-sample bins.
./docs/wolfram-community-post.md:93:The full SMC-ABC fit is rerun under five scenarios: baseline; halved selection priors; doubled migration prior; and dairying onsets shifted ±400 years in every region. Across all five, the dairying-modulated selection component stays positive with medians between 0.008 and 0.019 — the qualitative conclusion survives. The migration posterior, by contrast, tracks its prior (median 0.010 under the baseline prior, 0.020 when the prior is widened): with 84 cells and regionally aggregated summaries, movement is weakly identified, and the pipeline says so rather than dressing a prior up as a finding.
./scripts/digitise_itan_fig3.py:135:print(f"\nBhattacharyya coefficient : {bc:.3f}   (1 = identical, 0 = disjoint)")
./notebooks/build_walkthrough.wls:80:  in["GeoListPlot[GeoPosition[{#[\"Latitude\"], #[\"Longitude\"]} & /@ samples],\n GeoRange -> {{34, 63}, {-12, 36}}, GeoProjection -> \"Equirectangular\",\n PlotStyle -> Directive[Opacity[0.45], RGBColor[0.153, 0.51, 0.64], PointSize[0.005]],\n GeoBackground -> GeoStyling[{\"CountryBorders\", \"Land\" -> GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],\n ImageSize -> 600]"],
./notebooks/LactasePersistenceSpatial.nb:106:GrayLevel[0.97], \"Ocean\" -> RGBColor[0.85, 0.9, 0.95]}],
./notebooks/LactasePersistenceSpatial.nb:5565:             3500, 0.038461538461538464`, 0.010611711001315291`, 
./notebooks/LactasePersistenceSpatial.nb:5604:             7500, 0., 0., 0.10151455415332375`, 34}, {
./notebooks/LactasePersistenceSpatial.nb:5612:            RGBColor[0.62, 0.35, 0.71], "Other Europe" -> GrayLevel[0.45]|>, 
./notebooks/LactasePersistenceSpatial.nb:5627:              0.008 + 0.01 

2026-09-01T10:41:25.977019Z ERROR codex_core::tools::router: error=apply_patch verification failed: Failed to find expected lines in /Users/thiel/.codex/memories/MEMORY.md:
# Task Group: custom science/data-science artwork, print preparation, and mug refinement

scope: create, inspect, correct, and prepare generated science/data-science artwork for custom apparel or mugs; distinguish inspected/prepared assets from completed purchases or final artwork
applies_to: cwd=/Users/thiel/Desktop, /Users/thiel/Downloads, Claude Desktop `Science project t-shirt design`, and ChatGPT `Design T Shirt Slogan`; reuse_rule=reuse the visual-inspection and print-preparation workflow for similar custom-art tasks, but treat source artwork, vendor configuration, recipients, and purchase state as task-specific

## Task 1: Generate and inspect science/data-science cheat-sheet T-shirt artwork before custom-product upload

### rollout_summary_files

- extensions/skysight/resources/2026-08-24T12-00-00-fkkz-6h-memory-summary.md (cwd=Claude Desktop `Science project t-shirt design` and /Users/thiel/Downloads, rollout_path=Skysight event summary for 2026-08-24T12:00:00Z, updated_at=2026-08-24T12:00:00+00:00, observed: PNG export/Preview inspection, equation-wrap correction, and custom-apparel preparation; no purchase captured) [skysight memory]
- extensions/skysight/resources/2026-08-24T18-00-00-CEwl-6h-memory-summary.md (cwd=Claude Desktop `Science project t-shirt design`, rollout_path=Skysight event summary for 2026-08-24T18:00:00+00:00, updated_at=2026-08-24T18:00:00+00:00, observed: data-science cheat-sheet artboards reviewed; no export or handoff captured) [skysight memory]
- extensions/skysight/resources/2026-08-25T10-10-00-zQxD-10min-memory-summary.md (cwd=ChatGPT/Codex and /Users/thiel/Desktop, rollout_path=Skysight event summary for 2026-08-25T10:10:00Z, updated_at=2026-08-25T10:10:00+00:00, observed: follow-up sent for `Error: Invalid visualization read request`; PNG/PDF/TeX assets reviewed) [skysight memory]

### keywords

- Science project t-shirt design, Science T-Shirts, data-science-cheat-sheet-01.png, data-science-cheat-sheet-02.png, data-science-cheatsheets.html, Error: Invalid visualization read request, data-science-cheat-sheets-latex.pdf, 600 DPI, 6000 x 7200, ComplicatedWhite@2x.png, Preview, equation wrapping

## Task 2: Refine caffeine-themed coffee-mug artwork and explore a personalized mug customizer
exec
/bin/zsh -lc "nl -ba scripts/run_pipeline.wls | sed -n '1,140p' && nl -ba scripts/run_pipeline.wls | sed -n '140,260p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	#!/usr/bin/env wolframscript
     2	
     3	root = DirectoryName[DirectoryName[$InputFileName]];
     4	Get[FileNameJoin[{root, "src", "LactasePersistenceSpatial.wl"}]];
     5	
     6	getArg[name_, default_] := Module[{pos = FirstPosition[$ScriptCommandLine, name, Missing["NotFound"]]},
     7	  If[MissingQ[pos] || pos[[1]] >= Length[$ScriptCommandLine], default, ToExpression[$ScriptCommandLine[[pos[[1]] + 1]]]]
     8	];
     9	
    10	particles = getArg["--particles", 400];
    11	generations = getArg["--generations", 5];
    12	posteriorDraws = getArg["--posterior-draws", 100];
    13	cvParticles = getArg["--cv-particles", 150];
    14	cvGenerations = getArg["--cv-generations", 4];
    15	runSensitivity = getArg["--sensitivity", 1];
    16	
    17	Print["Ensuring project layout..."];
    18	LactasePersistenceSpatial`EnsureProjectLayout[root];
    19	
    20	Print["Retrieving raw data if needed..."];
    21	raw = LactasePersistenceSpatial`RetrieveRawData[root, False];
    22	If[raw === $Failed, Exit[1]];
    23	
    24	Print["Parsing and processing rs4988235 sample data..."];
    25	processed = LactasePersistenceSpatial`WriteProcessedData[root, raw];
    26	samples = processed["CalledSamples"];
    27	Print["Called samples with age/location: " <> ToString[Length[samples]]];
    28	
    29	Print["Fitting regional binomial logistic trajectories..."];
    30	fits = LactasePersistenceSpatial`FitAllRegionalLogistics[samples];
    31	regionalOutputs = LactasePersistenceSpatial`ExportRegionalFitOutputs[root, samples, fits];
    32	
    33	Print["Building coarse Europe grid..."];
    34	grid = LactasePersistenceSpatial`BuildEuropeGrid[];
    35	
    36	Print["Running SMC-ABC (" <> ToString[particles] <> " particles, " <>
    37	  ToString[generations] <> " generations)..."];
    38	smcStart = AbsoluteTime[];
    39	smc = LactasePersistenceSpatial`RunSMCABC[samples, grid,
    40	  "Particles" -> particles,
    41	  "Generations" -> generations,
    42	  "Seed" -> 20260831,
    43	  "ProgressFunction" -> Function[{g, eps, acc, ess},
    44	    Print["  generation " <> ToString[g] <> ": epsilon " <> ToString[NumberForm[eps, {6, 4}]] <>
    45	      ", acceptance " <> ToString[NumberForm[100. acc, {5, 1}]] <> "%, ESS " <>
    46	      ToString[NumberForm[ess, {6, 1}]]]]
    47	];
    48	Print["  total simulations: " <> ToString[smc["TotalSimulations"]] <>
    49	  " in " <> ToString[NumberForm[AbsoluteTime[] - smcStart, {7, 1}]] <> " s"];
    50	If[TrueQ[smc["GenerationShortfall"]],
    51	  Print["  note: a generation hit its simulation budget; tolerance schedule stopped early."]];
    52	
    53	draws = LactasePersistenceSpatial`ResamplePosterior[smc, posteriorDraws];
    54	smcOutputs = LactasePersistenceSpatial`ExportSMCOutputs[root, samples, grid, smc, draws];
    55	
    56	Print["Running held-out-region cross-validation..."];
    57	cv = LactasePersistenceSpatial`RunSMCCrossValidation[samples, grid,
    58	  "Particles" -> cvParticles, "Generations" -> cvGenerations];
    59	cvFile = FileNameJoin[{root, "data", "processed", "cross_validation_by_region.csv"}];
    60	LactasePersistenceSpatial`Private`ExportRows[cvFile, cv];
    61	
    62	Print["Running time-slice validation (train > 2500 BP, predict <= 2500 BP)..."];
    63	timeSlice = LactasePersistenceSpatial`RunTimeSliceValidation[samples, grid,
    64	  "Particles" -> cvParticles, "Generations" -> cvGenerations];
    65	timeSliceFile = FileNameJoin[{root, "data", "processed", "time_slice_validation.csv"}];
    66	LactasePersistenceSpatial`Private`ExportRows[timeSliceFile, {KeyDrop[timeSlice, "PosteriorPredictive"]}];
    67	timeSlicePPCFile = FileNameJoin[{root, "data", "processed", "time_slice_posterior_predictive.csv"}];
    68	LactasePersistenceSpatial`Private`ExportRows[timeSlicePPCFile, timeSlice["PosteriorPredictive"]];
    69	
    70	sensitivityOutputs = <||>;
    71	If[runSensitivity =!= 0,
    72	  Print["Running prior and dairying-onset sensitivity analysis..."];
    73	  sensitivityRows = LactasePersistenceSpatial`RunSensitivityAnalysis[samples,
    74	    "Particles" -> cvParticles, "Generations" -> cvGenerations];
    75	  sensitivityOutputs = LactasePersistenceSpatial`ExportSensitivityOutputs[root, sensitivityRows];
    76	];
    77	
    78	Print["Fitting point-source origin model (or loading cached posterior)..."];
    79	originSmc = LactasePersistenceSpatial`LoadOrRunOriginSMCABC[root, samples, grid];
    80	originQuantiles = LactasePersistenceSpatial`PosteriorParameterQuantiles[originSmc];
    81	LactasePersistenceSpatial`Private`ExportRows[
    82	  FileNameJoin[{root, "data", "processed", "origin_posterior_quantiles.csv"}], originQuantiles];
    83	Export[FileNameJoin[{root, "figures", "generated", "origin_posterior_density.png"}],
    84	  LactasePersistenceSpatial`OriginDensityMap[originSmc], ImageResolution -> 160];
    85	Print["Rendering origin spread animation..."];
    86	LactasePersistenceSpatial`ExportOriginSpread[root, samples, grid, originSmc];
    87	
    88	Print["Rendering spatial maps and calibrated uncertainty animation..."];
    89	spatialOutputs = LactasePersistenceSpatial`ExportSpatialVisualizations[root, samples, grid, draws];
    90	
    91	summaryFile = LactasePersistenceSpatial`WriteRunSummary[
    92	  root,
    93	  Join[
    94	    KeyDrop[processed, {"Samples", "CalledSamples", "BinnedFrequencies"}],
    95	    regionalOutputs,
    96	    KeyDrop[smcOutputs, {"PosteriorPredictive"}],
    97	    spatialOutputs,
    98	    sensitivityOutputs,
    99	    <|
   100	      "CrossValidationFile" -> cvFile,
   101	      "TimeSliceFile" -> timeSliceFile,
   102	      "InferenceNote" -> "SMC-ABC: " <> ToString[particles] <> " particles, " <>
   103	        ToString[Length[smc["EpsilonHistory"]]] <> " tolerance generations, final epsilon " <>
   104	        ToString[NumberForm[Last[smc["EpsilonHistory"]], {6, 4}]] <> ", final ESS " <>
   105	        ToString[NumberForm[Last[smc["ESSHistory"]], {7, 1}]] <> ", " <>
   106	        ToString[smc["TotalSimulations"]] <> " total simulations."
   107	    |>
   108	  ]
   109	];
   110	
   111	Print["Pipeline complete."];
   112	Print["Summary: " <> summaryFile];
   113	Exit[0];

exec
/bin/zsh -lc "python3 -c 'import csv,collections,math,statistics
p=\"data/processed/glad_rs4988235_called_samples.csv\"
rows=list(csv.DictReader(open(p,newline=\"\")))
num=lambda x: float(x) if x not in (\"\",None) else math.nan
print(\"called_rows\",len(rows))
for key in [\"Region\",\"RS4988235Genotype\",\"CalledAlleles\",\"Country\",\"Publication\"]:
 c=collections.Counter(r[key] for r in rows)
 print(\"\\n\",key,\"unique\",len(c)); print(c.most_common(20))
for k in [\"VersionID\",\"SampleID\"]:
 c=collections.Counter(r[k] for r in rows); d=[(x,n) for x,n in c.items() if x and n>1]
 print(k,\"unique_nonempty\",sum(bool(x) for x in c),\"duplicate_keys\",len(d),\"excess_rows\",sum(n-1 for x,n in d),\"top\",sorted(d,key=lambda z:-z[1])[:20])
dep=[num(r[\"RS4988235Depth\"]) for r in rows]; dep=[x for x in dep if math.isfinite(x)]
print(\"\\ndepth known\",len(dep),\"missing\",len(rows)-len(dep),\"min/q/med/max\",min(dep),statistics.quantiles(dep,n=4),statistics.median(dep),max(dep),\"depth<=1\",sum(x<=1 for x in dep),\"<=2\",sum(x<=2 for x in dep))
ages=[num(r[\"MeanDateBP\"]) for r in rows]; print(\"ages min max >10k >12k\",min(ages),max(ages),sum(x>10000 for x in ages),sum(x>12000 for x in ages))
for cutoff in [6000,10000,12000]:
 s=[r for r in rows if num(r[\"MeanDateBP\"])>cutoff]
 print(\"older\",cutoff,\"rows\",len(s),\"called\",sum(int(float(r[\"CalledAlleles\"])) for r in s),\"derived\",sum(int(float(r[\"DerivedAlleles\"])) for r in s))
early=sorted([r for r in rows if int(float(r[\"DerivedAlleles\"]))>0],key=lambda r:-num(r[\"MeanDateBP\"]))[:12]
print(\"\\nearliest derived\")
for r in early: print(r[\"MeanDateBP\"],r[\"Country\"],r[\"Latitude\"],r[\"Longitude\"],r[\"RS4988235Genotype\"],r[\"Publication\"],r[\"SampleID\"],r[\"VersionID\"])
'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
called_rows 1785

 Region unique 6
[('Outside Europe', 681), ('Mediterranean', 486), ('Rhine-Danube', 341), ('British Isles', 171), ('Baltic', 56), ('Other Europe', 50)]

 RS4988235Genotype unique 6
[('GG', 1234), ('G', 462), ('GA', 58), ('A', 18), ('AA', 10), ('GT', 3)]

 CalledAlleles unique 2
[('2', 1305), ('1', 480)]

 Country unique 43
[('Russia', 201), ('Italy', 172), ('Spain', 162), ('Great Britain', 119), ('Germany', 101), ('Kazakhstan', 100), ('Pakistan', 97), ('Turkey', 90), ('France', 79), ('Hungary', 77), ('Czech Republic', 52), ('Ireland', 43), ('Israel', 37), ('Turkmenistan', 36), ('Uzbekistan', 35), ('Serbia', 34), ('Ukraine', 32), ('Poland', 30), ('Iran', 28), ('Kyrgyzstan', 28)]

 Publication unique 67
[('NarasimhanPattersonScience2019', 335), ('OlaldeNature2018', 224), ('MathiesonNature2018', 144), ('OlaldeScience2019', 117), ('AntonioGaoMootsScience2019', 87), ('DamgaardNature2018', 75), ('RivollatScienceAdvance2020', 68), ('SkourtaniontiCell2020', 63), ('LipsonNature2017', 61), ('DamgaardScience2018', 45), ('MarcusNatureCommunications2020', 42), ('MathiesonNature2015', 42), ('MathiesonNature2015 (1240k of same same sample with 390k in HaakLazaridis2015)', 42), ('FernandesNatureEcologyEvolution2020', 41), ('AgranatTamirCell2020', 41), ('CassidyNature2020', 34), ('WangNatureCommunications2019', 34), ('AllentoftNature2015', 30), ('LazaridisNature2016', 22), ('KrzewinskaScienceAdvances2018', 17)]
VersionID unique_nonempty 1785 duplicate_keys 0 excess_rows 0 top []
SampleID unique_nonempty 1785 duplicate_keys 0 excess_rows 0 top []

depth known 1785 missing 0 min/q/med/max 1.0 [1.0, 3.0, 9.0] 3.0 128.0 depth<=1 480 <=2 724
ages min max >10k >12k 139.0 24450.0 16 3
older 6000 rows 361 called 636 derived 1
older 10000 rows 16 called 29 derived 0
older 12000 rows 3 called 5 derived 0

earliest derived
6561 Bulgaria 43.2131 27.8644 GA MathiesonNature2018 ANI163 ANI163
5600 Ukraine 49.54067778 37.69799444 GA MathiesonNature2018 I6561 I6561
5389 Romania 46.7877247 23.520877 GA GonzalesFortesCurrentBiology2017 GB GB.SG
5131 Ireland 54.54222222 -5.956666667 GA CassidyPNAS2016 bally bally.SG
4466 Afghanistan 36.783333 70 GA NarasimhanPattersonScience2019 Darra.I.Kur Darra.I.Kur_d
4350 Spain 42.4 -3.75 GT OlaldeNature2018 I0459 I0459
4312 Great Britain 56.680948 -6.45982 GA OlaldeNature2018 I5367 I5367
4270 Hungary 47.383224 19.020252 GA OlaldeNature2018 I2786 I2786
4250 Germany 48.705913 11.325375 AA OlaldeNature2018 I5531 I5531
4250 Czech Republic 50.0504153 14.3667267 GA OlaldeNature2018 I7196 I7196
4250 Czech Republic 50.0504153 14.3667267 GA OlaldeNature2018 I7201 I7201
4250 Czech Republic 50.0504153 14.3667267 GA OlaldeNature2018 I7202 I7202

exec
/bin/zsh -lc "rg -n 'ANI163|I6561|Darra\\.I\\.Kur|GB\\.SG|bally\\.SG|I0459|I5367|I2786' data/processed/glad_rs4988235_called_samples.csv" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
503:"Darra.I.Kur_d","Darra.I.Kur","NarasimhanPattersonScience2019",2019,"Afghanistan_DarralKur_MBA","Darra-i-Kur Cave","Afghanistan",36.783333,70,4466,"2581-2411 calBCE (3989±31 BP, OxA-31781)",3,"GA",2,1,0.5,"Outside Europe",6500,true
1076:"ANI163","ANI163","MathiesonNature2018",2018,"Bulgaria_Varna_C_contam","Varna","Bulgaria",43.2131,27.8644,6561,"4713-4509 calBCE [union of two dates: 4713-4549 calBCE (5787±30 BP, OxA-13688); 4692-4509 calBCE (5755±24 BP, OxA-13688)]",2,"GA",2,1,0.5,"Mediterranean",8200,true
1124:"I6561","I6561","MathiesonNature2018",2018,"Ukraine_MBA","Alexandria","Ukraine",49.54067778,37.69799444,5600,"3900-3400 BCE",8,"GA",2,1,0.5,"Outside Europe",6500,true
1198:"I0459","I0459","OlaldeNature2018",2018,"Spain_C","Burgos, Arroyal I","Spain",42.4,-3.75,4350,"2600-2200 BCE",3,"GT",2,1,0.5,"Mediterranean",8200,true
1202:"I5367","I5367","OlaldeNature2018",2018,"Scotland_BellBeaker","Scotland, Coll, Sorisdale","Great Britain",56.680948,-6.45982,4312,"2466-2209 calBCE (3879±32 BP, OxA-14722)",10,"GA",2,1,0.5,"British Isles",6100,true
1218:"I2786","I2786","OlaldeNature2018",2018,"Hungary_EBA_BellBeaker","Szigetszentmiklós, Felső Ürge-hegyi dűlő","Hungary",47.383224,19.020252,4270,"2457-2204 calBCE (3850±35 BP, Poz-83639)",7,"GA",2,1,0.5,"Rhine-Danube",7600,true
1554:"GB.SG","GB","GonzalesFortesCurrentBiology2017",2017,"Romania_C_oHG.SG","Gura Baciului","Romania",46.7877247,23.520877,5389,"3512-3350 calBCE (4621±28 BP, MAMS-28614)",7,"GA",2,1,0.5,"Rhine-Danube",7600,true
1624:"bally.SG","bally","CassidyPNAS2016",2016,"Ireland_N.SG","Ballynahatty, County Down","Ireland",54.54222222,-5.956666667,5131,"3346-3014 calBCE (4465±38 BP, UBA-7059)",9,"GA",2,1,0.5,"British Isles",6100,true

exec
/bin/zsh -lc "rg -n '37\\.724|12\\.916|37724|12916' data/processed/glad_rs4988235_samples.csv data/processed/glad_rs4988235_called_samples.csv" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
data/processed/glad_rs4988235_called_samples.csv:36:"I4063","I4063","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6832,"4987-4794 calBCE (5995±30 BP, PSUAMS-2263)",31,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_called_samples.csv:37:"I4062","I4062","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6815,"4984-4784 calBCE (5980±30 BP, PSUAMS-1950)",19,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_called_samples.csv:38:"I4065","I4065","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6815,"4988-4735 calBCE (5980±35 BP, PSUAMS-1951)",18,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_called_samples.csv:41:"I4064","I4064","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6718,"4841-4711 calBCE (5900±30 BP, PSUAMS-2266)",5,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_called_samples.csv:470:"I6294","I6294","NarasimhanPattersonScience2019",2019,"Russia_MBA_Poltavka","Samara Oblast, Volga River Valley, Sok River, Grachevka","Russia",53.58975,50.57129167,4709,"2877-2635 calBCE (4160±20 BP, PSUAMS-2956)",3,"GG",2,0,0,"Outside Europe",6500,true
data/processed/glad_rs4988235_called_samples.csv:525:"I0244","I0244","NarasimhanPattersonScience2019",2019,"Russia_Potapovka_o1","Samara Oblast, Volga River Valley, Sok River, Grachevka","Russia",53.58975,50.57129167,4154,"2343-2039 BCE (3779±40 BP) [R_combine: (3752±52 BP, AA-53806); (3815±60 BP, Le-6545)]",6,"GG",2,0,0,"Outside Europe",6500,true
data/processed/glad_rs4988235_called_samples.csv:544:"I7670","I7670","NarasimhanPattersonScience2019",2019,"Russia_MLBA_Potapovka","Samara Oblast, Volga River Valley, Sok River, Grachevka","Russia",53.58975,50.57129167,3958,"2129-1940 calBCE (3640±20 BP, PSUAMS-4274)",1,"G",1,0,0,"Outside Europe",6500,true
data/processed/glad_rs4988235_samples.csv:71:"I4063","I4063","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6832,"4987-4794 calBCE (5995±30 BP, PSUAMS-2263)",31,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_samples.csv:72:"I4062","I4062","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6815,"4984-4784 calBCE (5980±30 BP, PSUAMS-1950)",19,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_samples.csv:73:"I4065","I4065","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6815,"4988-4735 calBCE (5980±35 BP, PSUAMS-1951)",18,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_samples.csv:76:"I4064","I4064","FernandesNatureEcologyEvolution2020",2020,"Italy_Sicily_MN","Sicily, Fossato di Stretto Partana","Italy",37.724000000000004,12.916,6718,"4841-4711 calBCE (5900±30 BP, PSUAMS-2266)",5,"GG",2,0,0,"Mediterranean",8200,true
data/processed/glad_rs4988235_samples.csv:459:"I10502_published","I10502","FernandesNatureEcologyEvolution2020",2020,"Italy_Sardinia_LBA_published","Sardinia, Anulù Seui","Italy",39.850894,9.377241,3151,"1369-1117 calBCE (2980±25 BP, PSUAMS-6688)",,"",0,0,,"Mediterranean",8200,false
data/processed/glad_rs4988235_samples.csv:778:"I6294","I6294","NarasimhanPattersonScience2019",2019,"Russia_MBA_Poltavka","Samara Oblast, Volga River Valley, Sok River, Grachevka","Russia",53.58975,50.57129167,4709,"2877-2635 calBCE (4160±20 BP, PSUAMS-2956)",3,"GG",2,0,0,"Outside Europe",6500,true
data/processed/glad_rs4988235_samples.csv:873:"I0244","I0244","NarasimhanPattersonScience2019",2019,"Russia_Potapovka_o1","Samara Oblast, Volga River Valley, Sok River, Grachevka","Russia",53.58975,50.57129167,4154,"2343-2039 BCE (3779±40 BP) [R_combine: (3752±52 BP, AA-53806); (3815±60 BP, Le-6545)]",6,"GG",2,0,0,"Outside Europe",6500,true
data/processed/glad_rs4988235_samples.csv:923:"I7670","I7670","NarasimhanPattersonScience2019",2019,"Russia_MLBA_Potapovka","Samara Oblast, Volga River Valley, Sok River, Grachevka","Russia",53.58975,50.57129167,3958,"2129-1940 calBCE (3640±20 BP, PSUAMS-4274)",1,"G",1,0,0,"Outside Europe",6500,true
data/processed/glad_rs4988235_samples.csv:2820:"I0371_published","I0371","MathiesonNature2015",2015,"Russia_MBA_Poltavka_published","Samara Oblast, Volga River Valley, Sok River, Grachevka","Russia",53.58975,50.57129167,4678,"2871-2581 calBCE (4130±30 BP, Beta-392488)",,"",0,0,,"Outside Europe",6500,false

exec
/bin/zsh -lc "python3 -c 'import csv,math,collections,numpy as np,os
D=\"data/processed/\"
def rows(n): return list(csv.DictReader(open(D+n,newline=\"\")))
def f(x): return float(x)
# sampling scope
s=rows(\"glad_rs4988235_called_samples.csv\")
sc=collections.Counter(r[\"Region\"] for r in s)
print(\"scope\",sc,\"4regions\",sum(sc[x] for x in [\"British Isles\",\"Rhine-Danube\",\"Mediterranean\",\"Baltic\"]),\"4plusOther\",sum(sc[x] for x in [\"British Isles\",\"Rhine-Danube\",\"Mediterranean\",\"Baltic\",\"Other Europe\"]))
# ppc claims
p=rows(\"posterior_predictive_regional.csv\")
print(\"ppc n coverage\",len(p),sum(r[\"Covered95\"].lower()==\"true\" for r in p)/len(p),\"uncovered\",[r for r in p if r[\"Covered95\"].lower()"'!="true"])
# weight/diag checks
for pre in ["", "origin_"]:
 ps=rows(pre+"smc_particles.csv"); dg=rows(pre+"smc_diagnostics.csv")
 w=np.array([f(r["Weight"]) for r in ps]); dist=np.array([f(r["Distance"]) for r in ps]); eps=f(dg[-1]["Epsilon"])
 print(pre or "base", "wsum",w.sum(),"ESS",1/(w*w).sum(),"diagESS",dg[-1]["ESS"],"finaleps",eps,"dist q",np.quantile(dist,[0,.25,.5,.75,1]),"weighted mass dist>eps",w[dist>eps].sum(),"count",(dist>eps).sum(),"maxwt",w.max(),"top10mass",np.sort(w)[-10:].sum())
# infer total baseline simulations from reported acceptance n/attempts
for pre,n in [("",400),("origin_",800)]:
 dg=rows(pre+"smc_diagnostics.csv"); total=n+sum(round(n/f(r["AcceptanceRate"])) for r in dg[1:])
 print(pre or "base","inferred simulations",total)
# sensitivity facts
sen=rows("sensitivity_posterior_quantiles.csv")
for par in ["SelectionDairying","Migration"]:
 print(par,[(r["Scenario"],f(r["Median"]),f(r["Lower95"]),f(r["Upper95"])) for r in sen if r["Parameter"]==par])
# resampling uniqueness/posterior links
abc=rows("abc_posterior.csv"); print("abc resampled unique rows",len(set(tuple(r.items()) for r in abc)),"of",len(abc))
# regional bin filters
b=rows("regional_time_binned_frequencies.csv"); used=[r for r in b if r["Region"] in ["British Isles","Rhine-Danube","Mediterranean","Baltic"] and f(r["CalledAlleles"])>=2]
print("regional csv",len(b),"fit summaries",len(used),collections.Counter(r["Region"] for r in used))
# digitised grid stats
it=rows("itan2009_origin_density_digitised.csv"); vals=np.array([f(r["RelativeDensity"]) for r in it]); print("itan rows",len(it),"lon",min(f(r["Longitude"]) for r in it),max(f(r["Longitude"]) for r in it),"lat",min(f(r["Latitude"]) for r in it),max(f(r["Latitude"]) for r in it),"value",vals.min(),np.quantile(vals,[.25,.5,.75]),vals.max(),"zeros",(vals==0).sum())
'"'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 17ms:
scope Counter({'Outside Europe': 681, 'Mediterranean': 486, 'Rhine-Danube': 341, 'British Isles': 171, 'Baltic': 56, 'Other Europe': 50}) 4regions 1054 4plusOther 1104
ppc n coverage 37 1.0 uncovered []
base wsum 1.0000000000000002 ESS 26.57063383268598 diagESS 26.570633832685978 finaleps 0.04080321918842591 dist q [0.0252214  0.03809805 0.04081684 0.04249049 0.04391179] weighted mass dist>eps 0.2772889842929318 count 200 maxwt 0.11557512198075086 top10mass 0.47902997891840243
origin_ wsum 1.0 ESS 68.68734850212515 diagESS 68.68734850212515 finaleps 0.04204896009134267 dist q [0.02853557 0.04043912 0.04205106 0.04335457 0.04434545] weighted mass dist>eps 0.40100862560109135 count 400 maxwt 0.039824926059002105 top10mass 0.3127189604573473
base inferred simulations 8400
origin_ inferred simulations 31200
SelectionDairying [('Baseline', 0.003944708565617494, 0.002221458865618797, 0.018156617467316925), ('NarrowSelection', 0.013999441656651545, 0.0008798560026460643, 0.026565507376132495), ('WideMigration', 0.0048627696435165355, 0.0002670131822031803, 0.021759203510636323), ('EarlierDairying', 0.002058676177724154, 0.0002352901574939837, 0.02552474266828279), ('LaterDairying', 0.003763301236307045, 0.00026715291918759403, 0.02175824874772882)]
Migration [('Baseline', 0.0071625266315972725, 0.0004967600452462109, 0.013866814137076244), ('NarrowSelection', 0.012966053523138482, 6.0248002754497954e-05, 0.014364720239183802), ('WideMigration', 0.005390126693484875, 0.0025488129146599855, 0.029243328305902136), ('EarlierDairying', 0.0074629471342744485, 0.00041033312885047687, 0.014693303518170565), ('LaterDairying', 0.002685248449804276, 0.0012670691058360296, 0.01462418414977075)]
abc resampled unique rows 46 of 100
regional csv 48 fit summaries 37 Counter({'Mediterranean': 13, 'Rhine-Danube': 10, 'Baltic': 9, 'British Isles': 5})
itan rows 2260 lon -10.0 32.0 lat 36.5 59.5 value 0.0 [0.      0.      0.14583] 1.0 zeros 1407

exec
/bin/zsh -lc "python3 -c 'import csv,numpy as np,math
D=\"data/processed/\"
it=list(csv.DictReader(open(D+\"itan2009_origin_density_digitised.csv\")))
cells=np.array([[float(r[\"Longitude\"]),float(r[\"Latitude\"])] for r in it]); den=np.array([float(r[\"RelativeDensity\"]) for r in it]); area=np.cos(np.radians(cells[:,1])); Pi=den*area; Pi/=Pi.sum()
ps=list(csv.DictReader(open(D+\"origin_smc_particles.csv\"))); la=np.array([float(r[\"OriginLatitude\"]) for r in ps]); lo=np.array([float(r[\"OriginLongitude\"]) for r in ps]); w=np.array([float(r[\"Weight\"]) for r in ps]); w/=w.sum()
O=np.zeros(len(cells))
for a,o,ww in zip(la,lo,w): O += ww*np.exp(-.5*(((cells[:,0]-o)/2.6)**2+((cells[:,1]-a)/2.)**2))
Po=O*area; Po/=Po.sum()
def keep(P,lev):
 order=np.argsort(-P); return order[:np.searchsorted(np.cumsum(P[order]),lev)+1]
print(\"modes Itan ours\",cells[np.argmax(Pi)][::-1],cells[np.argmax(Po)][::-1])
print(\"BC\",np.sqrt(Pi*Po).sum())
for lev in [.5,.95]:
 I=keep(Pi,lev); Oi=keep(Po,lev); print(lev,\"our in Itan\",Po[I].sum(),\"Itan in ours\",Pi[Oi].sum(),\"sizes\",len(I),len(Oi))
# Weighted origin time boundary facts
T=np.array([float(r[\"OriginTimeBP\"]) for r in ps]);
for bound in [6850,6900,7000,7200,7600,8000,8500,9000]: print(\"P(T<=\",bound,\")\",w[T<=bound].sum())
# weighted correlations for key parameters
keys=[\"OriginLatitude\",\"OriginLongitude\",\"OriginTimeBP\",\"InjectFrequency\",\"SelectionBase\",\"SelectionDairying\",\"Migration\"]
X=np.array([[float(r[k]) for k in keys] for r in ps]); mu=w@X; C=(X-mu).T@(w[:,None]*(X-mu)); sd=np.sqrt(np.diag(C)); cor=C/np.outer(sd,sd); print(\"corr keys\",keys); print(np.round(cor,2))
'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
modes Itan ours [48.5 14. ] [44.  -0.5]
BC 0.6068716140260257
0.5 our in Itan 0.0961818426195415 Itan in ours 0.38095299379580316 sizes 182 650
0.95 our in Itan 0.34124218017671515 Itan in ours 0.9989175775388606 sizes 615 1753
P(T<= 6850 ) 0.04923954148994884
P(T<= 6900 ) 0.12313770157714148
P(T<= 7000 ) 0.2949745693943479
P(T<= 7200 ) 0.4488181676347335
P(T<= 7600 ) 0.7286723378645519
P(T<= 8000 ) 0.8959085261335942
P(T<= 8500 ) 0.9733122553151805
P(T<= 9000 ) 1.0
corr keys ['OriginLatitude', 'OriginLongitude', 'OriginTimeBP', 'InjectFrequency', 'SelectionBase', 'SelectionDairying', 'Migration']
[[ 1.    0.25 -0.43 -0.01  0.1  -0.19 -0.04]
 [ 0.25  1.   -0.01  0.12  0.03 -0.1   0.09]
 [-0.43 -0.01  1.    0.05 -0.06 -0.07 -0.08]
 [-0.01  0.12  0.05  1.   -0.   -0.43 -0.05]
 [ 0.1   0.03 -0.06 -0.    1.   -0.43  0.  ]
 [-0.19 -0.1  -0.07 -0.43 -0.43  1.    0.12]
 [-0.04  0.09 -0.08 -0.05  0.    0.12  1.  ]]

exec
/bin/zsh -lc "awk -F, 'NR>1 && "'$11+0 > 0.04080321918842591 {print NR ":" $0; if (++n==3) exit}'"' data/processed/smc_particles.csv && awk -F, 'NR>1 && "'$12+0 > 0.04204896009134267 {print NR ":" $0; if (++n==3) exit}'"' data/processed/origin_smc_particles.csv" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
4:0.011428831484151691,-0.005069449071489148,0.01045530042251828,0.014219209037146133,0.01491156676278058,0.8838398537674879,0.6985252451553147,1.2744105449408385,1.3429240054951856,0.0006568115872700502,0.04315315564942297,0.0006736407097217319
5:-0.007900701980556613,0.0015602479333079872,0.006716449003018545,0.004731714062560974,0.0019148519660706037,2.1089728502782443,1.7634054387861497,1.3908886484969742,2.383740618076389,0.00007845744537571427,0.04304409921431041,0.000020887619910833066
9:0.0110354616334454,-0.007574069422380767,0.0011499098919621354,0.008509981071089657,0.014755294354713268,2.0317129071921403,1.790212458731515,1.3725807835320871,1.0967136442434062,0.0048627830918596725,0.04108745019260799,0.0000244576094728886
2:40.82268190619125,-1.5253360073355733,7026.936493081353,0.005597656584297007,0.02746649265171836,0.34963299337515524,0.958969399715673,1.0265102462761728,1.2074604518004244,2.2117441372974804,0.001182544532135413,0.04389353397205945,0.0048152908684049684
3:42.23282975125726,12.083018249902729,7449.422981299873,0.003349285841021003,0.03699935485025074,0.5979773726274162,2.1220363885747835,0.612393253443003,1.26904223668329,1.108911835593712,0.0013301575471312474,0.043901916894220794,0.00017537144876502897
4:58.28534815280524,31.31353513160655,6807.500505533003,0.012900506128141276,0.0334237988642205,0.15684183320877837,2.1469939043696593,0.7680854316465184,1.0515982983103043,2.311086691361745,0.0030658594817518604,0.043612347333886144,0.00007719610478296385

exec
/bin/zsh -lc "python3 -c 'import csv,numpy as np,math
D=\"data/processed/\"
def rr(n): return list(csv.DictReader(open(D+n,newline=\"\")))
def wq(v,w,q):
 o=np.argsort(v); v=v[o]; w=w[o]; return v[min(np.searchsorted(np.cumsum(w)/w.sum(),q,side=\"left\"),len(v)-1)]
for pre,qfile in [(\"\",\"posterior_parameter_quantiles.csv\"),(\"origin_\",\"origin_posterior_quantiles.csv\")]:
 ps=rr(pre+\"smc_particles.csv\"); qs=rr(qfile); w=np.array([float(r[\"Weight\"]) for r in ps])
 maxerr=0
 for q in qs:
  k=q[\"Parameter\"]
  vals=np.log10([float(r[\"InitialFrequency\"]) for r in ps]) if k==\"Log10InitialFrequency\" else np.log10([float(r[\"InjectFrequency\"]) for r in ps]) if k==\"Log10InjectFrequency\" else np.array([float(r[k]) for r in ps])
  got=[wq(np.asarray(vals),w,x) for x in [.025,.25,.5,.75,.975]]; exp=[float(q[x]) for x in [\"Lower95\",\"Q25\",\"Median\",\"Q75\",\"Upper95\"]]
  maxerr=max(maxerr,max(abs(np.array(got)-exp)))
 print(pre or \"base\",\"quantile max abs diff\",maxerr)
# check regional aggregation
s=rr(\"glad_rs4988235_called_samples.csv\"); b=rr(\"regional_time_binned_frequencies.csv\"); agg={}
for r in s:
 if r[\"Region\"] not in [\"British Isles\",\"Rhine-Danube\",\"Mediterranean\",\"Baltic\",\"Other Europe\"]: continue
 key=(r[\"Region\"],1000*math.floor(float(r[\"MeanDateBP\"])/1000))
 a=agg.setdefault(key,[0,0,0]); a[0]+=int(float(r[\"CalledAlleles\"])); a[1]+=int(float(r[\"DerivedAlleles\"])); a[2]+=1
errs=[]
for i,r in enumerate(b,2):
 key=(r[\"Region\"],int(float(r[\"TimeBinStartBP\"])))
 exp=agg.get(key); got=[int(float(r[\"CalledAlleles\"])),int(float(r[\"DerivedAlleles\"])),int(float(r[\"SampleCount\"]))]
 if exp"'!=got: errs.append((i,key,exp,got))
print("regional aggregate errors",len(errs),errs[:3],"keys missing",set(agg)-{(r["Region"],int(float(r["TimeBinStartBP"]))) for r in b})
'"'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
base quantile max abs diff 0
origin_ quantile max abs diff 0
regional aggregate errors 0 [] keys missing set()

exec
/bin/zsh -lc "python3 -c 'import csv,numpy as np
from scipy.optimize import minimize
D=\"data/processed/\"; s=list(csv.DictReader(open(D+\"glad_rs4988235_called_samples.csv\"))); fits=list(csv.DictReader(open(D+\"regional_logistic_fits.csv\")))
for fr in fits:
 r=fr[\"Region\"]; z=[x for x in s if x[\"Region\"]==r]; t=np.array([(10000-float(x[\"MeanDateBP\"]))/1000 for x in z]); n=np.array([float(x[\"CalledAlleles\"]) for x in z]); y=np.array([float(x[\"DerivedAlleles\"]) for x in z])
 def nll(v):
  eta=v[0]+v[1]*t; return np.sum(n*np.logaddexp(0,eta)-y*eta)
 q=minimize(nll,[-9,1],method=\"Nelder-Mead\",options={\"xatol\":1e-12,\"fatol\":1e-12}); got=np.array([float(fr[\"Alpha\"]),float(fr[\"BetaPerKyrTowardPresent\"])]); print(r,\"stored\",got,\"recalc\",q.x,\"diff\",q.x-got)
'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 776ms:
British Isles stored [-12.02073048   1.46308728] recalc [-12.02073035   1.46308726] diff [ 1.27472735e-07 -1.88121780e-08]
Rhine-Danube stored [-8.59991026  0.93590659] recalc [-8.59991031  0.9359066 ] diff [-4.22569393e-08  7.84750831e-09]
Mediterranean stored [-9.54174199  0.8645457 ] recalc [-9.54174196  0.8645457 ] diff [ 2.83308221e-08 -3.82910947e-09]
Baltic stored [-7.54762883  0.89667703] recalc [-7.54762882  0.89667703] diff [ 1.27347368e-08 -3.76697440e-09]

codex
The stored tables are arithmetically sound where they should be: weighted parameter quantiles reproduce exactly, regional bins re-aggregate exactly, and the four logistic MLEs independently reproduce. The problems are inferential and narrative, not simple CSV corruption—and several headline prose values have in fact drifted from the current CSVs.
web search: 
web search: site:journals.plos.org/ploscompbiol Itan Powell Beaumont Burger Thomas 2009 origins lactase persistence Figure 3 posterior density ...
web search: 
web search: '48.5'
web search: 
web search: "48.5" "13" "lactase persistence" Itan ...
web search: 
web search: 'four regions'
web search: 
web search: 'LP allele frequency'
exec
/bin/zsh -lc 'nl -ba data/processed/README.md && nl -ba data/processed/provenance.json && git status --short' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	# Processed Data
     2	
     3	Cleaned datasets and provenance manifests belong here. Every processed file should state:
     4	
     5	- raw source file names and checksums
     6	- parser version or commit SHA
     7	- filtering decisions
     8	- column definitions
     9	- creation date
    10	
     1	{
     2		"created_at":"2026-09-01T11:14:32",
     3		"raw_file":"glad_adna_15-8-22.xlsx",
     4		"raw_sha256":"1adc0acd81e1fed8d8a906b20b8d1f517fffc5a38790ce8c973babab0602b0fb",
     5		"parser":"LactasePersistenceSpatial` ParseGLADWorkbook",
     6		"source_url":"https:\/\/www.ucl.ac.uk\/biosciences\/sites\/biosciences\/files\/glad_adna_15-8-22.xlsx",
     7		"total_rows":2999,
     8		"called_rows_with_age_location":1785,
     9		"time_bin_years":1000,
    10		"region_assignment":"Coarse country and latitude\/longitude heuristic matching Evershed et al. four-region framing."
    11	}
exec
/bin/zsh -lc "python3 -c 'import csv,collections
s=list(csv.DictReader(open(\"data/processed/glad_rs4988235_called_samples.csv\")))
regs={\"British Isles\",\"Rhine-Danube\",\"Mediterranean\",\"Baltic\"}
leak=[r for r in s if r[\"Region\"] in regs and 2500<float(r[\"MeanDateBP\"])<3000]
print(\"time-slice leakage rows\",len(leak),\"called\",sum(int(r[\"CalledAlleles\"]) for r in leak),\"derived\",sum(int(r[\"DerivedAlleles\"]) for r in leak),collections.Counter(r[\"Region\"] for r in leak))
held=[r for r in s if r[\"Region\"] in regs and 2000<=float(r[\"MeanDateBP\"])<3000]
print(\"held 2500 bins rows\",len(held),\"called\",sum(int(r[\"CalledAlleles\"]) for r in held),\"derived\",sum(int(r[\"DerivedAlleles\"]) for r in held))
'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
time-slice leakage rows 24 called 39 derived 4 Counter({'Mediterranean': 17, 'British Isles': 3, 'Baltic': 2, 'Rhine-Danube': 2})
held 2500 bins rows 50 called 78 derived 9

exec
/bin/zsh -lc 'nl -ba scripts/run_tests.wls && command -v wolframscript || true && git status --short' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	#!/usr/local/bin/wolframscript -script
     2	
     3	root = DirectoryName[DirectoryName[$InputFileName]];
     4	testFiles = FileNames["*.wlt", FileNameJoin[{root, "tests"}]];
     5	
     6	If[testFiles === {},
     7	  Print["No test files found."];
     8	  Exit[1]
     9	];
    10	
    11	report = TestReport[testFiles];
    12	Print[report];
    13	
    14	If[TrueQ[report["AllTestsSucceeded"]],
    15	  Exit[0],
    16	  Exit[1]
    17	];
    18	
/opt/homebrew/bin/wolframscript

codex
I’m also running the existing test suite once—not because passing smoke tests would validate the science, but to separate “the tests fail” from the more serious finding that the tests do not exercise the claims being made. No files are being edited.
exec
/bin/zsh -lc 'wolframscript -file scripts/run_tests.wls' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 exited 255 in 178ms:

A WolframKernel location could not be determined.

Use -configure to set WOLFRAMSCRIPT_KERNELPATH.
Alternatively, export WolframKernel=/yourpath/WolframKernel.

If you have no Wolfram product currently installed,
 the free Wolfram Engine for developers can be downloaded
 at https://www.wolfram.com/engine/.


exec
/bin/zsh -lc 'ls -d /Applications/Wolfram*.app /Applications/Mathematica*.app 2>/dev/null || true && git status --short' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
zsh:1: no matches found: /Applications/Mathematica*.app

exec
/bin/zsh -lc "find /Applications -maxdepth 1 -type d -iname '*Wolfram*.app' -o -maxdepth 1 -type d -iname '*Mathematica*.app'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
/Applications/WolframScript.app
/Applications/Wolfram.app

exec
/bin/zsh -lc '/Applications/Wolfram.app/Contents/MacOS/wolframscript -local /Applications/Wolfram.app/Contents/MacOS/WolframKernel -file scripts/run_tests.wls' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
codex
The first `wolframscript` entry point was misconfigured; the bundled Wolfram kernel is available and the suite is now running through it. It is slow because several “unit” tests call live geographic elevation data, which is itself a reproducibility weakness I’ll include.
2026-09-01T10:51:27.246012Z ERROR codex_core::tools::router: error=write_stdin failed: stdin is closed for this session; rerun exec_command with tty=true to keep stdin open
exec
/bin/zsh -lc "pgrep -fl 'WolframKernel|wolframscript'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 exited 3 in 0ms:
sysmon request failed with error: sysmond service not found
pgrep: Cannot get process list

exec
/bin/zsh -lc "pkill -f '/Applications/Wolfram.app/Contents/MacOS/wolframscript -local /Applications/Wolfram.app/Contents/MacOS/WolframKernel -file scripts/run_tests.wls'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 exited 3 in 0ms:
sysmon request failed with error: sysmond service not found
pkill: Cannot get process list

exec
/bin/zsh -lc "pkill -f '/Applications/Wolfram.app/Contents/MacOS/wolframscript -local /Applications/Wolfram.app/Contents/MacOS/WolframKernel -file scripts/run_tests.wls'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
exec
/bin/zsh -lc "ps -axo pid,ppid,etime,command | rg 'WolframKernel|wolframscript.*run_tests'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
34764 14109    04:58:40 /Applications/Wolfram.app/Contents/MacOS/WolframKernel -wstp -linkprotocol SharedMemory -linkconnect -linkname 4vcjk_shm
51261 50545       04:25 /Applications/Wolfram.app/Contents/MacOS/wolframscript -local /Applications/Wolfram.app/Contents/MacOS/WolframKernel -file scripts/run_tests.wls
51568 50545       00:00 /bin/zsh -c ps -axo pid,ppid,etime,command | rg 'WolframKernel|wolframscript.*run_tests'
51570 51568       00:00 rg WolframKernel|wolframscript.*run_tests

exec
/bin/zsh -lc 'kill 51261' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
exec
/bin/zsh -lc 'ps -p 51261 -o pid=,etime=,command=' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
51261 04:48 /Applications/Wolfram.app/Contents/MacOS/wolframscript -local /Applications/Wolfram.app/Contents/MacOS/WolframKernel -file scripts/run_tests.wls

 exited 137 in 292771ms:
exec
/bin/zsh -lc 'kill -9 51261' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
exec
/bin/zsh -lc 'ps -p 51261 -o pid=,etime=,command=' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 exited 1 in 0ms:
exec
/bin/zsh -lc 'git status --short' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
exec
/bin/zsh -lc "nl -ba docs/run-summary.md | sed -n '1,80p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
     1	# Run Summary
     2	
     3	Generated: 2026-08-31T23:54:37
     4	
     5	Pipeline: GLAD ancient rs4988235 genotypes (derived from AADR v44.3), regional binomial logistic reproduction, coarse spatial diffusion-selection model, SMC-ABC inference with spatial-gradient summary statistics, posterior predictive checks, held-out validation, and prior sensitivity analysis.
     6	
     7	## Key Outputs
     8	
     9	- Processed samples: `data/processed/glad_rs4988235_called_samples.csv`
    10	- Regional binned frequencies: `data/processed/regional_time_binned_frequencies.csv`
    11	- Regional logistic fits: `data/processed/regional_logistic_fits.csv`
    12	- Regional reproduction figure: `figures/generated/regional_logistic_reproduction.png`
    13	- SMC particles with weights: `data/processed/smc_particles.csv`
    14	- Resampled posterior draws: `data/processed/abc_posterior.csv`
    15	- SMC diagnostics: `data/processed/smc_diagnostics.csv`
    16	- Posterior parameter quantiles: `data/processed/posterior_parameter_quantiles.csv`
    17	- Posterior predictive checks: `data/processed/posterior_predictive_regional.csv`
    18	- Parameter posterior figure: `figures/generated/abc_parameter_posteriors.png`
    19	- Posterior predictive figure: `figures/generated/posterior_predictive_regional.png`
    20	- Held-out-region cross-validation: `data/processed/cross_validation_by_region.csv`
    21	- Time-slice validation: `data/processed/time_slice_validation.csv`
    22	- Sensitivity quantiles: `data/processed/sensitivity_posterior_quantiles.csv`
    23	- Sensitivity figure: `figures/generated/sensitivity_intervals.png`
    24	- Spatial mean map: `figures/generated/spatial_posterior_mean_3000bp.png`
    25	- Spatial uncertainty map: `figures/generated/spatial_uncertainty_width_3000bp.png`
    26	- Spatial GIF animation: `figures/generated/lactase_persistence_spatial_posterior.gif`
    27	- Spatial MP4 video: `figures/generated/lactase_persistence_spatial_posterior.mp4`
    28	- iCloud GIF copy: `/Users/thiel/Library/Mobile Documents/com~apple~CloudDocs/Documents/Codex/20260831_235437_lactase_persistence_spatial_posterior.gif`
    29	- iCloud MP4 copy: `/Users/thiel/Library/Mobile Documents/com~apple~CloudDocs/Documents/Codex/20260831_235437_lactase_persistence_spatial_posterior.mp4`
    30	
    31	## Inference Notes
    32	
    33	SMC-ABC: 400 particles, 5 tolerance generations, final epsilon 0.0408, final ESS 26.6, 8400 total simulations.
    34	
    35	## Scientific Status
    36	
    37	The regional logistic layer is a qualitative reproduction of the published four-region framing, not a claim of exact parameter identity with Evershed et al. 2022. The spatial model is deliberately coarse; ordinary kriging is a display layer only. Posterior uncertainty, held-out validation, and prior sensitivity are reported alongside every point summary.
exec
/bin/zsh -lc "cmp -s src/LactasePersistenceSpatial.wl community/LactasePersistenceSpatial.wl; printf 'package_copy_equal=%s\\n' \""'$?" && git status --short' in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
package_copy_equal=0

exec
/bin/zsh -lc "nl -ba /Users/thiel/.codex/memories/MEMORY.md | sed -n '919,947p'" in /Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram
 succeeded in 0ms:
   919	scope: strictly read-only, code-anchored review of Gaussian, generalized, nonlinear, and inference kernels plus the complete Wolfram test suite; use when the requested outcome is a statistical-correctness, numerical-robustness, and test-adequacy findings report
   920	applies_to: cwd=/Users/thiel/Documents/Codex/2026-07-31/is-i/work/MMA MixedEffects; reuse_rule=reuse the review protocol and code-location map for similar read-only reviews of this paclet, but treat findings, line numbers, test results, and missing functionality as checkout-specific until reconfirmed
   921	
   922	## Task 1: Audit Gaussian, generalized, nonlinear, inference kernels and every `Tests/` file; inspection completed but final review not emitted
   923	
   924	### rollout_summary_files
   925	
   926	- rollout_summaries/2026-08-02T13-37-08-nchy-mixed_effects_read_only_code_review_partial.md (cwd=/Users/thiel/Documents/Codex/2026-07-31/is-i/work/MMA MixedEffects, rollout_path=/Users/thiel/.codex/sessions/2026/08/02/rollout-2026-08-02T14-37-08-019fc2b1-532e-7773-ae76-2bbed2d373a8.jsonl, updated_at=2026-08-02T13:43:53+00:00, thread_id=019fc2b1-532e-7773-ae76-2bbed2d373a8, partial: full requested inspection but no final findings report)
   927	
   928	### keywords
   929	
   930	- Wolfram Language, MMA MixedEffects, GaussianEngine.wl, GeneralizedEngine.wl, NonlinearEngine.wl, Inference.wl, Tests/RunAllTests.wls, REML, PIRLS, Laplace, AGHQ, Satterthwaite, Kenward-Roger, geConditionalMode, PredictionInterval, scaling, SeedRandom
   931	
   932	## User preferences
   933	
   934	- when the user said "Read-only code review. Do not edit, create, or write any files" -> preserve strict no-write behavior throughout similar reviews. [Task 1]
   935	- when the user required every finding to identify a file/symbol, quote or precisely paraphrase code, and severity, and said "Do not speculate about code you have not opened" -> make every finding code-grounded; distinguish verified defects, explicitly absent logic, and unverified concerns. [Task 1]
   936	- when the user required reading all listed files fully and reviewing every test under `Tests/` -> inventory and exhaustively inspect that scope before synthesizing conclusions, without asking clarifying questions. [Task 1]
   937	
   938	## Reusable knowledge
   939	
   940	- The inspected scope was 4 kernel files plus 19 test/runner files (about 3,843 lines). `Tests/RunAllTests.wls` enumerates 10 `.wlt` suites; external reference targets appear in `PublicReferenceRegression.wlt` (R `lme4`/`nlme`) and `PublicInferenceReferenceTests.wlt` (lmerTest/pbkrtest), but this rollout did not execute them. [Task 1]
   941	- `Kernel/GaussianEngine.wl:408-475` implements the profiled Gaussian ML/REML objective with block whitening, Woodbury/determinant identities, and `log|X'V^-1X|` for REML; ML/REML branches are at lines 449-451. `gaussianLambdaFromTheta` (`:173-187`) accepts zero diagonal boundary estimates and rejects negative diagonals, covered by `gaussian-engine-lambda-boundary`, `gaussian-engine-boundary-diagnostic`, and `gaussian-engine-zero-variance-modes`. [Task 1]
   942	- `Inference.wl` has Satterthwaite and Kenward-Roger routines with symmetric pseudoinverses, rank tolerances, and derivative formulas; `Tests/InferenceTests.wlt` covers derivative identities, rank-deficient contrasts, zero variance-parameter uncertainty, and basic KR properties. [Task 1]
   943	- `GeneralizedEngine.wl:296-328` builds PIRLS working response/weights; `:367-461` supplies conditional objective/Hessian and Laplace NLL; `:527-567` supplies AGHQ. Tests include finite-difference gradient/Hessian checks, scalar AGHQ versus `NIntegrate`, and one-point AGHQ/Laplace equality. `NonlinearEngine.wl:208-253` includes the exact observed-Hessian correction, with nonlinear Laplace (`:323-353`) and AGHQ (`:402-462`) covered by symbolic-derivative, scalar-integration, and factorization tests. [Task 1]
   944	
   945	## Failures and how to do differently
   946	
   947	- Symptom: inspection is complete but no user-facing review arrives -> cause: time was spent on analysis without reserving output time -> fix: before deep inspection, reserve time for the requested numbered findings (file/symbol, precise code quote/paraphrase, severity) and 3-5-sentence overall summary. [Task 1]

All requested files and all processed CSVs were inspected; headline quantities were independently recomputed, and the repository remains clean.
  ✓ Inspect prior project-relevant memory and repository state
  ✓ Read model, notebook builder, README, digitisation script, tests, and processed CSVs with line evidence
  ✓ Recompute claimed quantities and test internal consistency
  ✓ Rank all methodological, statistical, and code-level weaknesses with concrete fixes
codex
Verdict: reject the quantitative origin and “calibrated posterior” claims in their present form. The regional CSV aggregation, weighted quantiles, and logistic MLEs are internally reproducible; the serious problems are the inferential target, SMC implementation, validation leakage, prior-driven origin date, and invalid conversion of Itan et al.’s rendered figure into a numerical posterior.

## Critical findings

1. **The origin is not fitted to genuinely spatial observations.**

   The primary summaries are four regional time series, predicted as the unweighted mean of every cell in each region ([src:688](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:688), [src:693](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:693)). The only additional spatial information is north–south and west–east pooled contrasts in two broad time windows ([src:1321](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1321), [src:1384](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1384)). The point-source model reuses exactly this distance ([src:2105](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2105)). Those summaries cannot defensibly locate a source within Europe.

   **Fix:** fit sample-level genotype/genotype-likelihood observations at their actual coordinates and ages, or use validated arrival-time/wave-front summaries. Demonstrate source-location recovery with simulation-based calibration before interpreting real-data locations.

2. **This is deterministic minimum-distance fitting labelled as ABC, not a calibrated generative analysis.**

   `SMCDistanceForVector` compares deterministic expected frequencies with observed summaries; no allele sampling, genotyping error, drift, or residual model is simulated ([src:1418](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1418)). Binomial noise appears only later in the posterior-predictive display ([src:769](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:769)). The distance also double-uses the same alleles in regional bins and compass contrasts with arbitrary called-allele weights.

   **Fix:** use the tractable binomial/genotype likelihood directly, including ploidy and genotype uncertainty. If ABC is retained, simulate the same observation process as the data, standardize summaries by their covariance, and verify frequentist coverage/SBC.

3. **The SMC population does not target the reported final tolerance.**

   Generation 1 retains every prior draw and merely records its median distance as ε ([src:1503](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1503)). Later generations accept below the *previous* ε, then report the median of that accepted population as a new ε without filtering against it ([src:1530](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1530), [src:1553](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1553)).

   In the stored base run, 200/400 particles exceed the reported final ε=0.040803; they carry 27.7% of the posterior weight. In the origin run, 400/800 exceed ε=0.042049 and carry 40.1% of the weight ([base diagnostics](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/smc_diagnostics.csv:6), [origin diagnostics](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_smc_diagnostics.csv:7)).

   **Fix:** predefine each generation’s tolerance and sample until all particles satisfy that tolerance. Store both “acceptance threshold used” and “candidate next threshold”; add a test asserting every retained distance is below the population’s stated ε.

4. **The reported origin date is prior-bound and discretized, not “well identified.”**

   The origin-time prior is only 6800–9600 BP ([src:2089](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2089)); the stored 95% lower bound is 6807.8 BP—essentially the prior boundary ([origin quantiles](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_posterior_quantiles.csv:4)). Itan’s published interval extends to 6256 BP, which this model forbids. Moreover, continuous origin times are injected only when a 250-year simulation step is crossed ([src:650](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:650), [src:668](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:668)).

   **Fix:** widen the prior substantially, parameterize time at the actual model resolution or integrate within steps, report boundary sensitivity, and run time-recovery simulations. The current result should be described as “prior-limited,” not well identified.

5. **The location has fake continuous precision.**

   Continuous latitude/longitude proposals are snapped to the nearest 2° grid cell ([src:656](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:656)). Within a cell’s Voronoi region the simulated trajectory is identical, yet medians are reported to tenths of a degree. The 95% latitude interval spans 84.6% of its prior width and longitude spans 91.8% ([origin quantiles](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_posterior_quantiles.csv:2)). The repository’s own mode-stability table moves the mode from northern Germany to France and Iberia under modest bandwidth/resampling changes ([mode stability](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_mode_stability.csv:2)).

   **Fix:** make origin cell a discrete parameter, or use a genuinely continuous spatial solver/source interpolation. Report cell or broad-region probabilities, not decimal-degree coordinates or a star.

6. **The gene–culture constraint materially creates the result and is inaccurately described.**

   Origins more than 800 years *before* local dairying are penalized, but origins any number of years *after* onset remain allowed ([src:1431](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1431)). Therefore the prose “where dairying already existed, within 800 years of local onset” is false ([notebook:699](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:699)). The constraint also uses an unsupported six-anchor onset surface.

   The notebook calls Itan and this analysis nearly independent, although the current analysis also incorporates archaeological onset dates and a gene–culture constraint. Itan explicitly states that its origin date was strongly influenced by farming-arrival timing. [PLOS paper](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000491)

   **Fix:** fit and compare unconstrained, hard-constrained, and probabilistic archaeology-informed models; propagate onset-date uncertainty; state clearly that the date comparison is not independent.

7. **The Itan figure cannot support the claimed Bhattacharyya/HPD arithmetic.**

   The script assumes hue position on a hand-coded blue–red ramp is linearly proportional to posterior density ([digitiser:33](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:33), [digitiser:110](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:110)). But Itan’s caption says only that points are regression-adjusted accepted simulations and shading was added with 2D KDE; it supplies no numerical colour scale. [PLOS Figure 3 description](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000491)

   The digitiser further:

   - hardcodes one machine’s absolute path ([line 16](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:16));
   - uses undocumented pixel/control-point constants ([line 23](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:23));
   - claims to average a 5×5 window but actually keeps the first non-NaN pixel ([lines 78–85](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:78));
   - truncates both distributions to the successfully colour-classified Itan support and renormalizes;
   - writes an NPZ, not the CSV the notebook says it writes ([digitiser:89](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:89), [notebook:788](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:788)).

   **Fix:** obtain the accepted coordinates or numerical KDE from the authors/source code. Without that, restrict the comparison to a qualitative/georeferenced mode and explicitly quantify digitisation uncertainty—do not publish distributional overlap coefficients.

8. **The held-out-time validation leaks training observations into the test bins.**

   Training retains samples with age `>2500`, while test summaries retain bins whose midpoint is `<=2500` ([src:1737](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1737), [src:1739](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1739)). The 2500-BP bin covers 2000–2999 BP, so samples dated 2501–2999 appear in both sets. I find 24 overlapping individuals, 39 called alleles—half of the 50 individuals in those held bins.

   **Fix:** split raw observations on non-overlapping bin edges, construct training and test summaries independently, and assert zero sample-ID overlap.

9. **The “diffusion” operator is not a physically interpretable or conservative migration model.**

   Each cell relaxes toward its neighbours’ mean ([src:621](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:621)). On an irregular land graph this does not conserve total allele mass; diagonal and cardinal neighbours receive equal weights despite different distances; longitude spacing changes with latitude; cells have unequal surface area; and boundaries/isolated islands change dynamics arbitrarily. The origin model’s migration prior of 0.02–0.6 per generation is orders of magnitude wider than the base model and lacks km²/generation interpretation ([src:2094](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2094)).

   **Fix:** use a conservative area-weighted graph Laplacian or finite-volume PDE with edge lengths, cell areas, coastline connections, and diffusion parameters in physical units; demonstrate grid-resolution convergence.

10. **Selection coefficients are not comparable across the implementation and cited studies.**

   The post calls LP effectively dominant ([notebook:355](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:355)) but interprets logistic slopes as genic/codominant selection ([notebook:388](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:388)). The simulator uses a continuous logistic/Malthusian rate, not a discrete diploid fitness recursion ([src:629](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:629)). Worse, the reported origin-model “total in dairying cells” adds `SelectionBase + SelectionDairying` and omits the regional multiplier that the simulator actually applies ([notebook:833](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:833), [src:630](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:630)). Itan’s coefficient was specifically selection among dairying farmers, not this additive rate. [PLOS parameter discussion](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000491)

   **Fix:** define genotype fitnesses and dominance explicitly, compute derived quantities jointly from each posterior particle including multipliers, and compare only coefficients with matching biological definitions and time units.

## High-severity weaknesses

11. **“Positive dairying selection belongs to the data” is tautological.** `SelectionDairying` is constrained to `[0,0.06]` in every baseline scenario ([src:709](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:709)). A continuous non-negative prior produces positive medians almost automatically; it cannot establish evidence against zero. **Fix:** use a spike at zero/model comparison or permit signed effects and report Bayes factors/out-of-sample scores.

12. **The sensitivity analysis is not a sensitivity analysis of the reported fit.** It hardcodes a 4° grid while the main analysis uses 2° ([src:1780](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1780), [builder:47](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:47)), uses fewer particles/generations, has no scenario ESS table, and is contradicted by its current CSV. **Fix:** hold resolution and computational accuracy fixed, repeat seeds, and include posterior/ESS/shortfall diagnostics for every scenario.

13. **Severe weight degeneracy is propagated into tiny unweighted samples.** Final ESS is 26.6/400; the ten largest weights contain 47.9% of mass. Only 46 unique particles appear in the 100-row `abc_posterior.csv`. Downstream maps and intervals then use unweighted quantiles of those 100 draws ([src:1102](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1102)). **Fix:** retain weights for all functionals, increase effective sampling, use rejuvenation moves, and repeat independent chains/runs.

14. **Parameterization is deeply confounded.** Baseline selection, dairying selection, four regional multipliers, initial frequency/gradients, migration, source time, and injection frequency trade off against one another; no parameter-recovery exercise is provided. **Fix:** simplify and hierarchically parameterize the model, publish joint correlations, and require SBC/recovery before interpreting marginals.

15. **Observations older than the simulator are silently clamped.** The simulator begins at 10,000 BP, but binned data include 10,500, 14,500, and 24,500 BP ([regional CSV:27](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/regional_time_binned_frequencies.csv:27), [regional CSV:30](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/regional_time_binned_frequencies.csv:30)). `FrequenciesAt` simply takes the nearest model time ([src:677](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:677)), while the gradient index separately excludes ages above 12,000. **Fix:** extend the simulation past the oldest observation or exclude pre-start samples consistently.

16. **The analysis population is overstated and inconsistently narrated.** The processed CSV has 1,785 called rows, but 681 are “Outside Europe”; 1,054 contribute to regional summaries and another 50 only to gradients. The “eight earliest carriers” table includes Afghanistan and Ukraine, both excluded from inference ([Afghanistan row](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/glad_rs4988235_called_samples.csv:503), [Ukraine row](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/glad_rs4988235_called_samples.csv:1124)), while the prose silently omits Afghanistan ([notebook:678](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:678)). **Fix:** filter the modelling population first and report raw, usable, European, regional-summary, and spatial-summary sample counts separately.

17. **Genotype and dating uncertainty are discarded.** The parser retains only the most-likely call and mean date ([src:293](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:293)); 480 calls are depth-one pseudo-haploid observations, yet all called alleles enter the same binomial counting model. No genotype likelihoods, damage/error model, relatedness, ancestry, or calibrated-age distributions are used. **Fix:** ingest genotype likelihoods and date posteriors, model ploidy explicitly, and adjust for ancestry/kinship or acknowledge that selection and migration are confounded with population replacement.

18. **Posterior-predictive “coverage” is not calibration.** All 37 stored in-sample bins are covered, many because tiny allele counts produce intervals such as `[0,1]` ([PPC CSV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/posterior_predictive_regional.csv:2)). All four regional CV coverages and the time-slice coverage are also 1.0 ([regional CV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/cross_validation_by_region.csv:2)). **Fix:** report log score/CRPS, calibration by nominal level, spatially blocked holdouts, rolling-origin validation, and uncertainty across repeated SMC fits.

19. **The “prior-free” origin surface is neither prior-free nor evidence for exclusion.** It fixes every nuisance parameter at posterior medians learned under the priors/constraint, evaluates a single conditional slice, and rescales the best and worst distances to `[0,1]` ([src:2253](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2253), [src:2284](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2284)). No threshold supports “Iberia and the Balkans are ruled out.” **Fix:** profile or marginalize nuisance parameters per source cell and calibrate Δ-distance by simulation; otherwise label it only as a conditional visualization.

20. **The regional layer is not a reproduction of Evershed et al.’s model.** It uses an undocumented country/rectangle classifier ([src:248](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:248)) and four independent bounded logistic regressions, without ancestry, demographic, or ecological terms. The repository later admits it is qualitative ([run summary](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/docs/run-summary.md:35)). **Fix:** reproduce the published R analysis/figure numerically before calling this a reproduction; otherwise call it a new descriptive stratification.

21. **The dairying field is essentially invented.** Six fixed anchors are inverse-distance interpolated with no archaeological source or uncertainty ([src:269](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:269)). Uniform ±400-year shifts do not test alternate spatial patterns or smoothing scales. **Fix:** use published site-level onset evidence and propagate its posterior uncertainty.

22. **The core model omits exactly the processes needed for an origin claim.** There is no drift, population density, ancestry replacement, demic expansion, long-distance movement, standing variation, or mutation; the point-source model starts at exact zero everywhere. These are not cosmetic omissions for Holocene Europe. **Fix:** either implement a stochastic demographic model or recast the output explicitly as a deterministic visualization, not historical localization.

## Code, reproducibility, and test weaknesses

23. **Cached posteriors can silently belong to a different dataset, grid, prior, or code version.** Both loaders check only whether particle and diagnostics files exist and then ignore requested options ([src:1963](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1963), [src:2113](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2113)). Loaded results are marked `GenerationShortfall -> False` without evidence. **Fix:** cache by hashes of samples, grid, code commit, prior, seed, and full options; reject mismatches.

24. **The land mask is network/data-version dependent and fails silently.** If `GeoElevationData` fails, every candidate cell is treated as land ([src:550](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:550)); display masks have a similar all-land fallback. **Fix:** commit a versioned land mask/grid and fail loudly if it cannot be loaded.

25. **The 24 tests are almost entirely smoke tests.** The simulator test checks only array dimensions ([tests:112](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/tests/core.wlt:112)); the SMC test permits a first-generation-only result and never tests tolerance correctness ([tests:227](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/tests/core.wlt:227)). There are no origin, constraint, conservation, time-split, cache-invalidation, digitisation, headline-number, or simulation-recovery tests.

   I attempted the suite through the bundled kernel. It produced no output for over four minutes and was terminated; the likely exposure is repeated live `GeoElevationData` calls. This is not evidence that tests fail, but they are not currently a fast, isolated verification gate.

   **Fix:** use committed grid fixtures, deterministic unit tests for dynamics and SMC invariants, end-to-end CSV regressions, and simulation-based scientific tests.

26. **Parsing downloaded data through `ToExpression` is unsafe and permissive.** Arbitrary cell text is evaluated as Wolfram code ([src:92](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:92)); coordinates are repeatedly divided by ten until plausible rather than flagged ([src:104](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:104)). Genotypes are counted by characters without a strict whitelist ([src:232](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:232)). **Fix:** use strict numeric parsing, explicit permitted genotype encodings, range validation, and a correction log.

27. **SMC density arithmetic is numerically fragile.** Products of 10–11 univariate Gaussian densities and logistic prior densities are formed on the ordinary scale ([src:1445](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1445), [src:1475](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1475)); a `10^-300` floor conceals underflow. The diagonal kernel ignores strong posterior correlations. **Fix:** compute in log space with log-sum-exp and use a regularized multivariate covariance or MCMC move kernel.

28. **Processed-output provenance is insufficient.** The manifest records a parser name but no code commit, package hash, command line, seed, grid hash, prior, or per-output checksum ([provenance](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/provenance.json:1)). `origin_mode_stability.csv` has no producer found in the repository; the digitisation CSV is not written by the named script. **Fix:** emit a machine-readable run manifest covering every derived file.

29. **Modern-frequency “validation” is hardcoded and unauditable.** Four 1000 Genomes values are embedded directly in notebook code with no versioned input table or retrieval provenance ([notebook:848](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:848)). **Fix:** store the authoritative source extract, allele orientation, population/sample counts, version, and checksum.

30. **The visual uncertainty is incomplete.** The bands reflect only parameter variation from a low-ESS deterministic model; they omit genotype, dating, drift, demographic, model-form, grid, and kriging uncertainty. Calling them “calibrated” is unjustified. **Fix:** relabel them as conditional parameter intervals until full uncertainty is propagated.

## Verified prose/data inconsistencies

| Claim | Current evidence | Required correction |
|---|---|---|
| “39 bins” ([notebook:491](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:491)) | Current PPC has 37 rows. | Say 37. |
| PPC coverage 0.97 ([README:43](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:43)) | All 37 `Covered95` values are true: coverage 1.00. | Regenerate prose and discuss overcoverage. |
| “10,000 simulations” ([notebook:513](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:513)) | Run summary records 8,400 ([line 33](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/docs/run-summary.md:33)); origin diagnostics imply 31,200. | Report actual totals separately. |
| Dairy medians 0.008–0.019 ([notebook:644](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:644)) | CSV range is 0.00206–0.01400 ([sensitivity CSV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/sensitivity_posterior_quantiles.csv:2)). | Replace and withdraw “belongs to data.” |
| Migration 0.010 → 0.020 under wide prior ([notebook:648](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:648)) | Current medians are 0.00716 → 0.00539. | Correct; the direction is reversed. |
| “Comfortably bracketing” Burger’s 0.06 ([notebook:388](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:388)) | Regional estimates span 0.0242–0.0410 ([fits CSV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/regional_logistic_fits.csv:2)). | “Does not bracket 0.06.” |
| README says 4° inference grid ([README:53](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:53)) | Main builder/package use 2°; sensitivity uses 4°. | State both accurately. |
| Itan BC 0.62; masses 0.10/0.36 ([README:31](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:31)) | Direct weighted recomputation gives 0.607, 0.096, 0.341. Notebook values depend on Monte Carlo resampling. | Use exact particle weights—subject to the larger digitisation invalidity. |
| “Their text reports 48.5N, 13E” | The official article text describes only a central-Balkans/central-Europe region and KDE; no coordinate was found. | Attribute 13E to the project’s reading/digitisation unless a primary textual source is supplied. |
| Hero says “8000 BC to today” ([notebook:231](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:231)) | `FormatYearLabel` maps 8000 BP to 6050 BC and 0 BP to AD 1950 ([src:1854](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1854)). | Say 8000 BP to 1950, or alter the time convention. |
| “All numbers computed at build time, so text cannot drift” ([builder:15](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:15)) | Numerous headline values above are hardcoded and stale. | Generate every numeric sentence from current tables and fail the build on mismatches. |
| README first implies location agreement ([README:19](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:19)), then says location does not agree ([README:31](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:31)). | Marginal medians are being compared despite a broad multimodal posterior. | Remove the first agreement claim. |
| Project target alternates between Evershed/GLAD and Allentoft ([README:69](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:69), [README:116](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:116)). | Executable source is GLAD/Evershed. | Delete the stale Allentoft specification. |

The defensible Community post today is: a polished Wolfram implementation of a deterministic, coarse-grid exploratory model whose regional data cleaning and logistic summaries are reproducible. It is not yet a statistically calibrated ancient-DNA localization of lactase-persistence origin, and the Itan distributional comparison should be removed pending numerical source data.

No repository files were modified; the worktree remains clean at commit `69bbe7c`.


tokens used
270,242
Verdict: reject the quantitative origin and “calibrated posterior” claims in their present form. The regional CSV aggregation, weighted quantiles, and logistic MLEs are internally reproducible; the serious problems are the inferential target, SMC implementation, validation leakage, prior-driven origin date, and invalid conversion of Itan et al.’s rendered figure into a numerical posterior.

## Critical findings

1. **The origin is not fitted to genuinely spatial observations.**

   The primary summaries are four regional time series, predicted as the unweighted mean of every cell in each region ([src:688](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:688), [src:693](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:693)). The only additional spatial information is north–south and west–east pooled contrasts in two broad time windows ([src:1321](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1321), [src:1384](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1384)). The point-source model reuses exactly this distance ([src:2105](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2105)). Those summaries cannot defensibly locate a source within Europe.

   **Fix:** fit sample-level genotype/genotype-likelihood observations at their actual coordinates and ages, or use validated arrival-time/wave-front summaries. Demonstrate source-location recovery with simulation-based calibration before interpreting real-data locations.

2. **This is deterministic minimum-distance fitting labelled as ABC, not a calibrated generative analysis.**

   `SMCDistanceForVector` compares deterministic expected frequencies with observed summaries; no allele sampling, genotyping error, drift, or residual model is simulated ([src:1418](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1418)). Binomial noise appears only later in the posterior-predictive display ([src:769](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:769)). The distance also double-uses the same alleles in regional bins and compass contrasts with arbitrary called-allele weights.

   **Fix:** use the tractable binomial/genotype likelihood directly, including ploidy and genotype uncertainty. If ABC is retained, simulate the same observation process as the data, standardize summaries by their covariance, and verify frequentist coverage/SBC.

3. **The SMC population does not target the reported final tolerance.**

   Generation 1 retains every prior draw and merely records its median distance as ε ([src:1503](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1503)). Later generations accept below the *previous* ε, then report the median of that accepted population as a new ε without filtering against it ([src:1530](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1530), [src:1553](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1553)).

   In the stored base run, 200/400 particles exceed the reported final ε=0.040803; they carry 27.7% of the posterior weight. In the origin run, 400/800 exceed ε=0.042049 and carry 40.1% of the weight ([base diagnostics](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/smc_diagnostics.csv:6), [origin diagnostics](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_smc_diagnostics.csv:7)).

   **Fix:** predefine each generation’s tolerance and sample until all particles satisfy that tolerance. Store both “acceptance threshold used” and “candidate next threshold”; add a test asserting every retained distance is below the population’s stated ε.

4. **The reported origin date is prior-bound and discretized, not “well identified.”**

   The origin-time prior is only 6800–9600 BP ([src:2089](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2089)); the stored 95% lower bound is 6807.8 BP—essentially the prior boundary ([origin quantiles](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_posterior_quantiles.csv:4)). Itan’s published interval extends to 6256 BP, which this model forbids. Moreover, continuous origin times are injected only when a 250-year simulation step is crossed ([src:650](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:650), [src:668](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:668)).

   **Fix:** widen the prior substantially, parameterize time at the actual model resolution or integrate within steps, report boundary sensitivity, and run time-recovery simulations. The current result should be described as “prior-limited,” not well identified.

5. **The location has fake continuous precision.**

   Continuous latitude/longitude proposals are snapped to the nearest 2° grid cell ([src:656](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:656)). Within a cell’s Voronoi region the simulated trajectory is identical, yet medians are reported to tenths of a degree. The 95% latitude interval spans 84.6% of its prior width and longitude spans 91.8% ([origin quantiles](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_posterior_quantiles.csv:2)). The repository’s own mode-stability table moves the mode from northern Germany to France and Iberia under modest bandwidth/resampling changes ([mode stability](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/origin_mode_stability.csv:2)).

   **Fix:** make origin cell a discrete parameter, or use a genuinely continuous spatial solver/source interpolation. Report cell or broad-region probabilities, not decimal-degree coordinates or a star.

6. **The gene–culture constraint materially creates the result and is inaccurately described.**

   Origins more than 800 years *before* local dairying are penalized, but origins any number of years *after* onset remain allowed ([src:1431](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1431)). Therefore the prose “where dairying already existed, within 800 years of local onset” is false ([notebook:699](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:699)). The constraint also uses an unsupported six-anchor onset surface.

   The notebook calls Itan and this analysis nearly independent, although the current analysis also incorporates archaeological onset dates and a gene–culture constraint. Itan explicitly states that its origin date was strongly influenced by farming-arrival timing. [PLOS paper](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000491)

   **Fix:** fit and compare unconstrained, hard-constrained, and probabilistic archaeology-informed models; propagate onset-date uncertainty; state clearly that the date comparison is not independent.

7. **The Itan figure cannot support the claimed Bhattacharyya/HPD arithmetic.**

   The script assumes hue position on a hand-coded blue–red ramp is linearly proportional to posterior density ([digitiser:33](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:33), [digitiser:110](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:110)). But Itan’s caption says only that points are regression-adjusted accepted simulations and shading was added with 2D KDE; it supplies no numerical colour scale. [PLOS Figure 3 description](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000491)

   The digitiser further:

   - hardcodes one machine’s absolute path ([line 16](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:16));
   - uses undocumented pixel/control-point constants ([line 23](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:23));
   - claims to average a 5×5 window but actually keeps the first non-NaN pixel ([lines 78–85](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:78));
   - truncates both distributions to the successfully colour-classified Itan support and renormalizes;
   - writes an NPZ, not the CSV the notebook says it writes ([digitiser:89](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/scripts/digitise_itan_fig3.py:89), [notebook:788](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:788)).

   **Fix:** obtain the accepted coordinates or numerical KDE from the authors/source code. Without that, restrict the comparison to a qualitative/georeferenced mode and explicitly quantify digitisation uncertainty—do not publish distributional overlap coefficients.

8. **The held-out-time validation leaks training observations into the test bins.**

   Training retains samples with age `>2500`, while test summaries retain bins whose midpoint is `<=2500` ([src:1737](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1737), [src:1739](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1739)). The 2500-BP bin covers 2000–2999 BP, so samples dated 2501–2999 appear in both sets. I find 24 overlapping individuals, 39 called alleles—half of the 50 individuals in those held bins.

   **Fix:** split raw observations on non-overlapping bin edges, construct training and test summaries independently, and assert zero sample-ID overlap.

9. **The “diffusion” operator is not a physically interpretable or conservative migration model.**

   Each cell relaxes toward its neighbours’ mean ([src:621](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:621)). On an irregular land graph this does not conserve total allele mass; diagonal and cardinal neighbours receive equal weights despite different distances; longitude spacing changes with latitude; cells have unequal surface area; and boundaries/isolated islands change dynamics arbitrarily. The origin model’s migration prior of 0.02–0.6 per generation is orders of magnitude wider than the base model and lacks km²/generation interpretation ([src:2094](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2094)).

   **Fix:** use a conservative area-weighted graph Laplacian or finite-volume PDE with edge lengths, cell areas, coastline connections, and diffusion parameters in physical units; demonstrate grid-resolution convergence.

10. **Selection coefficients are not comparable across the implementation and cited studies.**

   The post calls LP effectively dominant ([notebook:355](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:355)) but interprets logistic slopes as genic/codominant selection ([notebook:388](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:388)). The simulator uses a continuous logistic/Malthusian rate, not a discrete diploid fitness recursion ([src:629](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:629)). Worse, the reported origin-model “total in dairying cells” adds `SelectionBase + SelectionDairying` and omits the regional multiplier that the simulator actually applies ([notebook:833](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:833), [src:630](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:630)). Itan’s coefficient was specifically selection among dairying farmers, not this additive rate. [PLOS parameter discussion](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000491)

   **Fix:** define genotype fitnesses and dominance explicitly, compute derived quantities jointly from each posterior particle including multipliers, and compare only coefficients with matching biological definitions and time units.

## High-severity weaknesses

11. **“Positive dairying selection belongs to the data” is tautological.** `SelectionDairying` is constrained to `[0,0.06]` in every baseline scenario ([src:709](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:709)). A continuous non-negative prior produces positive medians almost automatically; it cannot establish evidence against zero. **Fix:** use a spike at zero/model comparison or permit signed effects and report Bayes factors/out-of-sample scores.

12. **The sensitivity analysis is not a sensitivity analysis of the reported fit.** It hardcodes a 4° grid while the main analysis uses 2° ([src:1780](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1780), [builder:47](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:47)), uses fewer particles/generations, has no scenario ESS table, and is contradicted by its current CSV. **Fix:** hold resolution and computational accuracy fixed, repeat seeds, and include posterior/ESS/shortfall diagnostics for every scenario.

13. **Severe weight degeneracy is propagated into tiny unweighted samples.** Final ESS is 26.6/400; the ten largest weights contain 47.9% of mass. Only 46 unique particles appear in the 100-row `abc_posterior.csv`. Downstream maps and intervals then use unweighted quantiles of those 100 draws ([src:1102](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1102)). **Fix:** retain weights for all functionals, increase effective sampling, use rejuvenation moves, and repeat independent chains/runs.

14. **Parameterization is deeply confounded.** Baseline selection, dairying selection, four regional multipliers, initial frequency/gradients, migration, source time, and injection frequency trade off against one another; no parameter-recovery exercise is provided. **Fix:** simplify and hierarchically parameterize the model, publish joint correlations, and require SBC/recovery before interpreting marginals.

15. **Observations older than the simulator are silently clamped.** The simulator begins at 10,000 BP, but binned data include 10,500, 14,500, and 24,500 BP ([regional CSV:27](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/regional_time_binned_frequencies.csv:27), [regional CSV:30](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/regional_time_binned_frequencies.csv:30)). `FrequenciesAt` simply takes the nearest model time ([src:677](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:677)), while the gradient index separately excludes ages above 12,000. **Fix:** extend the simulation past the oldest observation or exclude pre-start samples consistently.

16. **The analysis population is overstated and inconsistently narrated.** The processed CSV has 1,785 called rows, but 681 are “Outside Europe”; 1,054 contribute to regional summaries and another 50 only to gradients. The “eight earliest carriers” table includes Afghanistan and Ukraine, both excluded from inference ([Afghanistan row](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/glad_rs4988235_called_samples.csv:503), [Ukraine row](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/glad_rs4988235_called_samples.csv:1124)), while the prose silently omits Afghanistan ([notebook:678](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:678)). **Fix:** filter the modelling population first and report raw, usable, European, regional-summary, and spatial-summary sample counts separately.

17. **Genotype and dating uncertainty are discarded.** The parser retains only the most-likely call and mean date ([src:293](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:293)); 480 calls are depth-one pseudo-haploid observations, yet all called alleles enter the same binomial counting model. No genotype likelihoods, damage/error model, relatedness, ancestry, or calibrated-age distributions are used. **Fix:** ingest genotype likelihoods and date posteriors, model ploidy explicitly, and adjust for ancestry/kinship or acknowledge that selection and migration are confounded with population replacement.

18. **Posterior-predictive “coverage” is not calibration.** All 37 stored in-sample bins are covered, many because tiny allele counts produce intervals such as `[0,1]` ([PPC CSV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/posterior_predictive_regional.csv:2)). All four regional CV coverages and the time-slice coverage are also 1.0 ([regional CV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/cross_validation_by_region.csv:2)). **Fix:** report log score/CRPS, calibration by nominal level, spatially blocked holdouts, rolling-origin validation, and uncertainty across repeated SMC fits.

19. **The “prior-free” origin surface is neither prior-free nor evidence for exclusion.** It fixes every nuisance parameter at posterior medians learned under the priors/constraint, evaluates a single conditional slice, and rescales the best and worst distances to `[0,1]` ([src:2253](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2253), [src:2284](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2284)). No threshold supports “Iberia and the Balkans are ruled out.” **Fix:** profile or marginalize nuisance parameters per source cell and calibrate Δ-distance by simulation; otherwise label it only as a conditional visualization.

20. **The regional layer is not a reproduction of Evershed et al.’s model.** It uses an undocumented country/rectangle classifier ([src:248](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:248)) and four independent bounded logistic regressions, without ancestry, demographic, or ecological terms. The repository later admits it is qualitative ([run summary](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/docs/run-summary.md:35)). **Fix:** reproduce the published R analysis/figure numerically before calling this a reproduction; otherwise call it a new descriptive stratification.

21. **The dairying field is essentially invented.** Six fixed anchors are inverse-distance interpolated with no archaeological source or uncertainty ([src:269](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:269)). Uniform ±400-year shifts do not test alternate spatial patterns or smoothing scales. **Fix:** use published site-level onset evidence and propagate its posterior uncertainty.

22. **The core model omits exactly the processes needed for an origin claim.** There is no drift, population density, ancestry replacement, demic expansion, long-distance movement, standing variation, or mutation; the point-source model starts at exact zero everywhere. These are not cosmetic omissions for Holocene Europe. **Fix:** either implement a stochastic demographic model or recast the output explicitly as a deterministic visualization, not historical localization.

## Code, reproducibility, and test weaknesses

23. **Cached posteriors can silently belong to a different dataset, grid, prior, or code version.** Both loaders check only whether particle and diagnostics files exist and then ignore requested options ([src:1963](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1963), [src:2113](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:2113)). Loaded results are marked `GenerationShortfall -> False` without evidence. **Fix:** cache by hashes of samples, grid, code commit, prior, seed, and full options; reject mismatches.

24. **The land mask is network/data-version dependent and fails silently.** If `GeoElevationData` fails, every candidate cell is treated as land ([src:550](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:550)); display masks have a similar all-land fallback. **Fix:** commit a versioned land mask/grid and fail loudly if it cannot be loaded.

25. **The 24 tests are almost entirely smoke tests.** The simulator test checks only array dimensions ([tests:112](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/tests/core.wlt:112)); the SMC test permits a first-generation-only result and never tests tolerance correctness ([tests:227](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/tests/core.wlt:227)). There are no origin, constraint, conservation, time-split, cache-invalidation, digitisation, headline-number, or simulation-recovery tests.

   I attempted the suite through the bundled kernel. It produced no output for over four minutes and was terminated; the likely exposure is repeated live `GeoElevationData` calls. This is not evidence that tests fail, but they are not currently a fast, isolated verification gate.

   **Fix:** use committed grid fixtures, deterministic unit tests for dynamics and SMC invariants, end-to-end CSV regressions, and simulation-based scientific tests.

26. **Parsing downloaded data through `ToExpression` is unsafe and permissive.** Arbitrary cell text is evaluated as Wolfram code ([src:92](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:92)); coordinates are repeatedly divided by ten until plausible rather than flagged ([src:104](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:104)). Genotypes are counted by characters without a strict whitelist ([src:232](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:232)). **Fix:** use strict numeric parsing, explicit permitted genotype encodings, range validation, and a correction log.

27. **SMC density arithmetic is numerically fragile.** Products of 10–11 univariate Gaussian densities and logistic prior densities are formed on the ordinary scale ([src:1445](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1445), [src:1475](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1475)); a `10^-300` floor conceals underflow. The diagonal kernel ignores strong posterior correlations. **Fix:** compute in log space with log-sum-exp and use a regularized multivariate covariance or MCMC move kernel.

28. **Processed-output provenance is insufficient.** The manifest records a parser name but no code commit, package hash, command line, seed, grid hash, prior, or per-output checksum ([provenance](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/provenance.json:1)). `origin_mode_stability.csv` has no producer found in the repository; the digitisation CSV is not written by the named script. **Fix:** emit a machine-readable run manifest covering every derived file.

29. **Modern-frequency “validation” is hardcoded and unauditable.** Four 1000 Genomes values are embedded directly in notebook code with no versioned input table or retrieval provenance ([notebook:848](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:848)). **Fix:** store the authoritative source extract, allele orientation, population/sample counts, version, and checksum.

30. **The visual uncertainty is incomplete.** The bands reflect only parameter variation from a low-ESS deterministic model; they omit genotype, dating, drift, demographic, model-form, grid, and kriging uncertainty. Calling them “calibrated” is unjustified. **Fix:** relabel them as conditional parameter intervals until full uncertainty is propagated.

## Verified prose/data inconsistencies

| Claim | Current evidence | Required correction |
|---|---|---|
| “39 bins” ([notebook:491](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:491)) | Current PPC has 37 rows. | Say 37. |
| PPC coverage 0.97 ([README:43](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:43)) | All 37 `Covered95` values are true: coverage 1.00. | Regenerate prose and discuss overcoverage. |
| “10,000 simulations” ([notebook:513](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:513)) | Run summary records 8,400 ([line 33](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/docs/run-summary.md:33)); origin diagnostics imply 31,200. | Report actual totals separately. |
| Dairy medians 0.008–0.019 ([notebook:644](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:644)) | CSV range is 0.00206–0.01400 ([sensitivity CSV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/sensitivity_posterior_quantiles.csv:2)). | Replace and withdraw “belongs to data.” |
| Migration 0.010 → 0.020 under wide prior ([notebook:648](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:648)) | Current medians are 0.00716 → 0.00539. | Correct; the direction is reversed. |
| “Comfortably bracketing” Burger’s 0.06 ([notebook:388](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:388)) | Regional estimates span 0.0242–0.0410 ([fits CSV](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/data/processed/regional_logistic_fits.csv:2)). | “Does not bracket 0.06.” |
| README says 4° inference grid ([README:53](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:53)) | Main builder/package use 2°; sensitivity uses 4°. | State both accurately. |
| Itan BC 0.62; masses 0.10/0.36 ([README:31](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:31)) | Direct weighted recomputation gives 0.607, 0.096, 0.341. Notebook values depend on Monte Carlo resampling. | Use exact particle weights—subject to the larger digitisation invalidity. |
| “Their text reports 48.5N, 13E” | The official article text describes only a central-Balkans/central-Europe region and KDE; no coordinate was found. | Attribute 13E to the project’s reading/digitisation unless a primary textual source is supplied. |
| Hero says “8000 BC to today” ([notebook:231](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:231)) | `FormatYearLabel` maps 8000 BP to 6050 BC and 0 BP to AD 1950 ([src:1854](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/src/LactasePersistenceSpatial.wl:1854)). | Say 8000 BP to 1950, or alter the time convention. |
| “All numbers computed at build time, so text cannot drift” ([builder:15](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/community/build_notebook.wls:15)) | Numerous headline values above are hardcoded and stale. | Generate every numeric sentence from current tables and fail the build on mismatches. |
| README first implies location agreement ([README:19](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:19)), then says location does not agree ([README:31](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:31)). | Marginal medians are being compared despite a broad multimodal posterior. | Remove the first agreement claim. |
| Project target alternates between Evershed/GLAD and Allentoft ([README:69](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:69), [README:116](/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram/README.md:116)). | Executable source is GLAD/Evershed. | Delete the stale Allentoft specification. |

The defensible Community post today is: a polished Wolfram implementation of a deterministic, coarse-grid exploratory model whose regional data cleaning and logistic summaries are reproducible. It is not yet a statistically calibrated ancient-DNA localization of lactase-persistence origin, and the Itan distributional comparison should be removed pending numerical source data.

No repository files were modified; the worktree remains clean at commit `69bbe7c`.


