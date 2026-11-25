#!/bin/sh
# id: 2
# group: CONTAINER
# desc: Run - ask which folder to share

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
. "$SCRIPT_DIR/lib.sh"

printf "  Folder to share with the container (enter for none): "
read -r share

case "$share" in
  '~') share=$HOME ;;
  '~/'*) share="$HOME/${share#'~/'}" ;;
esac

if [ -n "$share" ] && [ ! -d "$share" ]; then
  printf "  FAIL: no such folder: %s\n" "$share"
  exit 1
fi

set -- run -it --privileged --name "$NAME"
if [ -n "$share" ]; then
  set -- "$@" -v "$share:/workspace" -w /workspace
  printf "  sharing %s -> /workspace\n" "$share"
fi

docker "$@" "$IMAGE" bash
