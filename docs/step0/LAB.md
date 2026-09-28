# Step Zero lab

Not a new product. A way to get **data** through the existing Step Zero campaign.
Cursor Cloud Agents (isolated VMs, clone this repo, work on a branch, PR) are **runners**, not decision owners. Joshua owns `decision.json`.

Cursor docs: cloud agents clone GitHub, use `.cursor/environment.json`, can use MCP/browser. Privacy mode must be off for cloud agents. Do not put Infisical/X tokens in the VM until a trial explicitly needs them — T0 and landscape do not.

## What this lab is allowed to do

| Allowed | Forbidden |
|---|---|
| Screen 18 candidates from primary sources (README, LICENSE, CI, last commit) | Install all 18 |
| Pin a revision (40-char SHA) into campaign notes | Call untested status "shortlist" without an evidence file |
| Run **one** shortlisted workflow after freeze + approved budget | Freeze without Joshua's budget numbers |
| Bind a real log file with `step0.py bind` | Synthesize receipts from the PR description |
| Integrity probe on **synthetic** fixtures | Put holdout oracles in the public tree |
| Open PRs that only add `docs/step0/campaign/` evidence | Open `Cargo.toml` / implement `wr` |

## Roles

| Role | Who | Workspace |
|---|---|---|
| Owner | Joshua | Ultra + this repo |
| Discoverer | Cursor cloud agent | public repo; no `oracles/` |
| Runner | Cursor cloud agent **after freeze** | shortlist only; budget cap in prompt |
| Challenger | Different model/agent | raw outputs + integrity-cases; no Frame narrative |
| Admission | `python3 skills/step-zero/scripts/step0.py validate` | local or CI |

Holdout answers live only on the Ultra under `docs/step0/oracles/` (**gitignored**). A hash in protocol.json is not access control; do not paste T4–T6 oracles into a cloud prompt.

## Sequence (data, then decision)

1. **T0 baseline (Joshua, current workflow)** — clock + corrections. No cloud agent required.
2. **Discoverer PRs** — one candidate or one cluster per PR: URL, SHA, license files read, CI badge observed, limitation, proposed screen status. Untested stays untested until that file exists.
3. Joshua **screens** (shortlist/reject/defer) and writes `minimum_advantage` + budget.
4. `step0.py freeze` locally. New campaign dir if protocol changes.
5. **Runner PRs** — only shortlisted systems × development tasks T1–T3. Two trials. Attach stdout path. Owner `bind`s.
6. **Challenger** — integrity-cases.json + mutation; separate reviewer field.
7. Holdouts T4–T6 on the Ultra only.
8. `validate --stage runs` then owner fills `decision.json`. `validate --stage decision`.

Stop when another trial will not change adopt/combine/build/defer/kill enough to pay for it.

## Budget (must be real)

Fill before freeze:

```
usd:
human_minutes:
elapsed_hours:
```

Cloud agent time counts as usd + elapsed. Do not infer permission from $0 placeholders.

## Mapping Cursor → Step Zero

- Each cloud agent = one bead-shaped job (`wr-step0-landscape-paperqa`, …).
- Branch name `step0/<candidate-id>`.
- PR body must list commands run and exit codes. That is still **not** a bind. Joshua or a local script copies the log into the campaign and runs `bind`.
- If the agent wants to add a crate: reject the PR.

## Environments

`.cursor/environment.json` installs Python 3 + git only. Candidate tools are installed **per runner prompt** for the one shortlisted system, then discarded with the VM.
