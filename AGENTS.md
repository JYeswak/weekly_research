# AGENTS.md

RULE 0: The operator is in charge.

Read wr_plan_v1.md. Do not implement wr-doctor or any src/ because a bead is `open` or `ready`.
Implementation is allowed only if docs/step0/notes/disposition.md says **build** or the operator writes a RULE 0 override in UPGRADE_LOG.md.
Defer/kill on the thesis bead must not start Cargo work.

The 12 forbidden patterns and one-rule stand:
A step you can satisfy by believing you did it is not a step.
