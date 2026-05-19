-- Charisma scoring database table
CREATE TABLE characters (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  character_name text NOT NULL UNIQUE,
  source text NOT NULL,
  category text NOT NULL CHECK (category IN ('fictional', 'public_figure', 'private')),
  charisma int NOT NULL CHECK (charisma BETWEEN 3 AND 30),
  intelligence int NOT NULL CHECK (intelligence BETWEEN 3 AND 30),
  wisdom int NOT NULL CHECK (wisdom BETWEEN 3 AND 30),
  class text NOT NULL,
  subclass text NOT NULL,
  charisma_reasoning text NOT NULL,
  intelligence_reasoning text NOT NULL,
  wisdom_reasoning text NOT NULL,
  class_reasoning text NOT NULL,
  stat_interaction text NOT NULL,
  scored_by text NOT NULL DEFAULT 'unknown',
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE characters ENABLE ROW LEVEL SECURITY;

-- Allow anyone to read
CREATE POLICY "Public read access" ON characters
  FOR SELECT USING (true);

-- Allow inserts with the anon key
CREATE POLICY "Public insert access" ON characters
  FOR INSERT WITH CHECK (true);

-- Allow updates (for re-scoring)
CREATE POLICY "Public update access" ON characters
  FOR UPDATE USING (true);
