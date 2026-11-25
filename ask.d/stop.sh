#!/bin/sh
# id: 4
# group: CONTAINER
# desc: Stop - container

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
. "$SCRIPT_DIR/lib.sh"

if docker stop "$NAME"; then
  printf "  ok: stopped %s\n" "$NAME"
else
  printf "  FAIL: stop\n"
  exit 1
fi
