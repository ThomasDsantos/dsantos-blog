# Variables
REGISTRY := ghcr.io/thomasdsantos/dsantos-blog
IMAGE := $(REGISTRY):latest
STACK_NAME := dsantos-blog
STACK_FILE := stack.yaml
STACK_NAME_NEXT := dsantos-blog-next
STACK_FILE_NEXT := stack-next.yaml
DOCKER_CONTEXT := vps
PLATFORM := linux/amd64

.PHONY: help build deploy ship logs status down clean deploy-next ship-next logs-next status-next down-next

# Default target - show help
help:
	@echo "dsantos-blog Project - Available targets:"
	@echo ""
	@echo "Production:"
	@echo "  make build          - Build and push Docker image"
	@echo "  make deploy         - Deploy stack to VPS (requires image to be built)"
	@echo "  make ship           - Build and deploy (full pipeline)"
	@echo "  make logs           - View logs from deployed services"
	@echo "  make status         - Show stack status on VPS"
	@echo "  make down           - Remove the stack from VPS"
	@echo ""
	@echo "Next (next.blog.dsantos.fr):"
	@echo "  make deploy-next    - Deploy next stack to VPS"
	@echo "  make ship-next      - Build and deploy next (full pipeline)"
	@echo "  make logs-next      - View logs from next services"
	@echo "  make status-next    - Show next stack status on VPS"
	@echo "  make down-next      - Remove the next stack from VPS"
	@echo ""
	@echo "Utils:"
	@echo "  make clean          - Remove local Docker build cache"
	@echo ""

build:
	@echo "Building blog application..."
	DOCKER_BUILDKIT=1 docker build --platform $(PLATFORM) --push -t $(IMAGE) .
	@echo "✓ Image built and pushed successfully"

deploy:
	@echo "Deploying to VPS..."
	docker context use $(DOCKER_CONTEXT) && \
	docker stack deploy --detach=true -c $(STACK_FILE) $(STACK_NAME) --with-registry-auth && \
	docker context use default || (docker context use default && exit 1)
	@echo "✓ Deployment complete"

ship: build deploy
	@echo "✓ Full pipeline complete - built and deployed"

logs:
	@docker context use $(DOCKER_CONTEXT) && \
	docker service logs -f $(STACK_NAME)_blog && \
	docker context use default || (docker context use default && exit 1)

status:
	@docker context use $(DOCKER_CONTEXT) && \
	docker stack ps $(STACK_NAME) && \
	docker context use default || (docker context use default && exit 1)

down:
	@echo "Removing stack from VPS..."
	@docker context use $(DOCKER_CONTEXT) && \
	docker stack rm $(STACK_NAME) && \
	docker context use default || (docker context use default && exit 1)
	@echo "✓ Stack removed"

clean:
	@echo "Cleaning Docker build cache..."
	docker builder prune -f
	@echo "✓ Build cache cleaned"

# Next environment targets
deploy-next:
	@echo "Deploying next to VPS (next.blog.dsantos.fr)..."
	docker context use $(DOCKER_CONTEXT) && \
	docker stack deploy --detach=true -c $(STACK_FILE_NEXT) $(STACK_NAME_NEXT) --with-registry-auth && \
	docker context use default || (docker context use default && exit 1)
	@echo "✓ Next deployment complete"

ship-next: build deploy-next
	@echo "✓ Full next pipeline complete - built and deployed"

logs-next:
	@docker context use $(DOCKER_CONTEXT) && \
	docker service logs -f $(STACK_NAME_NEXT)_blog-next && \
	docker context use default || (docker context use default && exit 1)

status-next:
	@docker context use $(DOCKER_CONTEXT) && \
	docker stack ps $(STACK_NAME_NEXT) && \
	docker context use default || (docker context use default && exit 1)

down-next:
	@echo "Removing next stack from VPS..."
	@docker context use $(DOCKER_CONTEXT) && \
	docker stack rm $(STACK_NAME_NEXT) && \
	docker context use default || (docker context use default && exit 1)
	@echo "✓ Next stack removed"
