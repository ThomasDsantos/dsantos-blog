# Thomas Dsantos - Blog & Portfolio

Un blog personnel et portfolio moderne créé avec Nuxt 4, Nuxt UI et Nuxt Content.

## Technologies utilisées

- **[Nuxt 4](https://nuxt.com/)** - Le framework Vue.js intuitif
- **[Nuxt UI](https://ui.nuxt.com/)** - Bibliothèque de composants UI moderne
- **[Nuxt Content](https://content.nuxt.com/)** - Gestion de contenu basée sur fichiers
- **[Tailwind CSS](https://tailwindcss.com/)** - Framework CSS utility-first
- **[TypeScript](https://www.typescriptlang.org/)** - JavaScript avec typage statique

## Fonctionnalités

- 📝 Blog avec articles en Markdown
- 💼 Section Portfolio
- 🎨 Design moderne et responsive
- 🌙 Mode sombre/clair
- 🔍 Recherche d'articles
- 🏷️ Système de tags
- ⚡ Performance optimale

## Installation

```bash
# Installer les dépendances
pnpm install

# Lancer le serveur de développement
pnpm dev

# Build pour la production
pnpm build

# Prévisualiser la version de production
pnpm preview
```

## Structure du projet

```
├── app.vue                 # Point d'entrée de l'application
├── app.config.ts          # Configuration Nuxt UI
├── nuxt.config.ts         # Configuration Nuxt
├── components/            # Composants réutilisables
│   ├── Header.vue
│   └── Footer.vue
├── layouts/               # Layouts de l'application
│   └── default.vue
├── pages/                 # Pages du site
│   ├── index.vue         # Page d'accueil
│   ├── portfolio.vue     # Page portfolio
│   └── blog/
│       ├── index.vue     # Liste des articles
│       └── [...slug].vue # Page d'article
└── content/              # Contenu en Markdown
    └── blog/             # Articles de blog
```

## Ajouter un nouvel article

Créez un fichier Markdown dans `content/blog/` :

```markdown
---
title: "Titre de votre article"
description: "Description courte"
date: "2024-03-25"
tags: ["tag1", "tag2"]
readingTime: 5
---

# Votre contenu ici

Écrivez votre article en Markdown...
```

## Personnalisation

### Modifier les informations personnelles

- Éditez `pages/index.vue` pour la présentation
- Modifiez `pages/portfolio.vue` pour les projets
- Ajustez `components/Header.vue` et `components/Footer.vue` pour la navigation

### Changer les couleurs

Éditez `app.config.ts` :

```typescript
export default defineAppConfig({
  ui: {
    primary: 'blue', // Changez la couleur primaire
    gray: 'slate'
  }
})
```

## Déploiement

Ce projet peut être déployé sur :

- [Vercel](https://vercel.com/)
- [Netlify](https://www.netlify.com/)
- [Cloudflare Pages](https://pages.cloudflare.com/)
- [GitHub Pages](https://pages.github.com/)

## License

MIT
