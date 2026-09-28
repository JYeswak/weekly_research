# AGENTS.md

RULE 0: The operator is in charge. If they contradict this file, obey them and record the override in UPGRADE_LOG.md.

Read `wr_plan_v1.md` before any write. SPEC.md is a pointer.

## The one rule

A step you can satisfy by believing you did it is not a step.

## The 12 forbidden reward-hacking patterns

Quoted from the suite-wide agent law:

1. gate self-weakening
2. proof-class inflation
3. golden regeneration reflex
4. commit-stream pumping
5. tautological tests
6. easy-lever cherry-picking
7. close-pump abuse
8. scope-splitting
9. spec-editing as progress
10. conformance metastasis
11. dependency smuggling
12. bench-path hardcoding

Never weaken a gate to land a change. No self-grading without independent verification. Demotions are always allowed.

## This repo

- No `wr` crate yet. Do not add Cargo.toml unless the operator picks Build-doctor after PRODUCT_THESIS.md has a disposition or they override (RULE 0).
- Do not commit snaps/.
- Do not call wr sign.
- Do not fetch during synthesize.
- Do not promote Verified by model vote or Jaccard alone.
- Canonical verbs: install doctor init harvest pin claim check export synthesize sign show service.
- Close beads only with close_reason citing a receipt.
- JSONL in .beads/ is a seed. br field types may differ; wr-beads-roundtrip is unproved.
