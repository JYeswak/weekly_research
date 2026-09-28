# Gaps and unknowns

Living register. Close a row with a date + pointer.
Does not reopen frozen locks.

## Blocks harvest

| ID | Gap | Default if we must ship |
|---|---|---|
| G1 | X/Reddit workers | **Draft 2026-09-28 from bots — not frozen until you say A.** X is Studio `x-cli-infisical` (not CF MCP). Reddit is `grokbot-reddit-mcp` POST `/mcp`. See below. |
| G2 | NIM proposer fixture | `{question, max}` → `{urls:[]}` only |
| G3 | Local proposer command | empty = brief + inbox only |
| G4 | Pointer types | `html_range` `pdf_page_span` `caption_t0_t1` `git_path@sha:line` `inbox_offset` |
| G5 | Second-path agree | both nonempty AND neither Jev-Contradicted; else Inference |
| G6 | Jev τ | missing = ungraded; present = Withheld on explicit inject label |
| G7 | `until: now` | stored as searched_at |
| G8 | Host match | hostname suffix; IPs exact |
| G9 | GitHub auth | anonymous; 403 = blocked |
| G10 | Politeness | arXiv 1/3s; OpenAlex mailto in UA |
| G11 | User-Agent | `weekly_research/0.0 (+https://github.com/JYeswak/weekly_research)` |
| G12 | W40 budget | 5 desk + 7 mechanisms |

### G1 draft (bot-reported)

**X** — X Pulse: `user-X` MCP is enrolled but Client Forbidden. Live path is Shell `x-cli-infisical`:
`tweet search QUERY --max N` → list of `{id, text, author_id, created_at, conversation_id, entities, public_metrics}`.
Permalink: `https://x.com/{username}/status/{id}` after `user get`.
`wr` workers.x.command should wrap that CLI, not a CF URL, until a CF X worker exists (tinkabot: Unknown).

**Reddit** — Pulse + tinkabot agree:
- MCP: `user-reddit-mcp` / `grokbot-reddit-mcp`
- Tools: `get_subreddit_posts` (subreddit, sort new|top, limit 1–25), `get_post_comments` (post_id, sort, limit)
- Post fields: id, title, author, subreddit, post_url, link_url, created_utc, created_at, score, num_comments, over_18, selftext
- No field named permalink/body — map post_url → permalink, selftext → text
- Upstream: arctic-shift archive (grey-lit)

## Blocks synthesize / dispatch / show

S1–S7 unchanged (Opus invoke, synth templates, ntm.json, check synth, renders.json, SIGN counts, kit zip).

## Blocks doctor / install

D1–D7 unchanged.

## Blocks mailbox / later

M1–M8 unchanged.

## Closed

C-pins, C-spdx, C-fr-init, C-install.
