#!/usr/bin/env sh

docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
docker ps --filter status=dead --filter status=exited --filter status=created  -aq | xargs docker rm -v
docker volume rm $(docker volume ls -q)

# remove all images
docker rmi -f $(docker images | awk "{print \$3}")