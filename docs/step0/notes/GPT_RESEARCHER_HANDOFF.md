# Executable GPT Researcher handoff

Pin: `0957c301ed06c2a5857b834358c7227c739041d4`. This replaces the operational sketch in PILOT_EVIDENCE; it does not erase that historical report.

## What was actually verified

- Installed the pinned package plus `ddgs` in an isolated Python 3.12 environment. Resolved 194 packages; this is a substantial dependency surface compared with FR's shell starter kit. Exact installed versions are retained privately.
- Imported the real package and constructed GPTResearcher with the explicit configuration in `scripts/step0/run_gptr.py`. All three model roles resolved to Ollama; Duckduckgo was the selected retriever. No research/model call was made. Import reported a missing optional MCP adapter; MCP is disabled for this experiment.
- Seven local wrapper tests passed (roles, context mode, User-Agent, revision/dirty-source/dependency/placeholder rejection).
- Preflight found **no local Ollama server** in this environment. No model was downloaded. No B report exists from this handoff yet.

The original FAST_LLM-only handoff left SMART_LLM and STRATEGIC_LLM at OpenAI defaults. Plain shell assignments were not exported; its Python ellipsis performed no research. The replacement sets every model role, disables optional image/MCP paths, uses a no-embedding context mode, supplies an honest User-Agent and records the effective configuration.

## Run on a machine with an existing local Ollama model

From a private lab directory, using Python 3.12+ and uv:

```bash
git clone https://github.com/assafelovic/gpt-researcher.git gpt-researcher
git -C gpt-researcher checkout 0957c301ed06c2a5857b834358c7227c739041d4
uv venv .venv
uv pip install --python .venv/bin/python --editable ./gpt-researcher ddgs
```

Use the installed model name from `ollama list`; it is a required parameter rather than a invented model assumption. `WR_MODEL` is that actual name. `WR_REPO` is the absolute path to the weekly_research checkout containing this script. Supply a real plain-text `query.txt` and a new private output path.

```bash
.venv/bin/python "$WR_REPO/scripts/step0/run_gptr.py" \
  --repo ./gpt-researcher --model "$WR_MODEL"

.venv/bin/python "$WR_REPO/scripts/step0/run_gptr.py" \
  --repo ./gpt-researcher --model "$WR_MODEL" \
  --query-file query.txt --output runs/B-pilot1 \
  --timeout-seconds 600 --run
```

The first command makes a read-only local-server check. The second explicitly starts work. The model endpoint is fixed to loopback `127.0.0.1:11434`; the wrapper supplies no paid-provider configuration. Local compute still has cost. Search uses DuckDuckGo unless repeatable `--source-url` arguments restrict the supplied URLs. Broad-search and supplied-source experiments are different conditions: predeclare which one you want. URL restriction does not pin fetched bytes; use source hashes and inspect the actual sources before treating a fixture-only trial as admitted. Do not silently score a live refetch as the frozen fixture.

Dependency ranges upstream float; retain `uv pip freeze --python .venv/bin/python` for each run. An exact candidate SHA does not pin its transitive environment. The license file says Apache-2.0 while pyproject metadata says MIT; report the discrepancy, not a reconciled legal conclusion.

## Output and limits

The private output directory contains query, explicit config, preflight/model digest, stdout/stderr, report, sources, context, available cost accounting, receipt and SHA256 manifest. Existing output directories are refused. An empty context/report or absent recoverable source URLs causes failure. A timed-out/failed run is retained, never promoted.

The subprocess has a wall-clock limit and receives TERM then KILL if necessary. This does not certify cancel correctness or that an Ollama server stops an already submitted inference. The wrapper is POSIX-oriented, and timeout/remote-runtime behavior has not been validated as a product guarantee. Package import/configuration and unit tests are the executed scope; end-to-end report success remains untested.

This wrapper captures an experiment. It is not `wr`, a source-rights enforcement system, or proof that generated citations support their claims. Review the report separately.
