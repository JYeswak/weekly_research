-- weekly_research ledger. Engine may change; file is sqlite3.
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS sources (
  id TEXT PRIMARY KEY,
  class TEXT NOT NULL,
  url TEXT,
  sha TEXT,
  license TEXT,
  host TEXT,
  snap_path TEXT,
  excerpt_hash TEXT,
  status TEXT NOT NULL DEFAULT 'ok',
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS proposers (
  id TEXT PRIMARY KEY,
  url TEXT NOT NULL,
  worker TEXT NOT NULL,
  reason TEXT,
  title TEXT,
  run_id TEXT,
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS claims (
  id TEXT PRIMARY KEY,
  source_id TEXT NOT NULL REFERENCES sources(id),
  ptr_kind TEXT NOT NULL,
  ptr_json TEXT NOT NULL,
  excerpt_hash TEXT NOT NULL,
  tier TEXT NOT NULL,
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS runs (
  id TEXT PRIMARY KEY,
  week TEXT NOT NULL,
  searched_at TEXT NOT NULL,
  repairs_json TEXT NOT NULL DEFAULT '[]',
  counts_json TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS grades (
  id TEXT PRIMARY KEY,
  target_id TEXT NOT NULL,
  layer TEXT NOT NULL,
  label TEXT NOT NULL,
  score REAL,
  ungraded INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL
);
