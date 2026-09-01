# BRUTAL-CRITIC re-review (v2 state), 2026-09-01

Score: 52/100 (prior draft 48/100).
PUBLICATION GATE: (a) Wolfram Community - SHIP WITH LISTED FIXES (prior-baseline
plot/columns + MC error bars + three sentence rewrites mandatory; retitle as an
ABC-SMC methods walkthrough, not a localisation result); (b) GitHub public -
DO NOT SHIP until LICENSE exists and AADR redistribution terms are addressed,
then SHIP WITH LISTED FIXES.

Status note: the mandatory fixes (constrained-prior baseline columns, rule-of-
three bounds, bridge/verdict/Burger sentence rewrites, subtitle reframing,
GLAD untracking, DATA_LICENCES.md, seeds) were implemented in commit 4a12f3b,
the same day. Remaining open recommendations are tracked below.

## Direct answers to the tasking

(a) C1 (prior tautology) NOT cured in the reviewed build for the selection
headline (bare point estimate); C2 (boundary pinning) half-cured: posterior
lower tail arithmetically identical to the prior tail (5,121 vs prior 2.5th
pct ~5,125), P(T<6000)=0.22 vs prior 0.20 (BF 1.13), 74.5% of prior width
retained. "Progress in honesty, not in inference."
(b) Bridge conclusion overclaimed: at ESS 36.2 a reported 0 Carpathian mass
bounds it only below 3/ESS = 8.3% (25% at ESS 11.9); constrained-prior mass in
the box was not reported (later measured: 3.4%), so zero observed is evidence
of nothing. One nuisance bound (m<=0.08) moves the KDE mode ~1,170 km - the
same order as the disclosed ~1,500 km instability.
(c) Atlantic lean stated without its prior baseline (later measured: 27%
prior vs 58% posterior west of 5E - a real ~2x update, +/-8% MC).
(d) Fit for Wolfram Community conditionally, as an honest executed methods
notebook, after the mandatory sentence demotions.
(e) Repo not fit to open until LICENSE exists; AADR terms unconfirmed.

## Critical findings

C1-recur. Selection reported as bare point estimate in the packet while the
width-ratio instrument existed; CallErrorRate retains 93.5% of prior width
(median 0.012 ~ prior midpoint 0.01 - itself near-prior), DairyingLeadYears
90.7%, origin time 74.5%.

C-new-1. Error-floor contradiction: q = p(1-2e)+e floors every prediction at
e; posterior median e=0.012 predicts ~25 derived calls pre-6000 BP where 7
exist (7/2,077 = 0.0034, 95% CI [0.0014, 0.0069]); with the GLS weights that
is a ~6.5-sigma unreducible residual in the most important bins. Either those
bins do not dominate the distance (then say so) or e's posterior should have
concentrated below 0.007 and did not (then it is a bug). ACTION: print the
per-bin weighted residual decomposition for accepted final-generation
particles; add a refit dropping pre-6000 calls with depth<3 ("trust them
less" - the mirror of trust_early_calls). OPEN.

C-new-2. "0.000 Carpathian" is not a number the design can produce; replace
with the rule-of-three bound and the prior mass. FIXED in 4a12f3b.

## Major findings

M1. Migration cap at 0.3 cosmetic: 73.1% of U(0,0.3) mass lies above the
half-saturation point m*=0.0806; sample alpha directly. OPEN.
M2. Modes quoted to 0.5 deg (~55 km) inside ~1,500 km instability. FIXED in
prose (read-as-direction warnings); whole-degree reporting/bootstrap ellipse
still recommended. PARTIALLY OPEN.
M3. slow_mixing mode lands on Mallorca, uninhabited at the modelled date
(earliest defensible Balearic presence ~5,600 cal BP, mainstream ~4,400):
falsifies the location surface and motivates an occupation-masked origin
grid. Noted in prose; occupation-mask refit OPEN.
M4. "Data prefer weak coupling" compared the posterior to the UNCONSTRAINED
prior; the constrained prior is right-skewed toward large lead. FIXED: the
constrained-prior sampler now provides the correct baseline in-table.
M5. Bridge conclusion a false dichotomy over an unexhausted assumption space
(demography, drift, dominance, modern-frequency likelihood, and the SHARED
archaeological chronology are not varied). FIXED: conclusion narrowed.
M6. Burger 0.06 assumes dominance (h=1); genic model unconverted. FIXED:
marked indicative-only.
M7. Decode validation covers homozygotes only (796/797); zero heterozygotes
validated, and the surviving early carrier is a depth-2 het at the damage
transition. Per-individual damage handling or depth>=3 refit recommended.
OPEN.
M8. Depth annotations' provenance (GLAD, not AADR packed geno) must be
documented in the CSV header since GLAD is untracked. OPEN (small).

## Minor

m1. "Timing inside published envelope" is containment by a 1.53x-wider
interval - not corroboration. FIXED (retracted as a finding).
m2. Time-slice holdout score not printed alongside the fixed split. OPEN.
m3. RNG seeds unlisted. FIXED.
m4. GLS weights on double-counted summaries mis-scale the tolerance. OPEN
(Mahalanobis on the future-work list).
m5. Final ESS 36.2/800 = 4.5% is a failed SMC by conventional standards;
quantiles from it are approximate. Disclosed; ESS>=200 runs or headline
deletion recommended. PARTIALLY OPEN (headline deleted; big runs pending).

## Source checks (verbatim verdicts)

Itan 7,441 [6,256-8,683], s 0.0518-0.159 dairyers-only, CC-BY: verified.
Irving-Pease s=0.0194, ~6,000 BP rise: verified. Burger ~0.06 "also when
assuming dominance": verified. Bersaglieri 0.014-0.15: UNVERIFIED in the
primary (paywalled; known only via Itan et al.'s citation) - cite table/page
or attribute to Itan's quotation. AADR v66 existence: verified; 23,089
individuals: unverified in print. AADR redistribution licence: unstated
(citation obligations only). Wolfram Community posts are CC BY-SA 4.0 with
poster-owns-or-has-permission requirement: verified (relevant to shipping
third-party data inside the post itself).

## The roast (abridged)

"The previous draft was wrong and loud; this one is honest and empty, which
is genuinely better - but you have started narrating the emptiness as though
it were a result. Fix the licence, plot the constrained prior, print the
residuals, and either buy more particles or admit in the first paragraph that
you did not find where lactase persistence came from - which would be the
most interesting post on Wolfram Community this month."
