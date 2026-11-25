#!/bin/sh
# id: 1
# group: BUILD
# desc: Build image

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
. "$SCRIPT_DIR/lib.sh"

if DOCKER_BUILDKIT=0 docker build -t "$IMAGE" "$ROOT"; then
  printf "  ok: built %s\n" "$IMAGE"
else
  printf "  FAIL: build\n"
  exit 1
fi
