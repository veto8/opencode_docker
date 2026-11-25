#!/bin/sh
# id: 3
# group: CONTAINER
# desc: Status - this project's containers

docker ps -a --filter "name=opencode_"
