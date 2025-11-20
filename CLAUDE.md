# dsantos-blog - Technical Documentation

## 📋 Overview

Personal blog and portfolio built with **Nuxt 4**, **@nuxt/content** and **@nuxt/ui**.
Deployed on VPS via Docker Stack and Traefik for SSL/reverse proxy management.

## 🏗️ Architecture

### Tech Stack

- **Framework**: Nuxt 4 (RC 13)
- **UI**: @nuxt/ui (v3 alpha)
- **Content**: @nuxt/content (markdown content management)
- **Styling**: TailwindCSS
- **Internationalization**: @nuxtjs/i18n (French & English)
- **Runtime**: Node.js 20
- **Package Manager**: pnpm 9.0.0

### Project Structure

Uses Nuxt 4's new `app/` directory structure:

```
dsantos-blog/
├── app/                # Application directory (Nuxt 4)
│   ├── app.vue         # Root application component
│   ├── assets/         # Static assets (CSS, images, etc.)
│   ├── components/     # Reusable Vue components
│   ├── layouts/        # Nuxt layouts
│   └── pages/          # Application pages
├── content/            # Markdown content (articles, projects)
│   ├── en/             # English content
│   └── fr/             # French content
├── Dockerfile          # Production Docker image
├── stack.yaml          # Docker Stack configuration (production)
├── stack-next.yaml     # Docker Stack configuration (next environment)
├── Makefile            # Build and deployment commands
└── nuxt.config.ts      # Nuxt configuration
```

## 🚀 Deployment

### Prerequisites

- Docker with BuildKit enabled
- Access to GHCR (GitHub Container Registry)
- Docker context `vps` configured
- Traefik network (`traefik-public`) running on VPS

### Available Commands

```bash
# Show help
make help

# Build and push Docker image
make build

# Deploy to VPS
make deploy

# Build + Deploy (full pipeline)
make ship

# View logs
make logs

# Check status
make status

# Stop application
make down

# Clean Docker cache
make clean
```

### Environments

The project supports two deployment environments:

#### Production (`blog.dsantos.fr`)
- **Stack file**: `stack.yaml`
- **Deploy**: `make deploy` or `make ship`
- **Logs**: `make logs`
- **Status**: `make status`
- **Remove**: `make down`

#### Next (`next.blog.dsantos.fr`)
- **Stack file**: `stack-next.yaml`
- **Deploy**: `make deploy-next` or `make ship-next`
- **Logs**: `make logs-next`
- **Status**: `make status-next`
- **Remove**: `make down-next`

Both environments share the same Docker image from GHCR and run on the same VPS with different domains.

### Domain Configuration

Domains are configured in the respective stack files:

**Production** (`stack.yaml`):
```yaml
- traefik.http.routers.dsantos-blog.rule=Host(`blog.dsantos.fr`)
```

**Next** (`stack-next.yaml`):
```yaml
- traefik.http.routers.dsantos-blog-next.rule=Host(`next.blog.dsantos.fr`)
```

To change a domain, modify the corresponding line in the stack file.

## 🔧 Traefik Configuration

The application uses Traefik as reverse proxy with:

- **Internal Port**: 3000 (Nuxt)
- **Entrypoint**: websecure (HTTPS)
- **Cert Resolver**: myresolver (Let's Encrypt)
- **Network**: traefik-public

## 🌍 Internationalization

The site supports French and English:

- Language switcher component with country flags
- Content organized by language in `content/{locale}/`
- Automatic locale detection based on browser preferences
- SEO-friendly URLs with locale prefix

## 📝 Local Development

```bash
# Install dependencies
pnpm install

# Start dev server
pnpm dev

# Build locally
pnpm build

# Preview build
pnpm preview
```

## 🔐 GitHub Registry

Docker images are stored on GHCR:

- **Registry**: `ghcr.io/thomasdsantos/dsantos-blog`
- **Tag**: `latest`

To authenticate:

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
```

## 🐳 Docker

### Manual Build

```bash
docker build -t ghcr.io/thomasdsantos/dsantos-blog:latest .
docker push ghcr.io/thomasdsantos/dsantos-blog:latest
```

### Multi-stage Build

The Dockerfile uses a multi-stage approach to optimize size:

1. **Builder**: Install dependencies and build Nuxt
2. **Production**: Lightweight image with only necessary files

## 📦 Environment Variables

Variables configured in `stack.yaml`:

- `NODE_ENV=production`

## 🔄 Updates

To update the application:

**Production**:
```bash
make ship
```

**Next**:
```bash
make ship-next
```

These commands:

1. Build the new image
2. Push to GHCR
3. Deploy to VPS
4. Docker performs a rolling update (start-first)

## 🛠️ Troubleshooting

### Logs not showing

**Production**:
```bash
docker context use vps
docker service ls
docker service logs dsantos-blog_blog
docker context use default
```

**Next**:
```bash
docker context use vps
docker service ls
docker service logs dsantos-blog-next_blog-next
docker context use default
```

### Image build fails

Check that BuildKit is enabled:

```bash
export DOCKER_BUILDKIT=1
```

### VPS connection error

Check Docker context:

```bash
docker context ls
docker context use vps
```

## 📚 Resources

- [Nuxt 4 Documentation](https://nuxt.com)
- [Nuxt Content](https://content.nuxt.com)
- [Nuxt i18n](https://i18n.nuxtjs.org)
- [Docker Stack Deploy](https://docs.docker.com/engine/reference/commandline/stack_deploy/)
- [Traefik Documentation](https://doc.traefik.io/traefik/)

Always use context7 when I need code generation, setup or configuration steps, or
library/API documentation. This means you should automatically use the Context7 MCP
tools to resolve library id and get library docs without me having to explicitly ask.
