#!/usr/bin/env bash

docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
docker ps --filter status=dead --filter status=exited -aq | xargs docker rm -v
docker volume rm $(docker volume ls -q)