# weekly_research specification

Frozen from the planning session (2026-09-27/28). Amendments need a date and reason.

## Product

- Repo: `JYeswak/weekly_research` (public)
- CLI: `wr`
- Audience: AI-friendly ops / engineers; build-in-public lab notebook
- `localbench` proves models and harnesses. It is not this repo.
- Franken starter-kit discipline applies on implementation (pin, tiers, packets).

## Locks

| ID | Decision |
|---|---|
| Q4 | Hunt proposers: local default + NVIDIA free models as secondary URL lists only |
| Q11 | Isolated proposers. `Verified` needs a second evidence path (HTML vs focr/LDR), not a second model on one excerpt |
| Q12 | Export kit default. Optional `--worker opus` writes the same review/synth files a paste would. You sign |
| Q13 | Twelve verbs: doctor pin harvest claim plan check show test export review synthesize sign |
| Q14 | Cron W2 writes ledger + kit + empty synth/ + dispatch/ + SIGN.md stub. No Opus until reviews/ has a file |
| Q15 | Jev on snap text before excerpt enters a prompt or public kit. Missing Jev = WARN + ungraded, not halt |
| Q16 | Standard `.sqlite3` file is the contract. FrankenSQLite is an optional engine after a packet says Adopt |
| Q18 | Typed repair: ≤2 transient retries; empty HTML → one focr or one LDR; G1 Withheld never retried; log repairs[] |
| Q19 | Public repo created first; spec lives in-tree |
| Q20 | `pin` = inbox/local file only. Git SHAs belong on harvest rows |
| Q21 | Every source row has license class: `open | fair-use-quote | unknown | restricted`. `restricted` never appears as a public excerpt |

## Protocol (brief C fields)

Required before `wr harvest`:

question, inclusion, exclusions, since, until, source_classes, max_sources, grey_lit, conflict

`searched_at` is on the run, not the protocol window.

Grey-lit (X, Reddit, vendor blogs) = Inference / leads. Conflict policy is report or halt, never average.

## Planes

- Ledger: git + sqlite file + local snaps
- Mailbox: Drive or `mailbox/` copy of the review kit
- Watch: small crons (doctor, ledger, empty-reviews, synth-after-review) + file alarms

## Grades

- G0 `wr check` — no model
- G1 Jev on snap — withhold injection-like pages
- G2 Jev Score/Choice on (claim, span) — abstain if ambiguous
- G3 localbench goldens on `wr`

## Workers (PATH subprocess, not pip)

Allowed extras in Python: `httpx`, `trafilatura`.

PATH: `focr`, `jev`, `localbench`, `fmd`, optional `fsqlite`, optional SearXNG/LDR.

NIM / Opus / Grok / Kimi / GLM: proposers or referees. They do not write `sources` or sign.

## Open (not frozen)

Week-1 source_classes beyond web/arxiv/github/inbox? Domain allow/deny? fmd/mermaid week 1? doctor checklist? robot JSON? episode 1 brief? cron weekday? Drive connector vs copy?
