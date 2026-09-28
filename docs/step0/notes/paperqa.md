# Discoverer note

Assigned: paperqa  
URL: https://github.com/Future-House/paper-qa  
Cap: 20 min  
Pinned revision: **unset** this pass — pin a release tag before trial (`pip install paper-qa>=5`).

| Field | Content |
|---|---|
| inspected paths | README: citations `Qian2011Neural pages 1-2`, RCS, retraction/metadata providers |
| best-fit job | QA over *user-provided* scientific PDFs with passage citations |
| smallest reusable piece | `Docs` index + ask() |
| strongest evidence for | Apache-2.0; designed span citations; retraction checks claimed via metadata providers |
| missing capability | Not a web desk. No papers in → no answers. Defaults OpenAI embeddings/LLM. |
| deps | Python 3.11+, LiteLLM models, optional Crossref/S2 keys |
| cheapest next experiment | Three frozen PDFs + one table-cell question; check span hits |
| recommended disposition | **defer as E2E wr**; **shortlist as component** if W41 is paper-heavy |
| revisit | If a weekly question is primarily arXiv/PDF |
