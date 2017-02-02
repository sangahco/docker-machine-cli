#! /bin/bash

export SSH_KEY=$1
export HOST_IP=$2
export HOST_NAME=$3

docker-machine create --driver generic \
--generic-ip-address=${HOST_IP} \
--generic-ssh-key ${SSH_KEY} \
--generic-ssh-user=sangah \
dev-${HOST_NAME}