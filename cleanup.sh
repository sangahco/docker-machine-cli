#!/usr/bin/env sh

DOCKER_HOME=/var/lib/docker

docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
docker ps --filter status=dead --filter status=exited --filter status=created  -aq | xargs docker rm -v
docker volume rm $(docker volume ls -q)

# remove all images
docker rmi -f $(docker images | awk "{print \$3}")

# remove all networks
docker network rm $(docker network ls --format {{.ID}})

# truncate all docker logs
truncate -s 0 $DOCKER_HOME/containers/*/*-json.log