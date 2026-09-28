# weekly_research

Public research desk. Protocol in, signed artifacts out. Snaps stay on the machine.

CLI is `wr`. Video is the lab notebook, not a client funnel.
Audience: AI-friendly ops and engineers in small and mid-size shops.

## Status

Repo exists. `wr` is not implemented yet. Locks live in [`SPEC.md`](SPEC.md).

## Verbs (week-1 contract)

`doctor` `pin` `harvest` `claim` `plan` `check` `show` `test` `export` `review` `synthesize` `sign`

| Verb | Writes | Must not |
|---|---|---|
| doctor | machine report | fetch |
| pin | inbox/local file → source row | search the web |
| harvest | sources + local snaps | claims, prose |
| claim | pointer + excerpt_hash | fetch, sign |
| plan | packet.md UNSIGNED | execute |
| check | check.json | call a model |
| show | stdout / SIGN.md view | mutate ledger |
| test | localbench receipt | harvest |
| export | review kit | synthesize |
| review | reviews/*.md | harvest, sign |
| synthesize | synth/ + dispatch/ | fetch, sign, new URLs |
| sign | permit (human only) | run from planner/synth session |

## Layout

```
weeks/YYYY-Www/     notebook issue (not the protocol window)
  protocol.yaml
  SIGN.md
  ledger/
  reviews/
  synth/
  dispatch/
  show/
inbox/              pulse leads → wr pin
snaps/              gitignored bytes
prompts/grade.md    frozen referee prompt
SPEC.md             frozen locks
```

## Non-negotiables

- Harvest writes sources only.
- Verified requires a second evidence path, not a second model on the same excerpt.
- Cron may build empty synth/dispatch shells. Opus does not fill them until reviews/ has a file.
- Drive is a mailbox. Git + local snaps are the ledger.
- Keys belong to the operator.

See [SPEC.md](SPEC.md).
