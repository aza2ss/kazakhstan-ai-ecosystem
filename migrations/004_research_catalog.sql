ALTER TABLE startups ADD COLUMN record_type TEXT NOT NULL DEFAULT 'startup';
ALTER TABLE startups ADD COLUMN category_slugs_json TEXT NOT NULL DEFAULT '[]';
ALTER TABLE startups ADD COLUMN geography_tags_json TEXT NOT NULL DEFAULT '[]';
ALTER TABLE startups ADD COLUMN ai_relevance TEXT NOT NULL DEFAULT 'Non-AI Technology';
ALTER TABLE startups ADD COLUMN verification_status TEXT NOT NULL DEFAULT 'PARTIALLY_VERIFIED';
ALTER TABLE startups ADD COLUMN logo_url TEXT NOT NULL DEFAULT '';
ALTER TABLE startups ADD COLUMN official_socials_json TEXT NOT NULL DEFAULT '[]';
ALTER TABLE startups ADD COLUMN public_contact TEXT NOT NULL DEFAULT '';
ALTER TABLE startups ADD COLUMN primary_source TEXT NOT NULL DEFAULT '';
ALTER TABLE startups ADD COLUMN secondary_source TEXT NOT NULL DEFAULT '';
ALTER TABLE startups ADD COLUMN discovery_source TEXT NOT NULL DEFAULT '';
ALTER TABLE startups ADD COLUMN checked_at TEXT NOT NULL DEFAULT '';

ALTER TABLE hackathon_events ADD COLUMN image_url TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS startup_categories (
  slug TEXT PRIMARY KEY,
  label TEXT NOT NULL UNIQUE,
  sort_order INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS startup_candidates (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  source_url TEXT NOT NULL DEFAULT '',
  source_type TEXT NOT NULL DEFAULT '',
  record_type TEXT NOT NULL DEFAULT 'unclassified',
  category_hint TEXT NOT NULL DEFAULT '',
  city_hint TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'PENDING' CHECK(status IN ('PENDING','REJECTED')),
  notes TEXT NOT NULL DEFAULT '',
  discovery_sources_json TEXT NOT NULL DEFAULT '[]',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_startup_candidates_status ON startup_candidates(status);
CREATE TABLE IF NOT EXISTS hackathon_cities (
  name TEXT PRIMARY KEY,
  sort_order INTEGER NOT NULL DEFAULT 0
);

INSERT OR IGNORE INTO startup_categories(slug,label,sort_order) VALUES
('ai-ml','AI & Machine Learning',1),('generative-ai','Generative AI',2),('deeptech','DeepTech',3),
('fintech','FinTech',4),('edtech','EdTech',5),('healthtech','HealthTech',6),('medtech','MedTech',7),
('agritech','AgriTech',8),('govtech','GovTech',9),('saas-b2b','SaaS & B2B',10),('cybersecurity','Cybersecurity',11),
('robotics-hardware','Robotics & Hardware',12),('logistics-mobility','Logistics & Mobility',13),('ecommerce','E-commerce',14),
('gamedev','GameDev',15),('martech','MarTech',16),('legaltech','LegalTech',17),('proptech','PropTech',18),
('industrialtech','IndustrialTech',19),('climatetech','ClimateTech',20),('spacetech','SpaceTech',21),('other-technology','Other Technology',22);

UPDATE startups SET category_slugs_json='["ai-ml","govtech","saas-b2b"]',ai_relevance='AI Enabled',record_type='technology-company' WHERE id='sergek';
UPDATE startups SET category_slugs_json='["ai-ml","healthtech","medtech"]',ai_relevance='AI Core',record_type='startup' WHERE id='cerebra';
UPDATE startups SET category_slugs_json='["saas-b2b","govtech"]',ai_relevance='AI Applied',record_type='technology-company' WHERE id='documentolog';
UPDATE startups SET category_slugs_json='["ai-ml","cybersecurity","fintech"]',ai_relevance='AI Enabled',record_type='technology-company' WHERE id='beyne';
UPDATE startups SET category_slugs_json='["ai-ml","generative-ai"]',ai_relevance='AI Core',record_type='startup' WHERE id='higgsfield';
UPDATE startups SET category_slugs_json='["ai-ml","fintech","deeptech"]',ai_relevance='AI Core',record_type='startup' WHERE id='zypl';

UPDATE events SET start_at='2026-11-20T09:00:00+05:00',end_at='2026-11-21T13:30:00+05:00',registration_deadline='2026-11-17T18:00:00+05:00',city='Алматы',address='93Г/5, MITU',format='Offline',registration_status='Закрыта',website='https://hackathon.metu.kz/' WHERE id='mitu-2026';
