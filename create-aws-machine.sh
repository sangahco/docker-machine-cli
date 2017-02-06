#! /bin/bash
# More information here https://docs.docker.com/machine/drivers/aws/

export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export MACHINE_NAME=$3

export AWS_DEFAULT_REGION=ap-northeast-2
#export AWS_SECURITY_GROUP=
export AWS_INSTANCE_TYPE=t2.micro
#export AWS_SSH_USER=

docker-machine create --driver amazonec2 --amazonec2-access-key ${AWS_ACCESS_KEY_ID} --amazonec2-secret-key ${AWS_SECRET_ACCESS_KEY} ${MACHINE_NAME}