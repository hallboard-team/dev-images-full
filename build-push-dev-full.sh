#!/bin/bash
# build-push-dev-full.sh
# -----------------------------
# Build & push dev image (Node + Angular CLI on .NET SDK base)
#
# Usage:
#   ./build-push-dev-full.sh [dotnet_version] [node_version] [angular_version]
#
# Example:
#   ./build-push-dev-full.sh 10.0 24 21
# -----------------------------

set -euo pipefail
cd "$(dirname "$0")"

DOTNET_VERSION="${1:-10.0}"
NODE_VERSION="${2:-24}"
ANGULAR_VERSION="${3:-21}"

IMAGE_REPO="ghcr.io/hallboard-team/fullstack-dev"
DOTNET_MAJOR="${DOTNET_VERSION%%.*}"
VERSION_TAG="dotnet${DOTNET_MAJOR}-node${NODE_VERSION}-ng${ANGULAR_VERSION}"
IMAGE="${IMAGE_REPO}:${VERSION_TAG}"

echo "🏗️  Building dev image: ${IMAGE}"

docker build \
  -t "$IMAGE" \
  --build-arg DOTNET_VERSION="$DOTNET_VERSION" \
  --build-arg NODE_VERSION="$NODE_VERSION" \
  --build-arg ANGULAR_VERSION="$ANGULAR_VERSION" \
  -f Dockerfile.dev .

echo "📤 Pushing $IMAGE to GHCR..."
docker push "$IMAGE"

echo "✅ Done."
