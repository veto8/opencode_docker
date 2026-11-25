#!/bin/sh
# id: 6
# group: CONTAINER
# desc: Remove container

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
. "$SCRIPT_DIR/lib.sh"

if docker rm -f "$NAME"; then
  printf "  ok: removed %s\n" "$NAME"
else
  printf "  FAIL: remove\n"
  exit 1
fi
