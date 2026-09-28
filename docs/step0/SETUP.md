# Setup foundation

## What “budget” means here

It is **not** a credit card. `protocol.json.budget` is a freeze-time cap so `step0.py validate` can reject unbounded work.

Your cap is:

| Ledger field | What you actually spend |
|---|---|
| `usd` | 0 if compute is prepaid Cursor tokens (record plan name + remaining token estimate in the freeze note) |
| `human_minutes` | Your review time (PR reads, T0, disposition). This is the scarce one. |
| `elapsed_hours` | Sum of cloud-agent VM time across trials |

Suggested freeze (edit the numbers before `freeze`):

- usd: 0 (prepaid Cursor)
- human_minutes: 180 (3 hours of Joshua review across the whole campaign)
- elapsed_hours: 24 (cloud VM wall clock, all agents)
- approved: true **only after you say these numbers are real**

If tokens run out, status = `blocked`, not “framework is bad.”

## Two repos (lessons only on public)

| Place | Contains |
|---|---|
| **Public** `JYeswak/weekly_research` | FRAME, LAB, SETUP, sanitized `docs/step0/notes/<id>.md`, disposition sentence |
| **Private lab** (Cursor cloud + Ultra) | campaign JSON, raw logs, oracles, candidate checkouts, secrets |

Do not PR raw PaperQA dumps or API traces into the public tree.

Recommended private remote: a private GitHub repo `weekly_research-lab` **or** only local `docs/step0/campaign/` (already gitignored on public).

## Machine setup

### Ultra (admission + holdouts + bind)

```bash
# skill zip you installed
python3 /path/to/step-zero/scripts/test_step0.py
python3 /path/to/step-zero/scripts/step0.py init ~/src/weekly_research-lab --seed weekly-research
```

Keep T4–T6 oracles in that lab directory, never in the public clone.

### Cursor Cloud (runners)

1. Cursor → Cloud Agents → connect **public** `weekly_research` for prompts/docs.
2. Optionally attach **private** `weekly_research-lab` as the write repo so raw logs never hit public `main`.
3. Privacy mode off (required for cloud agents).
4. `.cursor/environment.json` already on public: Python 3 + git only.
5. Secrets: none for Discoverer. Runner secrets only when that one system needs a key; use Cursor secrets, not wr.toml in git.
6. One agent = one candidate (Discoverer) or one frozen (system, task, trial).

### Public clone agents must not

Install 18 stacks into `environment.json`. Each VM installs **one** tool if it is a Runner. Discoverers only fetch/read.

## Validate all 18 — what “all” means

| Layer | All 18? | Where |
|---|---|---|
| Discover (SHA, license, CI, limitation, reject/defer) | **Yes** | Cloud Discoverer × 18 |
| End-to-end research task T1–T3 | **No** — only comparable workflows you shortlist (likely 3: current, one web researcher, that+FR) |
| Component probes | Only if a Discoverer note says the gap is that component (extract / freshness / provenance) |
| Holdouts T4–T6 | Ultra only, after freeze |

“Validate all” = every candidate gets a **screen file**. It does not mean 18 × 6 tasks × 2 trials.

## Start order today

1. You approve the cap above (or change the three numbers).
2. Spawn 18 Discoverers with `docs/step0/prompts/discoverer.md` (or batch by cluster: workflow / extract / optimize / eval / archive).
3. Merge **sanitized** notes into public `docs/step0/notes/`.
4. You mark shortlist in the **lab** `candidates.json`.
5. T0 note from this planning week (baseline minutes).
6. Freeze on the Ultra. Then Runners.

No `wr` crate in any of those steps.
