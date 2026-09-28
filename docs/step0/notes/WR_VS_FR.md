# wr versus Franken Research: measured baseline and build threshold

Assessment: 2026-09-28. Analyst: Codex. **Recommendation: extend/evaluate FR first; separate wr implementation remains deferred.** This is an analyst recommendation, not owner sign-off or proof that wr can never be useful.

Inspected pins:
- weekly_research: `2dd0d2bc7b76c4ee31edaa95d830192f8a4ea171`
- franken-research: `112215ddda638d7610097f3f70c8c35a050b40a4`
- GPT Researcher: `0957c301ed06c2a5857b834358c7227c739041d4`

The public fr.zeststream.ai site is FR's presentation surface. The stronger incumbent is its underlying method, starter kit, assessment corpus, watch code and freshness harness. Comparing a proposed CLI only with a website would underestimate the incumbent.

## What is demonstrated now

| Dimension | FR baseline | wr today | What could justify an addition |
|---|---|---|---|
| Research quality | Evidence tiers, negative findings, adoption rules and human judgment exist; decision-quality advantage unmeasured | Intended claim checks, no implemented research workflow | Fewer material decision errors/omissions at a fixed coverage bar versus FR with ordinary agents |
| Speed | Offline watch selftest completed in 0.1524s; freshness harness in 11.8467s on this Linux host. These are test durations, not research throughput | No comparable executable | Lower time to an acceptable decision, including setup, review and correction; no inference from Rust speed |
| Optimization | Class-change triggers and existing recorded-fixture tests reduce the need to treat every upstream event alike | Proposed harvest/CAS/runtime design | Less duplicate retrieval/review and correct targeted invalidation on a recurring workload |
| State of the art | A usable method can already sit on changing external agent/model tools | No measured capability frontier | An ablation demonstrates benefit from a specific mechanism, not a newer tool name or larger swarm |
| Installation | Starter kit installed into a fresh local directory in 0.0555s after clone; no extra package install for these checks | No crate/binary, installer defects remain in plan | Lower clean-environment setup burden without making optional rendering/tools mandatory |
| Transfer | Files copied to another local directory; readiness checker still ran; rerunning existing installer restored Git hook and preserved packet | Planned kit export/CAS references | A different operator/machine resumes with original claims, source identities, rights and state intact; single-host transfer is insufficient |
| Evolution | Versioned method, recorded fixtures, mutation/conformance machinery, daily-watch implementation | Intended upgrade discipline | Source/model/tool changes trigger precise rechecks with useful regression evidence; avoid recreating FR's existing watch |
| Openness | FR's own LICENSE is MIT; reusable shell/Markdown/Node surfaces | wr declares MIT; external model, renderer, extractor and source dependencies remain | Measured reduction in mandatory closed services plus portable exports; top-level license alone cannot establish this |

**No dimension currently has a demonstrated wr advantage over FR.** The observed FR tests do not establish end-to-end research correctness, live API reliability, cross-OS portability or usability for another person.

## Executed baseline

Commands ran against the FR pin above, with private stdout/stderr and SHA256 receipts retained:

- `node watch/watch.mjs --selftest`: exit 0; **18 cases, 0 failed**.
- `node watch/freshness/harness/run.mjs`: exit 0; **288 cases: 271 PASS, 17 XFAIL, 0 FAILED, 0 uncovered MUST**. XFAIL is expected failure, not pass.
- `sh starter-kit/scripts/init.sh <fresh-directory>`: exit 0. Installation duration excludes clone/download and prior host setup.
- In the fresh directory, `sh scripts/check-readiness.sh`: exit 1 as expected; empty planning packet rejected. This is structural validation, not investment justification.
- Copy the installed files to another directory without `.git`, initialize git, rerun readiness, then rerun the existing FR installer: hook absent after copy, hook restored by installer, planning packet hash unchanged. One Linux host only.

Raw receipts are in the separately retained private evidence bundle. `TAKEOVER_RECEIPTS.json` publishes only sanitized summaries and hashes. No upstream FR files were edited.

## Review diagnostic: is the explicit FR instruction adding value here?

Used the genuine, unchanged Grok `PILOT_EVIDENCE.md` from the wr pin above. No errors were planted. Two fresh agent contexts received ordinary technical-review instructions; two received the same instructions plus explicit FR evidence discipline. All received the identical frozen source pack and a six-tool-call/eight-finding ceiling. No network or paid model API was used for this diagnostic.

Both conditions found the missing SMART/STRATEGIC model configuration and the unsupported exclusivity of the proposed B→C experiment. Both also identified license metadata drift and incomplete operational prerequisites. Explicit FR reviews emphasized execution-evidence limits, but ordinary reviews also preserved that distinction. **There is no demonstrated FR-specific advantage from this diagnostic.** Findings are cross-checks, not independent reproduction.

Limits: one retrospective report, same underlying assistant family, two attempts per instruction, no blinded human adjudication, no token/active-time telemetry, no matched measured effort, no representative holdout. Both conditions could read the FR reference files, so this isolates explicit instruction at most, not access to FR knowledge. Root analyst knew prior discussion and scored nothing as independent truth. Do not turn raw finding counts into a quality leaderboard. This is not the frozen Step Zero investment trial.

## Plausible product boundary, still a hypothesis

The possible gap is a small, portable evidence workflow around existing research tools: bounded capture, source identity, claim-to-evidence links, controlled export, and incremental rechecks. FR already supplies much of the method and GitHub freshness machinery. The first candidate implementation should be an adapter or extension of FR, not a new twelve-verb application.

The comparison that could authorize work is: **FR plus current tools versus FR plus the proposed narrow addition**, on fresh tasks, including installation, handoff, source changes and recovery. A separate product needs a recurring failure that survives the smaller extension and a measured worthwhile advantage after maintenance/review cost. Do not mandate a crate, graph database, runtime or renderer to create that failure artificially.

Current action: preserve FR as the incumbent, use the repaired GPT Researcher handoff for a future local-model trial, and leave build authorization closed. No thesis bead is closed by this note.
