#!/bin/sh

export HANDLER="lib/index.ts"
export BUILD_DIR="$(mktemp -d)"

npx esbuild \
  --log-level=error \
  --bundle \
  --outfile="$BUILD_DIR/index.js" \
  --metafile="$BUILD_DIR/metafile.json" \
  --tsconfig="tsconfig.json" \
  --sourcemap=inline \
  --sources-content=false \
  --platform=node \
  "$HANDLER"

stat -f %z "$BUILD_DIR"/index.js

npx esbuild \
  --log-level=error \
  --bundle \
  --outfile="$BUILD_DIR/index.js" \
  --metafile="$BUILD_DIR/metafile.json" \
  --tsconfig="tsconfig.paths.json" \
  --sourcemap=inline \
  --sources-content=false \
  --platform=node \
  "$HANDLER"

stat -f %z "$BUILD_DIR"/index.js