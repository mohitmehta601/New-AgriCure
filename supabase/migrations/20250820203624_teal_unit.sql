/*
  # Create products table for product ID validation

  1. New Tables
    - `products`
      - `id` (text, primary key) - The product ID
      - `name` (text) - Product name
      - `is_active` (boolean) - Whether the product is active
      - `created_at` (timestamp) - When the product was created

  2. Security
    - Enable RLS on `products` table
    - Add policy for public read access to check product validity

  3. Data
    - Insert the 10 valid product IDs
*/

CREATE TABLE IF NOT EXISTS products (
  id text PRIMARY KEY,
  name text NOT NULL DEFAULT 'AgriCure Product',
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE products ENABLE ROW LEVEL SECURITY;

-- Allow public read access to check product validity during signup
CREATE POLICY "Anyone can read active products"
  ON products
  FOR SELECT
  TO public
  USING (is_active = true);

-- Insert the 10 valid product IDs
INSERT INTO products (id, name, is_active) VALUES
  ('8972345610', 'AgriCure Pro', true),
  ('1029384756', 'AgriCure Standard', true),
  ('5647382910', 'AgriCure Premium', true),
  ('9081726354', 'AgriCure Enterprise', true),
  ('6758493021', 'AgriCure Basic', true),
  ('3141592653', 'AgriCure Advanced', true),
  ('7263549810', 'AgriCure Professional', true),
  ('8391027465', 'AgriCure Elite', true),
  ('4516273980', 'AgriCure Ultimate', true),
  ('1234567890', 'AgriCure Starter', true)
ON CONFLICT (id) DO NOTHING;