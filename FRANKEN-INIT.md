# franken-research starter-kit vs this repo

Do **not** run `starter-kit/scripts/init.sh` against `weekly_research`.
That script writes `AGENTS.md` and kit files that would overwrite SPEC-locked surfaces.

Pin the kit you copy from: `JYeswak/franken-research` commit `112215ddda638d7610097f3f70c8c35a050b40a4` (or newer, recorded here when you bump).

## Copy (adopt ideas / optional files under vendor/franken-kit/)

| Source | Why |
|---|---|
| RULEBOOK.md (read, do not vendor wholesale) | pin, tiers, packets, honesty |
| starter-kit/templates/planning-packet.md | shape for packet.md |
| starter-kit/templates/demotion-rules.md | evidence growth ≠ permit |
| starter-kit/templates/negative-evidence-entry.md | repairs / withheld log |
| starter-kit/templates/definition-of-done.md | done_when language |
| starter-kit/templates/claims.tsv | pointer table inspiration |
| starter-kit/templates/kit-gates.yml | gate names |
| starter-kit/scripts/check-claim-discipline.sh | optional extra check |
| starter-kit/CHECKLIST.md | human week-start |

## Do not copy / do not let init.sh overwrite

| Path | Why |
|---|---|
| AGENTS.md | wr-specific; skill + sign ban |
| SPEC.md | locks |
| README.md | desk overview |
| skills/ | agent surface |
| weeks/ | notebook layout |
| wr.toml.example | workers |
| SOURCES.md | classes |
| LICENSE | this tree is MIT (same family as FR) |
| starter-kit/templates/agents.md | conflicts with AGENTS.md |
| beads / .atlas-arc | different tracker; NTM is dispatch |

## Allowed merge

Create `vendor/franken-kit/README.md` pointing at the pinned FR commit and the copy list above.
If a packet needs FR checklist items, link them. Do not make weekly_research a fork of franken-research.
