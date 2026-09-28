# What must be true, validated, ruled out

Use this as the Discoverer/Runner checklist. Status of every row today: **untested** unless a note in `docs/step0/notes/` says otherwise.

## 0. True for the whole campaign

| Must be true | Validate | Rule out |
|---|---|---|
| There is a recurring costly job (defensible decision, not “nice report”) | T0 clock + one decision that mattered | Enthusiasm-only demand |
| Baseline is the current human+Grok+git loop | T0 note Joshua accepts | Invented “customer” |
| Hard constraints ≠ Rust/asupersync preference | Written in FRAME | “Incumbent fails because it is not our runtime” |
| Verified ≠ two URLs | Integrity cases (mirror, misquote) | Jaccard or model vote as truth |
| Restricted bytes never ride a public kit | Export fixture with marked synthetic restricted text | S7 “text set” loophole |
| Holdout oracles never in cloud prompts | oracles/ gitignored | Training on T4–T6 then calling them holdout |
| Budget cap is real (tokens + human minutes) | freeze.approved | $0 placeholder freeze |

Kill the *separate wr product* if an existing workflow meets the job after these checks. That kill is a successful Step Zero.

---

## 1. By category (do not leaderboard across categories)

### A. Baseline / extend-what-you-have

**current-workflow**  
Must be true: T0 exists (minutes, models, retractions, decisive evidence).  
Validate: one real decision logged.  
Rule out: “we have no baseline so wr wins by default.”

**franken-research**  
Must be true: evidence files + freshness/watch actually change a *decision*, not just a folder.  
Validate: inspect `watch/watch.mjs` / METHOD.md; run existing freshness path on one stale claim if it runs without a new platform.  
Rule out: “extend FR” if the only gap is a missing CLI verb.

### B. End-to-end research workflows (only these compete on T1–T3)

**paperqa** — scientific papers.  
Must be true: answers cite spans in *pinned PDFs*, not a hallucinated DOI.  
Validate: 3 frozen papers, known span, ask a question whose answer is a table cell.  
Rule out as *web* desk if it cannot leave the paper corpus. Rule out as wr replacement if it has no license/export story.

**gpt-researcher** — web report agent.  
Must be true: sources fetched are recoverable; cost per acceptable decision recorded.  
Validate: same T1 brief as baseline; count material errors + correction minutes.  
Rule out: more links ≠ better decision. Rule out if it cannot abstain on grey-lit.

**fs-researcher** — filesystem skill.  
Must be true: state survives a new session via files alone.  
Validate: run, kill VM, resume from files, claim IDs still resolve.  
Rule out: if resume requires the original chat. That is the mechanism probe, not a full wr.

**storm** — question/outline formation.  
Must be true: better *questions* than Joshua’s protocol.yaml, not better citations.  
Validate: compare generated questions vs W40/W41 briefs.  
Rule out as harvest engine.

**tongyi-deepresearch** — research model/system.  
Must be true: runnable under our access/license; output has checkable citations.  
Validate: one pinned release + one task.  
Rule out if weights/API are unavailable → `blocked`, not fail.

**deepagents** — harness.  
Must be true: durable execution + handoff cheaper than OMP/NTM you already have.  
Validate: setup minutes + resume after kill.  
Rule out as researcher; it is a host. Combine-only.

**open-deep-research**  
Must be true: *not archived* or a fork is maintained.  
Validate: GitHub archived flag + last commit date on the inspected SHA.  
Rule out as foundation if archived (architecture reference only).

### C. Components (own fixtures, not T1 report scores)

**docling** — extract.  
Must be true: span coordinates on a frozen PDF/HTML beat Trafilatura+focr on *that fixture*.  
Validate: page/table fixture; hash excerpt.  
Rule out as a desk.

**aiida** — provenance.  
Must be true: input→process→output graph we can query after a failed step.  
Validate: one tiny calc + provenance walk.  
Rule out if install/HPC cost > wrapping sqlite receipts.

**graphiti** — temporal graph.  
Must be true: T4 (source retracts) flags only dependent claims.  
Validate: add fact, retract, query.  
Rule out if a dated `claims` row + searched_at already does it.

**dspy / gepa** — optimizers.  
Must be true: a **development** metric exists that is not the holdout.  
Validate: improve T1–T3 only; holdout untouched.  
Rule out until that metric exists. Do not run now.

**graphrag**  
Must be true: maintained enough to install; answers beat linear retrieval on *our* corpus.  
Validate: maintenance posture + one index on a tiny corpus.  
Rule out as default if docs say maintenance-mode and we have no graph failure.

### D. Evaluators (grade others; they are not incumbents)

**aviary, deepresearch-bench, deepresearch-bench-ii**  
Must be true: rubric matches *our* job (decision quality), not “report eloquence.”  
Validate: read rubric + one scored example.  
Rule out as something to adopt for harvest. May *inform* oracles only if alignment is explicit.

---

## 2. Per task — what must be true

| Task | Must be true to count | Ruled out if |
|---|---|---|
| T0 | Baseline minutes and retractions written by Joshua | Agent invents T0 |
| T1 | Same brief on baseline vs one researcher vs researcher+FR; reviewer sees incumbent failure *or not* | Build rec from language preference |
| T2 | README claim vs consumer-path test | File existence = behavior |
| T3 | Cost + correction + decisive evidence under cap | Citation count as quality |
| T4 holdout | Dependent claims flagged; old evidence kept | Silent overwrite or rerun-everything |
| T5 holdout | Mirror ≠ second path; misquote refused | Grey-lit Verified |
| T6 holdout | Export/resume; provider down; no restricted leak | Status promoted when source gone |

---

## 3. Per integrity case (must refuse)

| Case | Must happen |
|---|---|
| Fabricated capability | Demote to unexecuted |
| Negation in quote | Support review fail |
| Mirrored sources | One evidence path |
| Stale claim | Not current |
| Restricted export | Metadata/pointer only |
| Unavailable provider | blocked / Unknown, not ok |
| Proposer never fetched | Cannot be a source |
| Fake offsets | L0 fail |

A system that cannot express Unknown/blocked cannot be the desk.

---

## 4. Foundational claims that would justify *build*

All must hold **after** less-building alternatives failed:

1. A named constraint the incumbent fails (not “not Rust”).
2. Combine (researcher+FR files) still fails that constraint.
3. Smallest build is *that* constraint (e.g. export rights check, or CAS pin), not twelve verbs.
4. Integration + maintenance cost < human_minutes saved on the frozen tasks.
5. Openness vector reviewed per license (source / model / data / deps / portability) separately.

If 1–2 fail → **adopt or combine**. If 3–4 fail → **defer/kill**. Only then `wr-doctor` unblocks.
