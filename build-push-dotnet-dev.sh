#!/bin/bash
# -----------------------------
# Build & Start Podman Compose for .NET dev environment (shared stack)
# Usage:
#   ./pull-build-start-dev.sh [dotnet_version]
# Example:
#   ./build-push-dotnet-dev.sh 9.0
# -----------------------------
#!/bin/bash

set -euo pipefail
cd "$(dirname "$0")"

DOTNET_VERSION="${1:-9.0}"
IMAGE="ghcr.io/hallboard-team/dotnet-v${DOTNET_VERSION}:latest"

podman build \
  -t "$IMAGE" \
  --build-arg DOTNET_VERSION="$DOTNET_VERSION" \
  -f Dockerfile.dev .

podman push "$IMAGE"
