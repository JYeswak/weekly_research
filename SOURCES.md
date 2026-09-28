# Source classes

Plan and week-1 protocol list every class. X and Reddit harvest through **existing local/Cloudflare MCPs**, not a scraper inside `wr`.

License on every row: `open | fair-use-quote | unknown | restricted` (Q21-B).
Restricted never becomes a public excerpt.

## Shared pipeline

```
hunt → candidate id → worker fetch/pin → snap (local) → G1 jev → excerpt → source row
```

Isolated proposers. NIM suggests URLs only. Typed repair Q18-B. G1 Withheld is never retried.

## web / arxiv / github / inbox / youtube / openalex / labs

Unchanged from prior revision: HTTPS+Trafilatura; arXiv API+PDF/focr; GitHub at a commit SHA; inbox via `wr pin`; YouTube captions via yt-dlp/whisper; OpenAlex metadata + OA PDF; labs as web+arxiv+github.

## x

**Hunt:** `wr harvest --class x` calls the configured X MCP (local or Cloudflare). Pulse bot remains a valid inbox path.
**Pin:** worker JSON/markdown → local snap. Store post id, created_at, author handle, permalink.
**License:** `restricted` or `unknown`. Public kit: post id + ≤ one short quote or no quote.
**Verified:** never from a post alone. If the post names arXiv/github/web, harvest that primary.
**G1:** always. Posts are high-injection.
**Doctor:** WARN if MCP URL/command missing; class returns Unknown, harvest continues for other classes.
**Repair:** ≤2 transient on the MCP. Do not fall back to anonymous scraping.

## reddit

**Hunt:** `wr harvest --class reddit` → configured Reddit MCP (local or Cloudflare). Pulse → inbox still valid.
**Pin:** post/comment id, subreddit, permalink, worker payload hashed.
**License:** `restricted` / `unknown`. Public excerpts tiny or omitted.
**Verified:** never from a thread alone.
**G1:** always (forum text).
**Doctor / repair:** same fail-open + no scrape fallback as X.

## Week-1 doors

| Class | Harvest door | Worker |
|---|---|---|
| web | yes | httpx + trafilatura |
| arxiv | yes | arXiv API + PDF |
| github | yes | commit blob |
| inbox | pin only | filesystem |
| youtube | yes if yt-dlp else Unknown | yt-dlp / whisper.cpp |
| openalex | yes | OpenAlex HTTP |
| x | yes if MCP configured else Unknown | existing CF/local MCP |
| reddit | yes if MCP configured else Unknown | existing CF/local MCP |
