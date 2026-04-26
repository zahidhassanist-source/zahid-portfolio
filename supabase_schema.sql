-- ================================================
-- ZAHID HASSAN PORTFOLIO — SUPABASE SCHEMA
-- Run this in Supabase → SQL Editor → New Query
-- ================================================

-- 1. SITE SETTINGS (general, hero, about, contact)
CREATE TABLE IF NOT EXISTS site_settings (
  key TEXT PRIMARY KEY,
  value TEXT
);

-- Insert default values
INSERT INTO site_settings (key, value) VALUES
  ('site_title', 'Zahid Hassan — Portfolio'),
  ('eyebrow', 'Available for projects — 2026'),
  ('footer_tag', 'Graphic Designer · AI Expert · Book Designer'),
  ('hero_name_1', 'ZAHID'),
  ('hero_name_2', 'HASSAN'),
  ('about_heading', 'Design meets intelligence.'),
  ('about_p1', 'I''m Zahid Hassan — a multi-disciplinary creative based in Bangladesh. I craft compelling visual identities, design books that feel like objects, automate complex workflows with n8n, and build AI-powered systems that transform how people work.'),
  ('about_p2', 'My practice lives at the intersection of aesthetics and technology — where beautiful design and intelligent systems create experiences greater than either alone.'),
  ('stat1_num', '5+'),
  ('stat1_label', 'Years Experience'),
  ('stat2_num', '80+'),
  ('stat2_label', 'Projects Done'),
  ('stat3_num', '4'),
  ('stat3_label', 'Disciplines'),
  ('contact_heading', 'Let''s work together.'),
  ('contact_sub', 'Open to freelance projects, collaborations and creative partnerships. Based in Bangladesh, working globally.'),
  ('email', 'zahidhassan.ist@gmail.com'),
  ('whatsapp', '+8801780562496'),
  ('whatsapp_text', 'Let''s Talk on WhatsApp'),
  ('behance', 'https://www.behance.net/thezahidhasan'),
  ('linkedin', 'https://linkedin.com/in/zahid-hasan-98b4a5164/'),
  ('instagram', 'https://www.instagram.com/002_december/'),
  ('facebook', 'https://www.facebook.com/Thezahidsmm/'),
  ('logo_text', 'ZH.'),
  ('logo_size', '22'),
  ('hero_photo', ''),
  ('about_photo', ''),
  ('logo_img', ''),
  ('resume_name', ''),
  ('resume_data', '')
ON CONFLICT (key) DO NOTHING;

-- 2. SKILLS / ROLE PILLS
CREATE TABLE IF NOT EXISTS skills (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO skills (name, sort_order) VALUES
  ('Graphic Designer', 1),
  ('n8n Automation', 2),
  ('AI Expert', 3),
  ('Book Designer', 4)
ON CONFLICT DO NOTHING;

-- 3. PROJECTS
CREATE TABLE IF NOT EXISTS projects (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT DEFAULT 'Design',
  display_name TEXT,
  year TEXT DEFAULT '2025',
  bg_color TEXT DEFAULT '#111122',
  icon TEXT DEFAULT '✦',
  image_data TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO projects (title, category, display_name, year, bg_color, icon, sort_order) VALUES
  ('Brand Identity', 'Graphic Design', 'Visual Identity System', '2025', '#111122', '✦', 1),
  ('Book Cover Series', 'Book Design', 'Editorial Collection', '2025', '#1a1122', '◈', 2),
  ('Automation Pipeline', 'n8n · AI', 'Workflow Automation', '2024', '#0f1a16', '⚙', 3),
  ('Campaign Design', 'Graphic Design', 'Marketing Campaign', '2024', '#14111f', '◉', 4),
  ('AI Content Engine', 'AI Expert', 'AI System Design', '2024', '#0a0f18', '⬡', 5)
ON CONFLICT DO NOTHING;

-- 4. ENABLE ROW LEVEL SECURITY (allow public read, protect writes)
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;

-- Allow public read for all tables
CREATE POLICY "Public read settings" ON site_settings FOR SELECT USING (true);
CREATE POLICY "Public read skills" ON skills FOR SELECT USING (true);
CREATE POLICY "Public read projects" ON projects FOR SELECT USING (true);

-- Allow all operations via anon key (admin panel uses this)
CREATE POLICY "Anon all settings" ON site_settings FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Anon all skills" ON skills FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Anon all projects" ON projects FOR ALL USING (true) WITH CHECK (true);

-- ================================================
-- DONE! Now copy your Project URL + anon key
-- from Settings → API and paste into the HTML
-- ================================================
