# Node + Angular Dev Image

This template builds a reusable dev container that bundles the .NET SDK with Node and the Angular CLI.

- Images are published as `ghcr.io/<owner>/fullstack-dev:dotnet<DOTNET>-node<NODE>-ng<ANGULAR>` (example: `fullstack-dev:dotnet10-node24-ng21`).
- The defaults build .NET 10.0, Node 24, Angular CLI 21, but everything is configurable.

## GitHub Actions Build

The workflow at `.github/workflows/build-node-angular.yml` builds and publishes the image on every push touching the Docker context (and is also manually runnable via **workflow dispatch**).

1. Update the `env` block at the top of the workflow to change versions, registry, or supported platforms.
2. Kick off the workflow from the Actions tab or push a change to rebuild.
3. The workflow tags both `dotnet<major-dotnet>-node<NODE_VERSION>-ng<ANGULAR_VERSION>` (using the DOTNET major version) and `latest`.

Guide comments at the top of the workflow point to where variables live so you can tweak them quickly.

## Optional local build

If you still want to build locally for quick testing, run:

```bash
./build-push-dev-full.sh 10.0 24 21
```

The script mirrors the GitHub Actions workflow by tagging the image as `fullstack-dev:dotnet10-node24-ng21` and `fullstack-dev:latest`.
