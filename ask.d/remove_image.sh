#!/bin/sh
# id: 7
# group: IMAGE
# desc: Remove image

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
. "$SCRIPT_DIR/lib.sh"

if docker rmi "$IMAGE"; then
  printf "  ok: removed %s\n" "$IMAGE"
else
  printf "  FAIL: remove\n"
  exit 1
fi
