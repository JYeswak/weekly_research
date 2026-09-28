# Pilot run 2026-09-28 (calibration)

Environment: Grok sandbox. UA weekly_research/0.1. No gpt-researcher keys. No Trafilatura, no Docling. Poppler `pdftotext` present.

## Extract probe (not a report bake-off)

H1 fetched. Stdlib/regex strip recovered **37.74** and caption **US$**. Trafilatura not measured.
P1 fetched (arXiv 1706.03762v7). `pdftotext -layout` pages 7–9 recovered **Transformer (big) 28.4** EN-DE and the “more than 2.0 BLEU” sentence. Docling not measured.

## Arm A (this session)

Recommendation **as research prose**: HTML default Trafilatura remains plausible; PDF default is a PDF tool (pdftotext/Docling/focr), never Trafilatura. **Evidence for which PDF tool wins: insufficient.** Next probe: install Trafilatura + Docling, score H1 cell 37.74 and P1 cell 28.4 plus footnote/qualifier survival.

## Arm B

blocked (no API).

## Arm C on A

| Claim from A | Class | Check |
|---|---|---|
| Trafilatura is enough on H1 | Inference | H1 numbers recovered without it; Trafilatura untested |
| pdftotext recovered 28.4 | Observed (this run) | Opened P1; table + qualifier present |
| Docling is better | Unknown | No run |
| wr should add Docling to doctor FAIL | Inference | Not supported |

Decision-changing corrections C would offer the owner: do **not** treat A as extractor ranking; credit “lack of evidence → named bake-off.”  
Incorrect-correction risk: demoting the pdftotext observation — that run happened.  
Omissions: B missing; Trafilatura missing; no table-structure test (headers vs bag of numbers).

## Disposition of this pilot

**Defer wr. Defer Docling as required organ.** Worth a larger comparison only after the two-tool extract probe on H1/P1.

Do not publish P1 PDF bytes. Snippets above only.
