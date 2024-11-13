#!/bin/bash

NETWORK_NAME="traefik-proxy"

# Check if the network already exists
if ! docker network ls --format '{{.Name}}' | grep -wq "$NETWORK_NAME"; then
  echo "Creating external network: $NETWORK_NAME"
  docker network create "$NETWORK_NAME"
else
  echo "Network $NETWORK_NAME already exists"
fi

# Deploy with Docker Compose
docker compose up -d --force-recreate