CREATE TABLE IF NOT EXISTS hackathon_categories (
  slug TEXT PRIMARY KEY,
  label TEXT NOT NULL UNIQUE,
  sort_order INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS hackathon_events (
  id TEXT PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  event_type TEXT NOT NULL DEFAULT 'Хакатон',
  summary TEXT NOT NULL DEFAULT '',
  description TEXT NOT NULL DEFAULT '',
  organizer TEXT NOT NULL,
  organizer_url TEXT,
  official_url TEXT,
  registration_url TEXT,
  start_at TEXT NOT NULL,
  end_at TEXT NOT NULL,
  registration_deadline TEXT,
  country TEXT NOT NULL DEFAULT 'Казахстан',
  city TEXT NOT NULL DEFAULT '',
  address TEXT NOT NULL DEFAULT '',
  format TEXT NOT NULL CHECK(format IN ('online','offline','hybrid')),
  audience_json TEXT NOT NULL DEFAULT '[]',
  tracks_json TEXT NOT NULL DEFAULT '[]',
  eligibility TEXT NOT NULL DEFAULT '',
  team_size TEXT NOT NULL DEFAULT '',
  participation_cost TEXT NOT NULL DEFAULT '',
  prize_pool TEXT NOT NULL DEFAULT '',
  program_json TEXT NOT NULL DEFAULT '[]',
  latitude REAL,
  longitude REAL,
  location_precision TEXT NOT NULL DEFAULT 'none' CHECK(location_precision IN ('none','city','venue')),
  status TEXT NOT NULL DEFAULT 'published' CHECK(status IN ('draft','published','cancelled')),
  cancellation_note TEXT NOT NULL DEFAULT '',
  source_url TEXT NOT NULL,
  source_label TEXT NOT NULL DEFAULT '',
  last_verified_at TEXT NOT NULL,
  verification_status TEXT NOT NULL DEFAULT 'needs_review' CHECK(verification_status IN ('verified','needs_review')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS hackathon_event_categories (
  event_id TEXT NOT NULL REFERENCES hackathon_events(id) ON DELETE CASCADE,
  category_slug TEXT NOT NULL REFERENCES hackathon_categories(slug) ON DELETE RESTRICT,
  PRIMARY KEY(event_id, category_slug)
);

CREATE TABLE IF NOT EXISTS hackathon_submissions (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  event_type TEXT NOT NULL DEFAULT 'Хакатон',
  description TEXT NOT NULL,
  organizer TEXT NOT NULL,
  organizer_url TEXT,
  official_url TEXT,
  registration_url TEXT,
  start_at TEXT NOT NULL,
  end_at TEXT NOT NULL,
  registration_deadline TEXT,
  country TEXT NOT NULL,
  city TEXT NOT NULL DEFAULT '',
  address TEXT NOT NULL DEFAULT '',
  format TEXT NOT NULL CHECK(format IN ('online','offline','hybrid')),
  category_slugs_json TEXT NOT NULL DEFAULT '[]',
  audience_json TEXT NOT NULL DEFAULT '[]',
  eligibility TEXT NOT NULL DEFAULT '',
  team_size TEXT NOT NULL DEFAULT '',
  participation_cost TEXT NOT NULL DEFAULT '',
  prize_pool TEXT NOT NULL DEFAULT '',
  source_url TEXT NOT NULL,
  consent INTEGER NOT NULL DEFAULT 0 CHECK(consent IN (0,1)),
  status TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending','approved','rejected')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  reviewed_at TEXT,
  reviewed_by TEXT
);

CREATE INDEX IF NOT EXISTS idx_hackathon_events_dates ON hackathon_events(start_at, end_at);
CREATE INDEX IF NOT EXISTS idx_hackathon_events_city ON hackathon_events(city);
CREATE INDEX IF NOT EXISTS idx_hackathon_events_status ON hackathon_events(status);
CREATE INDEX IF NOT EXISTS idx_hackathon_events_type ON hackathon_events(event_type);
CREATE INDEX IF NOT EXISTS idx_hackathon_submissions_status ON hackathon_submissions(status, created_at);

INSERT OR IGNORE INTO hackathon_categories(slug,label,sort_order) VALUES
 ('ai','AI',1),('machine-learning','Machine Learning',2),('data-science','Data Science',3),
 ('cybersecurity','Cybersecurity',4),('fintech','FinTech',5),('web-development','Web Development',6),
 ('robotics','Robotics',7),('game-development','Game Development',8),('engineering','Engineering',9),
 ('startups','Startups',10),('business','Business',11),('education','Education',12),('other','Other',13),
 ('space','Space',14),('green-tech','Green Technologies',15);
