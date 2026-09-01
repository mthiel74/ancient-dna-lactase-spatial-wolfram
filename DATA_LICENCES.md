# Data provenance and licences

This repository redistributes only derived, single-variant extracts and
openly licensed material. Sources, terms, and what is / is not shipped:

## Allen Ancient DNA Resource (AADR) v66.p1
- Source: Harvard Dataverse, doi:10.7910/DVN/FFIDCW (Mallick et al. 2024,
  Scientific Data 11:182).
- Shipped here: a derived extract of ONE variant (rs4988235) per individual
  (`data/raw/aadr_v66_rs4988235_raw.csv` and the processed CSVs), produced by
  `scripts/extract_aadr_v66_rs4988235.py`. The full genotype files are NOT
  redistributed.
- Terms: the AADR requires citation of the AADR paper, the Dataverse version,
  and the original per-sample publications (each row's `Publication` column
  carries the source-publication abbreviation for exactly this purpose).
  The Dataverse terms do not state an explicit licence; users of this extract
  should honour the citation obligations above. If the AADR maintainers
  object to even this single-variant derived extract, it will be removed and
  replaced by the extraction script alone.

## GLAD ancient-genotype workbook (UCL)
- Source: UCL Global Lactase Persistence Association Database
  (glad_adna_15-8-22.xlsx), used by Evershed et al. 2022.
- Shipped here: NOT redistributed (no explicit licence is published).
  `RetrieveRawData` downloads it from UCL on demand, with checksum and
  provenance manifest. Derived processed CSVs retain per-row publication
  attributions.

## Itan et al. 2009, Figure 3
- Source: PLoS Computational Biology 5(8):e1000491,
  doi:10.1371/journal.pcbi.1000491, (c) 2009 Itan et al.
- Licence: Creative Commons Attribution (CC BY). Reproduced in
  `docs/images/originals/` with full attribution; the digitised numeric
  field (`data/processed/itan2009_origin_density_digitised.csv`) is a
  derived work under the same licence.

## 1000 Genomes Project phase 3 frequencies
- Source: Ensembl REST (rs4988235 population frequencies);
  The 1000 Genomes Project Consortium 2015, Nature 526:68. Open access;
  four population frequencies are quoted in the notebook with attribution.

## AI-generated illustrations
- `docs/images/figures-generated/*.png` were generated with OpenAI
  gpt-image-2 by the repository author (prompts and driver script included);
  they are illustrations, not data, and are disclosed as external assets in
  the notebook.
