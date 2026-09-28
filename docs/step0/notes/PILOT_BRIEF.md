# Pilot brief (calibration, two fixtures only)

**Question (narrowed):** On *these two fixtures*, is Trafilatura-as-PATH enough for HTML, and what named tool extracts the PDF table — or does the write-up lack evidence and need an extractor bake-off?

Not a 20-page mix. Conclusions do not generalize beyond these URLs.

## Fixtures

| id | Kind | URL | Oracle cell | Qualifier |
|---|---|---|---|---|
| H1 | permitted HTML | https://www.w3.org/WAI/wcag-curric/table.htm | San Jose 25 Aug 97 Meals **37.74** (caption: actual cost, **US$**) | Checkpoint 5.2 accessible TABLE mark-up |
| P1 | digital PDF (not scan) | https://arxiv.org/pdf/1706.03762.pdf v7 | Table 2 Transformer (big) EN-DE **28.4** BLEU | “more than 2.0 BLEU” over previous SOTA including ensembles; 3.5 days / 8 P100 |

## Baseline extractors (named)

- HTML: Trafilatura if present, else stdlib HTML strip (this sandbox: **no Trafilatura**).
- PDF: **pdftotext (Poppler)** — not Trafilatura. Docling not installed.

## Arms

A: current workflow + extract probe on H1/P1.  
B: gpt-researcher @ 0957c30 — **blocked here** (no Tavily/LLM keys in this environment).  
C: FR review of A (and B if it exists). May open cited URLs. Must not start a second hunt; missing alternatives = unresolved.

Owner adjudicates C corrections vs the oracle cells.

Success of this pilot: decide whether a *larger* comparison is worth it. Not a wr crate.
