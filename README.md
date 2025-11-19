# Thomas Dsantos - Blog & Portfolio

A modern personal blog and portfolio built with Nuxt 4, Nuxt UI and Nuxt Content.

## Tech Stack

- **[Nuxt 4](https://nuxt.com/)** - The Intuitive Vue Framework
- **[Nuxt UI](https://ui.nuxt.com/)** - Modern UI component library
- **[Nuxt Content](https://content.nuxt.com/)** - File-based content management
- **[Nuxt i18n](https://i18n.nuxtjs.org/)** - Internationalization for Nuxt
- **[Tailwind CSS](https://tailwindcss.com/)** - Utility-first CSS framework
- **[TypeScript](https://www.typescriptlang.org/)** - JavaScript with static typing

## Features

- 📝 Blog with Markdown articles
- 💼 Portfolio section
- 🌍 Multi-language support (French & English)
- 🎨 Modern and responsive design
- 🌙 Dark/Light mode
- 🔍 Article search
- 🏷️ Tag system
- ⚡ Optimal performance

## Installation

```bash
# Install dependencies
pnpm install

# Start development server
pnpm dev

# Build for production
pnpm build

# Preview production build
pnpm preview
```

## Project Structure

```
├── app.vue                 # Application entry point
├── app.config.ts          # Nuxt UI configuration
├── nuxt.config.ts         # Nuxt configuration
├── components/            # Reusable components
│   ├── Header.vue
│   ├── Footer.vue
│   └── LanguageSwitcher.vue
├── layouts/               # Application layouts
│   └── default.vue
├── pages/                 # Site pages
│   ├── index.vue         # Homepage
│   ├── portfolio.vue     # Portfolio page
│   └── blog/
│       ├── index.vue     # Article list
│       └── [...slug].vue # Article page
└── content/              # Markdown content
    ├── en/               # English content
    │   └── blog/
    └── fr/               # French content
        └── blog/
```

## Adding a New Article

Create a Markdown file in `content/{locale}/blog/`:

```markdown
---
title: "Your article title"
description: "Short description"
date: "2024-03-25"
tags: ["tag1", "tag2"]
readingTime: 5
---

# Your content here

Write your article in Markdown...
```

## Customization

### Update Personal Information

- Edit `pages/index.vue` for the presentation
- Modify `pages/portfolio.vue` for projects
- Adjust `components/Header.vue` and `components/Footer.vue` for navigation

### Change Colors

Edit `app.config.ts`:

```typescript
export default defineAppConfig({
  ui: {
    primary: 'blue', // Change primary color
    gray: 'slate'
  }
})
```

## Deployment

### Docker Stack (VPS)

```bash
# Build and deploy
make ship

# Or step by step
make build   # Build and push image
make deploy  # Deploy to VPS
```

See [CLAUDE.md](./CLAUDE.md) for detailed deployment documentation.

### Other Platforms

This project can also be deployed on:

- [Vercel](https://vercel.com/)
- [Netlify](https://www.netlify.com/)
- [Cloudflare Pages](https://pages.cloudflare.com/)

## License

MIT
