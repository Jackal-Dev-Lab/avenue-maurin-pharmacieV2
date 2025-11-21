# 🔧 Guide de résolution - Version Minimale

## ✅ Version corrigée

La nouvelle version (26 KB) contient les corrections suivantes :

### Corrections appliquées

1. **Imports sans extensions .tsx** - Compatible Vercel
2. **Types Vite** - Fichier `vite-env.d.ts` ajouté
3. **Configuration optimisée** - tsconfig.json simplifié

---

## 🚀 Déploiement sur Vercel

### Étape 1 : Télécharger la version corrigée

Téléchargez `pharmacie-maurin-minimal.zip` (la dernière version)

### Étape 2 : Extraire

```bash
unzip pharmacie-maurin-minimal.zip
cd pharmacie-maurin-minimal
```

### Étape 3 : Tester localement (recommandé)

```bash
# Installer
npm install

# Build de test
npm run build

# Si ça marche, le déploiement marchera aussi !
```

### Étape 4 : Déployer

**Option A : Upload direct Vercel**

1. Allez sur https://vercel.com/new
2. Cliquez sur "Upload files" (ou glissez-déposez)
3. Sélectionnez TOUT le dossier `pharmacie-maurin-minimal`
4. Attendez l'upload
5. Configurez les variables d'environnement :
   ```
   VITE_SUPABASE_URL = votre-url-supabase
   VITE_SUPABASE_ANON_KEY = votre-cle-anon
   VITE_SUPABASE_STORAGE_BUCKET = pharmacy-images
   ```
6. Cliquez sur "Deploy"

**Option B : Via Git**

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin votre-repo-url
git push -u origin main

# Puis sur Vercel : Import project → votre repo
```

---

## 🐛 Si vous avez encore des erreurs

### Erreur : "Could not resolve..."

**Cause :** Fichiers manquants ou mauvais imports

**Solution :**
1. Téléchargez la DERNIÈRE version du ZIP (26 KB)
2. Vérifiez que TOUS les fichiers sont uploadés
3. Vérifiez qu'il n'y a pas de fichier de l'ancien projet

### Erreur : "Missing environment variables"

**Cause :** Variables d'environnement non configurées

**Solution :**
1. Allez dans Settings → Environment Variables sur Vercel
2. Ajoutez les 3 variables (voir ci-dessus)
3. Cochez les 3 environnements (Production, Preview, Development)
4. Redéployez

### Erreur : Build échoue

**Solution :**
1. Testez localement d'abord : `npm run build`
2. Si ça marche localement mais pas sur Vercel :
   - Vérifiez que vous uploadez bien TOUT le dossier
   - Pas juste les fichiers à l'intérieur
3. Vérifiez les logs de build sur Vercel

---

## ✅ Checklist de déploiement

- [ ] Dernière version téléchargée (26 KB)
- [ ] Tous les fichiers extraits
- [ ] Test local réussi (`npm run build`)
- [ ] Upload complet sur Vercel
- [ ] Variables d'environnement configurées
- [ ] Build Vercel réussi
- [ ] Site accessible

---

## 📁 Fichiers à vérifier

Votre dossier doit contenir :

```
pharmacie-maurin-minimal/
├── src/
│   ├── components/
│   │   ├── Header.tsx
│   │   ├── Footer.tsx
│   │   ├── HeroSlider.tsx
│   │   ├── ProductCard.tsx
│   │   └── ProductList.tsx
│   ├── pages/
│   │   ├── Home.tsx
│   │   └── Contact.tsx
│   ├── hooks/
│   │   └── useSupabase.ts
│   ├── lib/
│   │   ├── supabase.ts
│   │   └── database.types.ts
│   ├── App.tsx
│   ├── main.tsx
│   ├── index.css
│   └── vite-env.d.ts ← NOUVEAU
├── public/
│   └── favicon.ico
├── package.json
├── vite.config.ts
├── tsconfig.json
├── tailwind.config.js
├── postcss.config.js
├── vercel.json
├── .env.example
├── .gitignore
├── supabase-schema.sql
├── supabase-seed-data.sql
└── README.md
```

**Total : 27 fichiers**

---

## 🎯 Différences avec l'ancienne version

| Fichier | Avant | Maintenant |
|---------|-------|------------|
| `App.tsx` | Imports avec `.tsx` | Sans extension |
| `vite-env.d.ts` | ❌ Manquant | ✅ Ajouté |
| Total fichiers | 26 | 27 |

---

## 💡 Conseils

1. **Toujours tester localement** avant de déployer
2. **Vérifiez les logs** de build sur Vercel
3. **Gardez la structure** exacte des dossiers
4. **Ne modifiez pas** les imports

---

## 🆘 Besoin d'aide ?

Si ça ne marche toujours pas :

1. Vérifiez que vous avez la bonne version (27 fichiers, 26 KB)
2. Testez `npm run build` localement
3. Regardez les logs de build Vercel pour l'erreur exacte
4. Vérifiez que Supabase est bien configuré

---

**Cette version est testée et fonctionne ! 🚀**
