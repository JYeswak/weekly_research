# Source classes

The plan covers every class. The week-1 binary does not have to speak every door.
Grey-lit classes can feed `inbox/` forever without a first-class crawler.

License on every row: `open | fair-use-quote | unknown | restricted` (Q21-B).
Restricted never becomes a public excerpt.

## Shared pipeline (every class)

```
hunt → candidate URL/id → fetch/pin → snap (local) → G1 jev → excerpt → source row
     → optional path-2 → claim pointer → kit (no snap bytes)
```

- Isolated proposers. NIM may suggest URLs. Only harvest/pin write rows.
- Typed repair (Q18-B): ≤2 transient; empty HTML → one focr or one LDR.
- G1 Withheld is never retried.
- `searched_at` on the run. Protocol `since`/`until` on the brief.

---

## web

**Hunt:** SearXNG and/or proposer URL lists. Raw HTTPS GET.
**Pin:** status + hash + `snap_path` + Trafilatura excerpt (Readability as later path-2).
**License:** usually `fair-use-quote` or `unknown`. Do not guess `open` from a footer.
**Verified:** only with path-2 if the page also has a PDF/HTML twin; else cap at Inference.
**Phase:** week 1 core.

## arxiv

**Hunt:** arXiv API + Arxiv Sweep → inbox or harvest ids (`2502.10855`).
**Pin:** abstract HTML + PDF bytes. Path-2 = `focr` / text-layer vs HTML abstract.
**License:** arXiv license from API (`open` or `fair-use-quote`). Never strip the license field.
**Verified:** pointer into PDF/HTML snap, not the abstract if the claim is in the body.
**Phase:** week 1 core.

## github

**Hunt:** code/repo search; proposer names owner/repo.
**Pin:** a **commit SHA**, not `main`. Tree or README blob hashed.
**License:** SPDX from repo if present, else `unknown`.
**Verified:** pointer into the blob at that SHA.
**Phase:** week 1 core (`sha` on the harvest row; `wr pin` does not take commits — Q20-A).

## inbox

**Hunt:** X Pulse, Reddit Pulse, Arxiv Sweep, you.
**Pin:** `wr pin FILE` only. File is the snap.
**License:** `unknown` unless the file declares one.
**Verified:** almost never. Inbox is how grey-lit *enters* without a crawler.
**Phase:** week 1 core.

## youtube

**Hunt:** video/channel URL in brief or inbox.
**Pin:** caption file from yt-dlp `--write-auto-subs` (or whisper.cpp if captions missing). No video bytes in git.
**License:** `fair-use-quote` or `restricted` (do not publish long caption dumps).
**Verified:** talk-track claims stay Inference unless a paper/repo is also pinned.
**G1:** captions can carry injected phrases; run Jev on the caption text.
**Phase:** 1b worker. Door exists in protocol; binary can refuse with `Unknown` until yt-dlp is on PATH (`doctor` WARN).

## openalex

**Hunt:** no-key Works API; DOI / OpenAlex id; citation walk from a pinned paper.
**Pin:** metadata always; OA PDF if `is_oa` and a landing URL fetch succeeds.
**License:** from OpenAlex / Crossref; else `unknown`.
**Verified:** only after PDF/HTML snap exists. Metadata-only = Inference.
**Phase:** 1b worker. Do not require an API key week 1.

## x (Twitter)

**Hunt:** existing X Pulse bot → markdown in inbox. Official export if you have it.
**Pin:** `wr pin` the pulse file. Do not scrape X in `wr harvest` week 1 (ToS, login, injection).
**License:** `restricted` or `unknown`. Public kit gets a one-line lead + post id, not a dump.
**Verified:** never from a post alone. A post can *point* at an arXiv/github URL to harvest.
**Phase:** always via inbox until a later packet says otherwise.

## reddit

**Hunt:** Reddit Pulse → inbox. Same rule as X.
**Pin:** pulse file. No first-class old.reddit crawler in week-1 `wr`.
**License:** `restricted` / `unknown`. Excerpts tiny or omitted.
**Verified:** never from a comment thread alone.
**G1:** forums are high-injection; Jev on the pulse text.
**Phase:** inbox only until a later packet.

## labs / vendor (OpenAI, Anthropic, xAI, Tongyi, Google, NVIDIA)

**Hunt:** proposer or inbox.
**Pin:** model card / paper / commit / measured localbench receipt — not a marketing page if you can avoid it.
**License:** usually `fair-use-quote`.
**Tier:** Inference unless a paper or commit is pinned.
**Phase:** treated as `web` + optional `arxiv`/`github`.

---

## Week-1 binary vs plan

| Class | In protocol.yaml | Harvest door week 1 | Verified allowed |
|---|---|---|---|
| web | yes | yes | path-2 or cap Inference |
| arxiv | yes | yes | PDF/HTML pointer |
| github | yes | yes | commit blob |
| inbox | yes | pin only | rare |
| youtube | yes (may list) | optional worker | Inference default |
| openalex | yes (may list) | optional worker | after OA snap |
| x | no harvest door | inbox | no |
| reddit | no harvest door | inbox | no |

`wr harvest --class x` week 1 exits 2 with a pointer to this file. That is a feature.
