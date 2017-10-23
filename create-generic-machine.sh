#!/usr/bin/env bash

SSH_KEY=$1
SSH_USER=$4
HOST_IP=$2
HOST_NAME=$3

docker-machine create --driver generic \
--generic-ip-address=${HOST_IP} \
--generic-ssh-key ${SSH_KEY} \
--generic-ssh-user=${SSH_USER:-sangah} \
${HOST_NAME}