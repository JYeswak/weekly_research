# Discoverer note (repaired)

Assigned: gpt-researcher  
URL: https://github.com/assafelovic/gpt-researcher  
Cap: repair pass 2026-09-28  
**Pinned revision:** `0957c301ed06c2a5857b834358c7227c739041d4` (main 2026-09-26 merge #2173)

| Field | Content |
|---|---|
| inspected paths | LICENSE (Apache-2.0 header); gpt_researcher/actions/{report_generation,retriever,web_scraping}.py names; top-level cli.py main.py |
| best-fit job | LLM web+local *report* generation |
| smallest reusable piece | report_generation.py + retriever.py |
| strongest evidence for | License file is Apache 2.0 at this SHA. Code generates intro/conclusion/sections via LLM. |
| missing capability | **Unknown, not demonstrated:** first-class Unknown/withheld/rights class. report_generation.py returns `""`/`[]` on *exception*, which is error swallow, not epistemic abstain. Rights handling: **unknown** (not searched beyond actions/). |
| deps | LLM API + search (README Tavily); Python package |
| cheapest next experiment | One pilot brief, $ cap TBD by Joshua, save source URLs from retriever |
| recommended disposition | **shortlist researcher** |
| revisit | After first run if sources are not recoverable |
