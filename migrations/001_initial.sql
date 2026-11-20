CREATE TABLE IF NOT EXISTS startups (
  id TEXT PRIMARY KEY, name TEXT NOT NULL UNIQUE, tagline TEXT NOT NULL, description TEXT NOT NULL,
  industry TEXT NOT NULL, city TEXT NOT NULL, country TEXT NOT NULL, stage TEXT NOT NULL DEFAULT '',
  website TEXT NOT NULL, source TEXT NOT NULL, source_label TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'published' CHECK(status IN ('draft','pending','published','rejected')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS events (
  id TEXT PRIMARY KEY, name TEXT NOT NULL, organizer TEXT NOT NULL, start_at TEXT NOT NULL, end_at TEXT NOT NULL,
  registration_deadline TEXT, city TEXT NOT NULL, address TEXT NOT NULL DEFAULT '', format TEXT NOT NULL,
  registration_status TEXT NOT NULL, website TEXT NOT NULL, tracks_json TEXT NOT NULL DEFAULT '[]',
  description TEXT NOT NULL DEFAULT '', status TEXT NOT NULL DEFAULT 'published' CHECK(status IN ('draft','published')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS submissions (
  id TEXT PRIMARY KEY, name TEXT NOT NULL, country TEXT NOT NULL, description TEXT NOT NULL,
  industry TEXT NOT NULL, city TEXT NOT NULL DEFAULT '', website TEXT NOT NULL, email TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending','approved','rejected')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, reviewed_at TEXT, reviewed_by TEXT
);
CREATE TABLE IF NOT EXISTS admins (
  id TEXT PRIMARY KEY, email TEXT NOT NULL UNIQUE, password_hash TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'admin' CHECK(role IN ('admin','editor')), created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS audit_log (
  id TEXT PRIMARY KEY, admin_id TEXT NOT NULL, action TEXT NOT NULL, entity_type TEXT NOT NULL,
  entity_id TEXT NOT NULL, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(admin_id) REFERENCES admins(id)
);
CREATE INDEX IF NOT EXISTS idx_startups_status ON startups(status);
CREATE INDEX IF NOT EXISTS idx_startups_country ON startups(country);
CREATE INDEX IF NOT EXISTS idx_submissions_status ON submissions(status);
CREATE INDEX IF NOT EXISTS idx_events_start ON events(start_at);
