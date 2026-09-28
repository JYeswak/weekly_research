# Discoverer note

Assigned: graphrag  
URL: https://github.com/microsoft/graphrag  
Cap: 20 min  
Pinned revision: release v3.2.0 ~2026-09-23 (`769542f` short; get full SHA on clone). MIT. **Maintenance mode**: no new features, PRs not accepted except CVE/bugfix.

| Field | Content |
|---|---|
| inspected paths | README maintenance statement, init/migrate, index cost warning |
| best-fit job | Graph index over a *local corpus* |
| smallest reusable piece | None until we have a graph-shaped failure |
| strongest evidence for | Explicit maintenance mode |
| missing capability | Expensive index; prompt-tuning required; not a harvest desk |
| deps | Python stack; LLM for extraction |
| cheapest next experiment | None unless T4 shows list-ledger freshness failing |
| recommended disposition | **defer** (maintenance + no observed graph failure) |
| revisit | Baseline freshness fails on multi-hop corpus |
