# Pilot evidence 2026-09-28

## Reconcile C-on-A (not a verification win)

Pre-review A (PILOT_RUN.md, before C table): HTML default Trafilatura plausible; PDF is a PDF tool; evidence for which PDF tool wins is **insufficient**; next probe install Trafilatura+Docling.

C claimed “do not rank untested extractors.” That sentence **already was A**. No before/after error to count. C-on-A = changed design, **not** B→C. Correction count for verification value: **0**.

Accept the methodological rule. Do not score it as FR value.

## Bound fixtures (bytes)

| id | URL | sha256 | bytes |
|---|---|---|---|
| H1 | https://www.w3.org/WAI/wcag-curric/table.htm | `3ed1d310b97385b415c6246d8e40859c91014eeefc69d933e57788211cbf77c4` | 3985 |
| P1 | https://arxiv.org/pdf/1706.03762v7.pdf | `bdfaa68d8984f0dc02beaca527b76f207d99b666d31d1da728ee0728182df697` | 2215244 |

Commands: `curl -fsSL -A weekly_research/0.1 ...` then `sha256sum`. Same hashes as earlier `/tmp/fix-*`.

## Oracle (row/col/unit — not bag-of-tokens)

H1: trip=San Jose, date=25 Aug 97, column=Meals, value=37.74, unit=US$ (caption).
P1: row=Transformer (big), column=EN-DE BLEU, value=28.4; qualifier on same results section: “more than 2.0” BLEU vs prior SOTA.

## Extract comparison (this VM)

| Tool | Version | Status | H1 structure | P1 structure |
|---|---|---|---|---|
| stdlib HTMLParser | py 3.10.21 | completed | 37.74 and US$ and Meals present; **row/col join not proved** (page is HTML-*source* of a table) | n/a |
| Trafilatura | 2.0.0 (+ lxml_html_clean) | completed | same cells present; output is still source markup, not a grid | n/a |
| pdftotext | Poppler 22.12.0 | completed | n/a | **PASS assoc**: one layout line `Transformer (big) … 28.4 … 41.8`; qualifier “more than 2.0” present as phrase |
| Docling | — | **blocked** | pip metadata error this VM | same |

Unavailable ≠ inferior.

H1 caveat: fixture encodes the table as escaped example source. Extracting 37.74 does **not** prove a general HTML-table reader.

## Arm B

Not attempted in this VM.

Pinned GPT Researcher `0957c301ed06c2a5857b834358c7227c739041d4`:
- `.env.example` marks **OPENAI_API_KEY** and **TAVILY_API_KEY** required.
- `config.py` default `RETRIEVER=tavily`.
- `retrievers/__init__.py` also exports **Duckduckgo**, **SearxSearch**, Brave, Serper, etc.
- LLM strings support `ollama:<model>` and `openrouter:<model>`.

Handoff (Ultra / Cursor, you authorize keys):
```
cd gpt-researcher  # at 0957c30
RETRIEVER=duckduckgo
FAST_LLM=ollama:<local-model>   # or openrouter:<model> + key
# If client still demands OPENAI_API_KEY, point OPENAI_BASE_URL at the same provider.
python -c 'from gpt_researcher import GPTResearcher; ...'
```
Artifact dest: private lab `runs/B-pilot1/` not public git.
Expected extra cash: $0 if Ollama+DuckDuckGo; else provider rates. Not run here.

## Predeclare if B is authorized

Task: same PILOT_BRIEF question on H1/P1 only.
Quality: name extractors with fixture hashes; no bag-of-token “found 28.4.”
Coverage: must mention HTML vs PDF tool split.
Min benefit for “FR adds value”: ≥1 owner-accepted decision-changing correction on B that A/B missed, at incremental C minutes you tolerate.
Stop: one B report + C pass. No wr.
These fixtures are **calibration**, not holdouts.

## Openness / usability (measured here)

- Setup this VM: pip trafilatura + lxml_html_clean minutes-level; Docling install **failed**.
- Handoffs: 1 (human reads notes).
- Export: hashes + commands; no kit PDF.
- Licenses: H1 W3C page; P1 arXiv paper (Google attribution line on p.1); gpt-researcher Apache-2.0; FR MIT.
- API: B depends on LLM + a retriever (Tavily default, DuckDuckGo available).
- Maintenance: not measured.

## Disposition

**combine** the FR *method* (tiers, no clean-room without named failure) with an existing researcher **when you can run it**. **kill** a separate `wr` crate on current evidence.

Use: FR RULEBOOK + packets on reports you already buy or generate.  
Retain from FR: evidence classes, watch/freshness for pins, starter-kit.  
Smallest gap: **one B run + C on that report** (DuckDuckGo + local/OpenRouter). That is the only experiment likely to change “FR verification worth it?”  
Bounded cost: one agent-hour + your review of B vs C diffs vs H1/P1 oracles.

Insufficient for build. Insufficient to claim FR verification value (C never saw a B report).
