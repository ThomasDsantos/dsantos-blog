# dsantos-blog - Documentation technique

## 📋 Vue d'ensemble

Blog et portfolio personnel construit avec **Nuxt 4**, **@nuxt/content** et **@nuxt/ui**.
Déployé sur VPS via Docker Stack et Traefik pour la gestion SSL/reverse proxy.

## 🏗️ Architecture

### Stack technique
- **Framework**: Nuxt 4 (RC 13)
- **UI**: @nuxt/ui (v3 alpha)
- **Content**: @nuxt/content (gestion du contenu markdown)
- **Styling**: TailwindCSS
- **Runtime**: Node.js 20
- **Package Manager**: pnpm 9.0.0

### Structure du projet
```
dsantos-blog/
├── components/          # Composants Vue réutilisables
├── content/            # Contenu markdown (articles, projets)
├── layouts/            # Layouts Nuxt
├── pages/              # Pages de l'application
├── Dockerfile          # Image Docker de production
├── stack.yaml          # Configuration Docker Stack
├── Makefile            # Commandes de build et déploiement
└── nuxt.config.ts      # Configuration Nuxt
```

## 🚀 Déploiement

### Prérequis
- Docker avec BuildKit activé
- Accès au registry GHCR (GitHub Container Registry)
- Docker context `vps` configuré
- Réseau Traefik (`traefik-public`) actif sur le VPS

### Commandes disponibles

```bash
# Afficher l'aide
make help

# Build et push l'image Docker
make build

# Déployer sur le VPS
make deploy

# Build + Deploy (pipeline complète)
make ship

# Voir les logs
make logs

# Vérifier le status
make status

# Arrêter l'application
make down

# Nettoyer le cache Docker
make clean
```

### Configuration du domaine

Le domaine est configuré dans `stack.yaml` :
```yaml
- "traefik.http.routers.dsantos-blog.rule=Host(`blog.dsantos.fr`)"
```

Pour changer le domaine, modifier cette ligne dans `stack.yaml`.

## 🔧 Configuration Traefik

L'application utilise Traefik comme reverse proxy avec :
- **Port interne**: 3000 (Nuxt)
- **Entrypoint**: websecure (HTTPS)
- **Cert Resolver**: myresolver (Let's Encrypt)
- **Réseau**: traefik-public

## 📝 Développement local

```bash
# Installer les dépendances
pnpm install

# Lancer le serveur de dev
pnpm dev

# Build en local
pnpm build

# Preview de la build
pnpm preview
```

## 🔐 Registry GitHub

Les images Docker sont stockées sur GHCR :
- **Registry**: `ghcr.io/thomasdsantos/dsantos-blog`
- **Tag**: `latest`

Pour s'authentifier :
```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
```

## 🐳 Docker

### Build manuel
```bash
docker build -t ghcr.io/thomasdsantos/dsantos-blog:latest .
docker push ghcr.io/thomasdsantos/dsantos-blog:latest
```

### Multi-stage build
Le Dockerfile utilise une approche multi-stage pour optimiser la taille :
1. **Builder**: Installation des dépendances et build Nuxt
2. **Production**: Image légère avec seulement les fichiers nécessaires

## 📦 Variables d'environnement

Variables configurées dans `stack.yaml` :
- `NODE_ENV=production`

## 🔄 Mise à jour

Pour mettre à jour l'application en production :
```bash
make ship
```

Cette commande :
1. Build la nouvelle image
2. Push vers GHCR
3. Déploie sur le VPS
4. Docker effectue un rolling update (start-first)

## 🛠️ Troubleshooting

### Les logs ne s'affichent pas
```bash
docker context use vps
docker service ls
docker service logs dsantos-blog_blog
docker context use default
```

### L'image ne se build pas
Vérifier que BuildKit est activé :
```bash
export DOCKER_BUILDKIT=1
```

### Erreur de connexion au VPS
Vérifier le context Docker :
```bash
docker context ls
docker context use vps
```

## 📚 Ressources

- [Nuxt 4 Documentation](https://nuxt.com)
- [Nuxt Content](https://content.nuxt.com)
- [Docker Stack Deploy](https://docs.docker.com/engine/reference/commandline/stack_deploy/)
- [Traefik Documentation](https://doc.traefik.io/traefik/)
