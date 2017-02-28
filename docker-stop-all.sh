#!/usr/bin/env sh

docker stop $(docker ps --format {{.ID}})