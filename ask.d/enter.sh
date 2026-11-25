#!/bin/sh
# id: 5
# group: CONTAINER
# desc: Enter - shell into container

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
. "$SCRIPT_DIR/lib.sh"

docker exec -it "$NAME" bash
