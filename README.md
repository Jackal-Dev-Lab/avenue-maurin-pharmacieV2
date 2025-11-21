# 🏥 Pharmacie Maurin - Version Minimale (< 100 fichiers)

Version simplifiée du site de pharmacie avec Supabase, optimisée pour un upload direct sur Vercel.

## ✨ Contenu

**20 fichiers seulement** au lieu de 131 !

- ✅ Tous les fichiers essentiels
- ✅ Fonctionnalités principales
- ✅ Supabase intégré
- ✅ Design moderne avec Tailwind
- ✅ Prêt pour Vercel

## 🚀 Installation

```bash
# 1. Installer les dépendances
npm install

# 2. Configurer les variables d'environnement
cp .env.example .env.local
# Éditez .env.local avec vos clés Supabase

# 3. Lancer en développement
npm run dev
```

## 📦 Déploiement Vercel

### Méthode 1 : Upload direct (fonctionne maintenant !)

1. Allez sur https://vercel.com
2. New Project → Upload files
3. Glissez-déposez TOUT le dossier
4. Ajoutez les variables d'environnement
5. Deploy !

### Méthode 2 : Via Git (recommandé)

Voir le fichier `DEPLOIEMENT_VIA_GIT.md`

## 🗄️ Configuration Supabase

1. Créez un projet sur https://supabase.com
2. Exécutez `supabase-schema.sql` dans SQL Editor
3. Exécutez `supabase-seed-data.sql` pour les données de test
4. Créez un bucket `pharmacy-images` (PUBLIC)
5. Copiez vos clés dans `.env.local`

## 📁 Structure

```
projet-minimal/
├── src/
│   ├── components/      # 6 composants
│   │   ├── Header.tsx
│   │   ├── Footer.tsx
│   │   ├── HeroSlider.tsx
│   │   ├── ProductCard.tsx
│   │   └── ProductList.tsx
│   ├── pages/          # 2 pages
│   │   ├── Home.tsx
│   │   └── Contact.tsx
│   ├── hooks/          # 1 hook
│   │   └── useSupabase.ts
│   ├── lib/            # 2 fichiers
│   │   ├── supabase.ts
│   │   └── database.types.ts
│   ├── App.tsx
│   ├── main.tsx
│   └── index.css
├── public/
│   └── favicon.ico
├── Configuration (8 fichiers)
├── SQL (2 fichiers)
└── Total: ~25 fichiers
```

## ✅ Fonctionnalités incluses

- ✅ Page d'accueil avec carousel
- ✅ Liste de produits dynamiques depuis Supabase
- ✅ Page de contact
- ✅ Header avec navigation
- ✅ Footer complet
- ✅ Design responsive
- ✅ Gestion du panier (interface)
- ✅ Favoris (interface)

## 🎨 Technologies

- React 18
- TypeScript
- Tailwind CSS
- Supabase
- React Query
- React Router
- Vite

## 📝 Variables d'environnement

```env
VITE_SUPABASE_URL=votre-url-supabase
VITE_SUPABASE_ANON_KEY=votre-cle-anon
VITE_SUPABASE_STORAGE_BUCKET=pharmacy-images
```

## 🔧 Commandes

```bash
npm run dev       # Développement
npm run build     # Build production
npm run preview   # Preview du build
```

## 📚 Pour aller plus loin

Cette version est simplifiée mais fonctionnelle. Pour ajouter :
- Plus de pages
- Plus de composants UI
- Gestion du panier complète
- Authentification

Consultez la version complète du projet.

## 🆘 Support

- Configuration Supabase : voir `supabase-schema.sql`
- Déploiement : voir `DEPLOIEMENT_VIA_GIT.md`
- Variables d'environnement : voir `.env.example`

---

**Version minimaliste créée pour contourner la limite de 100 fichiers de Vercel upload direct** 🚀
