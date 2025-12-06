#!/bin/bash
# build-push-dev-full.sh
# -----------------------------
# Build & push full dev image:
#   .NET SDK + Node + Angular CLI
#
# Usage:
#   ./build-push-dev-full.sh [dotnet_version] [node_version] [angular_version]
#
# Example:
#   ./build-push-dev-full.sh 10.0 24 20
# -----------------------------

set -euo pipefail
cd "$(dirname "$0")"

DOTNET_VERSION="${1:-10.0}"
NODE_VERSION="${2:-24}"
ANGULAR_VERSION="${3:-20}"

IMAGE="ghcr.io/hallboard-team/dev-full-dotnet-v${DOTNET_VERSION}_node-v${NODE_VERSION}_angular-v${ANGULAR_VERSION}:latest"

echo "🏗️  Building dev image: ${IMAGE}"

podman build \
  -t "$IMAGE" \
  --build-arg DOTNET_VERSION="$DOTNET_VERSION" \
  --build-arg NODE_VERSION="$NODE_VERSION" \
  --build-arg ANGULAR_VERSION="$ANGULAR_VERSION" \
  -f Dockerfile.dev .

echo "📤 Pushing $IMAGE to GHCR..."
podman push "$IMAGE"

echo "✅ Done."
