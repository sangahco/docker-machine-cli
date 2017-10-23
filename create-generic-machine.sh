#!/usr/bin/env bash

usage(){
	echo "Usage:  $(basename "$0") [SSH_KEY] [HOST_IP] [HOST_NAME] [SSH_USER(default:sangah)]"
    echo
    echo "SSH_KEY          The key to use for ssh connection"
    echo "SSH_USER         The user to use for ssh connection"
    echo "HOST_IP          The host ip"
    echo "HOST_NAME        A name to identify the host and use with docker-machine ssh [host name]"
	exit 1
}
 
[[ $# -lt 3 ]] && usage

SSH_KEY=$1
SSH_USER=$4
HOST_IP=$2
HOST_NAME=$3

docker-machine create --driver generic \
--generic-ip-address=${HOST_IP} \
--generic-ssh-key ${SSH_KEY} \
--generic-ssh-user=${SSH_USER:-sangah} \
${HOST_NAME}