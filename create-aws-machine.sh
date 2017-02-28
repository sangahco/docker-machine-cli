#! /bin/bash
# More information here https://docs.docker.com/machine/drivers/aws/

usage() {
echo "Usage:  $(basename "$0") NAME [AMI] [TYPE]"
echo
echo "NAME          The name to give to the instance"
echo "AMI           The AMI image to clone"
echo "TYPE          The type of instance: t2.micro, t2.small, t2.medium, t2.large"
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

MACHINE_NAME=$1
if [ "$1" == "" ]; then
    echo "You need to provide a name for the machine (no space, keep simple)"
    exit 1
fi

MACHINE_IMAGE=${MACHINE_IMAGE:-ami-09ad7d67}
if [ "$2" != "" ]; then
    MACHINE_IMAGE="$2"
fi

AWS_INSTANCE_TYPE=${AWS_INSTANCE_TYPE:-t2.micro}
if [ "$3" != "" ]; then
    AWS_INSTANCE_TYPE="$3"
fi

AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-ap-northeast-2}

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