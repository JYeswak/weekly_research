# Product thesis protocol

Status: **not run**. This is the incumbent test METHOD.md would demand before a clean-room CLI.

## Question

Does a separate `wr` crate beat (a) the operator's current human+agent loop, (b) a downloaded researcher (e.g. GPT Researcher / PaperQA2 / an FS-Researcher skill), (c) that tool plus franken-research evidence files?

## Disposition table (fill after runs)

| Observation | Decision |
|---|---|
| Existing tools meet the need | Kill separate product |
| Tools research well but lose provenance/freshness | Build only the verification layer |
| Extra discipline costs more than it saves | Simplify or kill the layer |
| A named failure survives the strongest alternative | Narrow implementation addressing that failure only |

## Method (predeclare before seeing outputs)

1. Pick six real decisions from Joshua's work (adopt a dep, kill an idea, contradicting claims, stale rec, better approach off the shortlist). Wrong answer must have a cost.
2. Run each decision three ways. Same brief. Hide system identity from the reviewer where practical.
3. Score before seeing outputs: decisive evidence found; unsupported material claims; missed alternatives; uncertainty calibration; human correction minutes; elapsed time; $ / tokens.
4. A pretty report with the wrong adoption call **fails**.
5. Hold two tasks out of the tuning set.

## What this is not

Not a wr crate. Not another architecture memo. Raw outputs + scores + one disposition sentence.

## Stop

When another research round is unlikely to change adopt / wrap / build.
