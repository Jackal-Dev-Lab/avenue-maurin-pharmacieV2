-- ============================================
-- SCHEMA SUPABASE POUR PHARMACIE EN LIGNE
-- ============================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- TABLE: categories
-- Gère les catégories de produits
-- ============================================
CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  image_url TEXT,
  icon VARCHAR(50),
  parent_id UUID REFERENCES categories(id),
  display_order INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- TABLE: products
-- Gère tous les produits en vente
-- ============================================
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(500) NOT NULL,
  slug VARCHAR(500) UNIQUE NOT NULL,
  brand VARCHAR(255),
  description TEXT,
  short_description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  old_price DECIMAL(10, 2),
  category_id UUID REFERENCES categories(id),
  stock_quantity INTEGER DEFAULT 0,
  stock_status VARCHAR(50) DEFAULT 'available', -- available, lowStock, outOfStock
  rating DECIMAL(3, 2) DEFAULT 0,
  review_count INTEGER DEFAULT 0,
  is_new BOOLEAN DEFAULT FALSE,
  is_featured BOOLEAN DEFAULT FALSE,
  is_irene_choice BOOLEAN DEFAULT FALSE,
  is_active BOOLEAN DEFAULT TRUE,
  display_order INTEGER DEFAULT 0,
  meta_title VARCHAR(255),
  meta_description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  CONSTRAINT check_price_positive CHECK (price >= 0),
  CONSTRAINT check_old_price_greater CHECK (old_price IS NULL OR old_price > price),
  CONSTRAINT check_rating_range CHECK (rating >= 0 AND rating <= 5)
);

-- ============================================
-- TABLE: product_images
-- Gère les images des produits (plusieurs par produit)
-- ============================================
CREATE TABLE product_images (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  image_url TEXT NOT NULL,
  alt_text VARCHAR(255),
  display_order INTEGER DEFAULT 0,
  is_primary BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- TABLE: hero_slides
-- Gère les slides du carousel principal
-- ============================================
CREATE TABLE hero_slides (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title VARCHAR(500) NOT NULL,
  description TEXT,
  image_url TEXT NOT NULL,
  button_text VARCHAR(100),
  button_link VARCHAR(500),
  theme VARCHAR(20) DEFAULT 'light', -- light ou dark
  display_order INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- TABLE: site_images
-- Gère toutes les autres images du site (logos, bannières, etc.)
-- ============================================
CREATE TABLE site_images (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  key VARCHAR(255) UNIQUE NOT NULL, -- Identifiant unique pour référencer l'image (ex: 'header-logo', 'footer-banner')
  name VARCHAR(255) NOT NULL,
  description TEXT,
  image_url TEXT NOT NULL,
  alt_text VARCHAR(255),
  category VARCHAR(100), -- 'logo', 'banner', 'icon', 'background', etc.
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- TABLE: team_members
-- Gère les membres de l'équipe
-- ============================================
CREATE TABLE team_members (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL,
  bio TEXT,
  photo_url TEXT,
  email VARCHAR(255),
  phone VARCHAR(50),
  display_order INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- TABLE: advice_articles
-- Gère les articles de conseils
-- ============================================
CREATE TABLE advice_articles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title VARCHAR(500) NOT NULL,
  slug VARCHAR(500) UNIQUE NOT NULL,
  excerpt TEXT,
  content TEXT NOT NULL,
  author_id UUID REFERENCES team_members(id),
  featured_image_url TEXT,
  category VARCHAR(100),
  tags TEXT[], -- Array de tags
  is_published BOOLEAN DEFAULT FALSE,
  published_at TIMESTAMP WITH TIME ZONE,
  views_count INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- TABLE: site_settings
-- Paramètres généraux du site
-- ============================================
CREATE TABLE site_settings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  key VARCHAR(255) UNIQUE NOT NULL,
  value TEXT,
  type VARCHAR(50) DEFAULT 'text', -- text, number, boolean, json, image
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- INDEXES pour améliorer les performances
-- ============================================
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_slug ON products(slug);
CREATE INDEX idx_products_is_active ON products(is_active);
CREATE INDEX idx_products_is_featured ON products(is_featured);
CREATE INDEX idx_product_images_product ON product_images(product_id);
CREATE INDEX idx_categories_slug ON categories(slug);
CREATE INDEX idx_categories_parent ON categories(parent_id);
CREATE INDEX idx_hero_slides_active ON hero_slides(is_active);
CREATE INDEX idx_site_images_key ON site_images(key);
CREATE INDEX idx_advice_articles_slug ON advice_articles(slug);
CREATE INDEX idx_advice_articles_published ON advice_articles(is_published);

-- ============================================
-- FUNCTIONS pour mettre à jour updated_at automatiquement
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers pour updated_at
CREATE TRIGGER update_categories_updated_at BEFORE UPDATE ON categories
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_hero_slides_updated_at BEFORE UPDATE ON hero_slides
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_site_images_updated_at BEFORE UPDATE ON site_images
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_team_members_updated_at BEFORE UPDATE ON team_members
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_advice_articles_updated_at BEFORE UPDATE ON advice_articles
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_site_settings_updated_at BEFORE UPDATE ON site_settings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- Active la sécurité au niveau des lignes
-- ============================================

-- Activer RLS sur toutes les tables
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE hero_slides ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE advice_articles ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

-- Politiques de lecture publique (tout le monde peut lire les données actives)
CREATE POLICY "Public read access for active categories" ON categories
    FOR SELECT USING (is_active = TRUE);

CREATE POLICY "Public read access for active products" ON products
    FOR SELECT USING (is_active = TRUE);

CREATE POLICY "Public read access for product images" ON product_images
    FOR SELECT USING (TRUE);

CREATE POLICY "Public read access for active hero slides" ON hero_slides
    FOR SELECT USING (is_active = TRUE);

CREATE POLICY "Public read access for active site images" ON site_images
    FOR SELECT USING (is_active = TRUE);

CREATE POLICY "Public read access for active team members" ON team_members
    FOR SELECT USING (is_active = TRUE);

CREATE POLICY "Public read access for published articles" ON advice_articles
    FOR SELECT USING (is_published = TRUE);

CREATE POLICY "Public read access for site settings" ON site_settings
    FOR SELECT USING (TRUE);

-- ============================================
-- DONNÉES D'EXEMPLE
-- ============================================

-- Catégories
INSERT INTO categories (name, slug, description, icon) VALUES
('Pharmacie', 'pharmacie', 'Médicaments et produits de santé', 'Pill'),
('Parapharmacie', 'parapharmacie', 'Produits de bien-être', 'Heart'),
('Beauté', 'beaute', 'Soins et cosmétiques', 'Sparkles'),
('Nutrition', 'nutrition', 'Compléments alimentaires', 'Apple'),
('Bébé', 'bebe', 'Produits pour bébés', 'Baby'),
('Immunité', 'immunite', 'Renforcement immunitaire', 'Shield'),
('Articulations', 'articulations', 'Santé des articulations', 'Bone'),
('Saisonnier', 'saisonnier', 'Produits saisonniers', 'Sun');

-- Paramètres du site
INSERT INTO site_settings (key, value, type, description) VALUES
('site_name', 'Pharmacie Maurin', 'text', 'Nom du site'),
('site_tagline', 'Votre santé, notre priorité', 'text', 'Slogan du site'),
('contact_email', 'contact@pharmacie-maurin.fr', 'text', 'Email de contact'),
('contact_phone', '04 XX XX XX XX', 'text', 'Téléphone de contact'),
('address', '123 Rue de la Santé, 34000 Montpellier', 'text', 'Adresse de la pharmacie'),
('facebook_url', 'https://facebook.com/pharmacie-maurin', 'text', 'Lien Facebook'),
('instagram_url', 'https://instagram.com/pharmacie-maurin', 'text', 'Lien Instagram');

-- Images du site
INSERT INTO site_images (key, name, image_url, alt_text, category) VALUES
('logo-header', 'Logo Header', '/placeholder.svg', 'Logo Pharmacie Maurin', 'logo'),
('logo-footer', 'Logo Footer', '/placeholder.svg', 'Logo Pharmacie Maurin', 'logo'),
('banner-home', 'Bannière Accueil', '/placeholder.svg', 'Bannière accueil', 'banner');

-- Slides Hero
INSERT INTO hero_slides (title, description, image_url, button_text, button_link, theme, display_order) VALUES
('Préparez-vous pour l''hiver', 'Protégez votre immunité avec notre sélection de produits naturels', 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?q=80&w=1600&auto=format&fit=crop', 'Découvrir', '/categories/saisonnier', 'dark', 1),
('La beauté naturelle', 'Notre sélection de soins avec des ingrédients naturels et éthiques', 'https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=1600&auto=format&fit=crop', 'Voir les produits', '/categories/beaute', 'light', 2),
('L''équipe vous conseille', 'Prenez rendez-vous avec un de nos pharmaciens pour un conseil personnalisé', 'https://images.unsplash.com/photo-1577204551722-5b8ad2630dce?q=80&w=1600&auto=format&fit=crop', 'Contacter', '/contact', 'light', 3);
