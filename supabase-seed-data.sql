-- ============================================
-- DONNÉES DE TEST POUR LA PHARMACIE
-- ============================================

-- Insérer des produits de test
DO $$
DECLARE
    cat_pharmacie UUID;
    cat_beaute UUID;
    cat_nutrition UUID;
    cat_bebe UUID;
    cat_immunite UUID;
    product_id UUID;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO cat_pharmacie FROM categories WHERE slug = 'pharmacie';
    SELECT id INTO cat_beaute FROM categories WHERE slug = 'beaute';
    SELECT id INTO cat_nutrition FROM categories WHERE slug = 'nutrition';
    SELECT id INTO cat_bebe FROM categories WHERE slug = 'bebe';
    SELECT id INTO cat_immunite FROM categories WHERE slug = 'immunite';

    -- Produits Pharmacie
    INSERT INTO products (name, slug, brand, description, short_description, price, old_price, category_id, stock_quantity, stock_status, rating, review_count, is_new, is_featured, is_irene_choice) VALUES
    ('Doliprane 1000mg - 8 comprimés', 'doliprane-1000mg-8-comprimes', 'Doliprane', 'Médicament contre la douleur et la fièvre. Contient du paracétamol.', 'Antidouleur et antipyrétique', 3.50, NULL, cat_pharmacie, 150, 'available', 4.5, 234, false, true, false),
    ('Ibuprofène 400mg - 12 comprimés', 'ibuprofene-400mg-12-comprimes', 'Advil', 'Anti-inflammatoire non stéroïdien pour les douleurs et inflammations.', 'Anti-inflammatoire', 5.20, 6.50, cat_pharmacie, 80, 'available', 4.3, 189, false, true, true),
    ('Spray nasal décongestionnant', 'spray-nasal-decongestionnant', 'Sterimar', 'Solution d''eau de mer pour décongestionner le nez.', 'Hygiène nasale', 7.90, NULL, cat_pharmacie, 45, 'lowStock', 4.7, 156, false, false, false);

    -- Produits Beauté
    INSERT INTO products (name, slug, brand, description, short_description, price, old_price, category_id, stock_quantity, stock_status, rating, review_count, is_new, is_featured, is_irene_choice) 
    RETURNING id INTO product_id;
    
    INSERT INTO products (name, slug, brand, description, short_description, price, old_price, category_id, stock_quantity, stock_status, rating, review_count, is_new, is_featured, is_irene_choice) VALUES
    ('Crème hydratante visage Bio', 'creme-hydratante-visage-bio', 'Caudalie', 'Crème hydratante pour tous types de peaux. Formule naturelle et bio.', 'Soin hydratant visage', 24.90, NULL, cat_beaute, 60, 'available', 4.8, 312, true, true, true),
    ('Sérum anti-âge vitamine C', 'serum-anti-age-vitamine-c', 'La Roche-Posay', 'Sérum concentré en vitamine C pour un teint éclatant.', 'Soin anti-âge', 32.50, 38.00, cat_beaute, 35, 'available', 4.6, 267, true, true, false),
    ('Baume à lèvres réparateur', 'baume-a-levres-reparateur', 'Avène', 'Baume nourrissant et réparateur pour les lèvres sèches et gercées.', 'Soin des lèvres', 6.50, NULL, cat_beaute, 120, 'available', 4.4, 89, false, false, false);

    -- Produits Nutrition
    INSERT INTO products (name, slug, brand, description, short_description, price, old_price, category_id, stock_quantity, stock_status, rating, review_count, is_new, is_featured, is_irene_choice) VALUES
    ('Vitamine D3 - 60 gélules', 'vitamine-d3-60-gelules', 'Arkopharma', 'Complément alimentaire pour maintenir un système immunitaire normal.', 'Vitamine D3 1000 UI', 12.90, NULL, cat_nutrition, 95, 'available', 4.5, 178, false, true, true),
    ('Oméga 3 - Huile de poisson', 'omega-3-huile-de-poisson', 'Super Diet', 'Acides gras essentiels pour la santé cardiovasculaire.', 'EPA et DHA naturels', 18.50, 22.00, cat_nutrition, 70, 'available', 4.7, 145, false, true, false),
    ('Magnésium Marin - 30 comprimés', 'magnesium-marin-30-comprimes', 'Léro', 'Combat la fatigue et le stress. Magnésium d''origine marine.', 'Anti-fatigue naturel', 9.90, NULL, cat_nutrition, 110, 'available', 4.3, 201, false, false, false);

    -- Produits Bébé
    INSERT INTO products (name, slug, brand, description, short_description, price, old_price, category_id, stock_quantity, stock_status, rating, review_count, is_new, is_featured, is_irene_choice) VALUES
    ('Lingettes bébé x72', 'lingettes-bebe-x72', 'Mustela', 'Lingettes douces pour nettoyer en douceur la peau de bébé.', 'Hygiène bébé', 4.90, NULL, cat_bebe, 200, 'available', 4.6, 423, false, true, false),
    ('Crème pour le change', 'creme-pour-le-change', 'Weleda', 'Protège et apaise les fesses de bébé. Formule naturelle.', 'Soin du siège', 8.90, NULL, cat_bebe, 85, 'available', 4.8, 356, false, true, true),
    ('Lait corporel bébé Bio 200ml', 'lait-corporel-bebe-bio-200ml', 'Biolane', 'Hydrate et nourrit la peau délicate de bébé.', 'Soin hydratant corps', 11.50, 13.90, cat_bebe, 55, 'available', 4.5, 167, true, false, false);

    -- Produits Immunité
    INSERT INTO products (name, slug, brand, description, short_description, price, old_price, category_id, stock_quantity, stock_status, rating, review_count, is_new, is_featured, is_irene_choice) VALUES
    ('Échinacée - 30 gélules', 'echinacea-30-gelules', 'Nat & Form', 'Renforce les défenses naturelles. Extrait d''échinacée bio.', 'Défenses immunitaires', 8.90, NULL, cat_immunite, 75, 'available', 4.4, 134, false, true, false),
    ('Propolis spray gorge', 'propolis-spray-gorge', 'Ballot-Flurin', 'Apaise la gorge irritée. Propolis française bio.', 'Confort de la gorge', 13.50, NULL, cat_immunite, 40, 'lowStock', 4.6, 198, false, false, true),
    ('Vitamine C Acérola 1000mg', 'vitamine-c-acerola-1000mg', 'Juvamine', 'Complément alimentaire à croquer. Goût fruits rouges.', 'Tonus et vitalité', 7.90, 9.90, cat_immunite, 150, 'available', 4.2, 289, false, true, false);

END $$;

-- Ajouter des images aux produits
DO $$
DECLARE
    prod RECORD;
BEGIN
    -- Pour chaque produit, ajouter 2-3 images
    FOR prod IN SELECT id, slug FROM products LOOP
        -- Image principale
        INSERT INTO product_images (product_id, image_url, alt_text, display_order, is_primary) VALUES
        (prod.id, 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?q=80&w=600', 'Image principale ' || prod.slug, 0, true);
        
        -- Image secondaire
        INSERT INTO product_images (product_id, image_url, alt_text, display_order, is_primary) VALUES
        (prod.id, 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?q=80&w=600', 'Image secondaire ' || prod.slug, 1, false);
    END LOOP;
END $$;

-- Ajouter des membres d'équipe
INSERT INTO team_members (name, role, bio, photo_url, email, phone, display_order) VALUES
('Irène Maurin', 'Pharmacienne Titulaire', 'Diplômée en 2005, Irène est passionnée par le conseil personnalisé et la santé naturelle.', 'https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=400', 'irene.maurin@pharmacie.fr', '04 XX XX XX XX', 1),
('Dr. Jean Dupont', 'Pharmacien', 'Spécialisé en homéopathie et phytothérapie depuis plus de 15 ans.', 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=400', 'jean.dupont@pharmacie.fr', '04 XX XX XX XX', 2),
('Marie Lambert', 'Préparatrice en Pharmacie', 'Experte en dermato-cosmétique et conseils beauté.', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=400', 'marie.lambert@pharmacie.fr', '04 XX XX XX XX', 3),
('Sophie Martin', 'Préparatrice en Pharmacie', 'Spécialisée dans les produits pour bébés et enfants.', 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?q=80&w=400', 'sophie.martin@pharmacie.fr', '04 XX XX XX XX', 4);

-- Ajouter des articles de conseils
INSERT INTO advice_articles (title, slug, excerpt, content, author_id, featured_image_url, category, tags, is_published, published_at) VALUES
(
    'Comment renforcer son immunité pour l''hiver',
    'comment-renforcer-immunite-hiver',
    'L''hiver approche et avec lui, les virus saisonniers. Découvrez nos conseils pour booster vos défenses naturelles.',
    '# Comment renforcer son immunité pour l''hiver

L''hiver est une période propice aux infections virales. Voici nos meilleurs conseils pour renforcer votre système immunitaire naturellement.

## Une alimentation équilibrée

Privilégiez les fruits et légumes riches en vitamines C et D. Les agrumes, le kiwi, les épinards sont vos alliés.

## L''activité physique régulière

30 minutes de marche par jour suffisent pour stimuler vos défenses immunitaires.

## Le sommeil réparateur

Dormez au moins 7-8 heures par nuit pour permettre à votre corps de se régénérer.

## Les compléments alimentaires

N''hésitez pas à demander conseil à votre pharmacien pour choisir les bons compléments : vitamine D, échinacée, propolis...',
    (SELECT id FROM team_members WHERE name = 'Irène Maurin'),
    'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?q=80&w=800',
    'Santé',
    ARRAY['immunité', 'hiver', 'prévention', 'santé naturelle'],
    true,
    NOW() - INTERVAL '2 days'
),
(
    'Routine beauté : les essentiels pour une peau éclatante',
    'routine-beaute-peau-eclatante',
    'Découvrez les étapes clés d''une routine beauté efficace pour une peau saine et lumineuse.',
    '# Routine beauté : les essentiels pour une peau éclatante

Une belle peau commence par une routine adaptée. Voici nos recommandations.

## Le nettoyage

Matin et soir, nettoyez votre visage avec un produit doux adapté à votre type de peau.

## L''hydratation

Appliquez une crème hydratante matin et soir. N''oubliez pas le contour des yeux.

## La protection solaire

Même en hiver, protégez votre peau avec un SPF 30 minimum.

## Les soins ciblés

Utilisez un sérum adapté à vos besoins : anti-âge, anti-taches, hydratation intense...',
    (SELECT id FROM team_members WHERE name = 'Marie Lambert'),
    'https://images.unsplash.com/photo-1552693673-1bf958298935?q=80&w=800',
    'Beauté',
    ARRAY['beauté', 'routine', 'soins', 'cosmétiques'],
    true,
    NOW() - INTERVAL '5 days'
),
(
    'Les premiers soins pour bébé : guide complet',
    'premiers-soins-bebe-guide',
    'Tout ce que vous devez savoir sur les soins essentiels pour votre nouveau-né.',
    '# Les premiers soins pour bébé : guide complet

Prendre soin de son bébé peut sembler intimidant. Voici nos conseils pour les soins quotidiens.

## L''hygiène corporelle

Bain 2-3 fois par semaine avec un produit doux. Nettoyage quotidien des plis et du siège.

## Le change

Changez la couche régulièrement et appliquez une crème protectrice si besoin.

## L''hydratation

Utilisez un lait corporel hypoallergénique après le bain.

## Les produits à privilégier

Choisissez des produits spécialement formulés pour bébé, sans parfum et testés dermatologiquement.',
    (SELECT id FROM team_members WHERE name = 'Sophie Martin'),
    'https://images.unsplash.com/photo-1555252333-9f8e92e65df9?q=80&w=800',
    'Bébé',
    ARRAY['bébé', 'soins', 'hygiène', 'parentalité'],
    true,
    NOW() - INTERVAL '1 week'
);

-- Mettre à jour les compteurs de vues
UPDATE advice_articles SET views_count = 156 WHERE slug = 'comment-renforcer-immunite-hiver';
UPDATE advice_articles SET views_count = 234 WHERE slug = 'routine-beaute-peau-eclatante';
UPDATE advice_articles SET views_count = 89 WHERE slug = 'premiers-soins-bebe-guide';

-- Confirmation
SELECT 'Base de données initialisée avec succès!' as message;
SELECT COUNT(*) as total_products FROM products;
SELECT COUNT(*) as total_images FROM product_images;
SELECT COUNT(*) as total_team_members FROM team_members;
SELECT COUNT(*) as total_articles FROM advice_articles;
