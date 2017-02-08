#! /bin/bash
# More information here https://docs.docker.com/machine/drivers/aws/

MACHINE_NAME=$1

AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-ap-northeast-2}
AWS_INSTANCE_TYPE=${AWS_INSTANCE_TYPE:-t2.micro}
#AWS_SECURITY_GROUP=
#AWS_SSH_USER=

MACHINE_IMAGE=ami-a3915acd
if [ "$2" != "" ]; then
    MACHINE_IMAGE="$2"
fi

echo "----------------------------------------------"
echo "Creating instance with the following settings:"
echo "- Machine Name: $MACHINE_NAME"
echo "- Region: $AWS_DEFAULT_REGION"
echo "- Machine Type: $AWS_INSTANCE_TYPE"
echo "- Image: $MACHINE_IMAGE"
echo "----------------------------------------------"

docker-machine create \
--driver amazonec2 \
--amazonec2-region ${AWS_DEFAULT_REGION} \
--amazonec2-access-key ${AWS_ACCESS_KEY_ID} \
--amazonec2-secret-key ${AWS_SECRET_ACCESS_KEY} \
--amazonec2-ami "${MACHINE_IMAGE}" \
--amazonec2-instance-type ${AWS_INSTANCE_TYPE} \
${MACHINE_NAME}