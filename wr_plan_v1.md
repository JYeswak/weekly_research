# wr_plan_v1

Living design bible. Live beads + AGENTS override dated campaign docs.
Status words: planned | active | committed (committed = proof lane + receipt).

## Invariants

1. One question per protocol week.
2. Hunt writes proposers; harvest writes sources; models do not invent offsets.
3. One Region per harvest on one week db; fan-out inside; second writer exit 5.
4. Cancel is request → drain → finalize. No half row.
5. Git holds pointers and kits, never snap bytes.
6. Sign is human. Opus writes only synth/ and dispatch/.
7. JSONL beads are the build graph. ntm.json is the research graph.
8. asupersync =0.5.0 in core. No tokio-compat. No Chrome UA default.
9. Only a terminal receipt proves execution.

## Verb status

| Verb | Status |
|---|---|
| doctor / init / install | planned |
| harvest / pin / claim / check | planned |
| export / synthesize / sign / show | planned |
| service install | planned (default off) |

## Pins

See PINS.md. asupersync 0.5.0, fmd v0.4.5, frankenmermaid v0.2.0.

## Shape

One crate `wr`, bin `wr`, modules under src/. Split crates only with a bead + compile receipt.

## Proof

Robot envelope: artifacts/robot_envelope_v1.json.
First committed verb is doctor when `wr doctor --robot` matches that envelope and missing fmd exits 1.
