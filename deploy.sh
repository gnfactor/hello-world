#!/usr/bin/env bash
echo "______________________________________________________________________"
echo "Started:["$0"]:  $(date)"
echo "______________________________________________________________________"

export CI_PROJECT_DIR=$1
export IMAGE_NAME=$2
export IMAGE_TAG_NEW=$3
export CONTAINER_NAME_PREFIX="$IMAGE_NAME"
export CONTAINER_NAME="$CONTAINER_NAME_PREFIX-$IMAGE_TAG_NEW"
  


echo "INFO: Project DIR:[$CI_PROJECT_DIR]"
echo && echo "INFO: START BUILDING IMAGE:[$IMAGE_NAME:$IMAGE_TAG_NEW]" && echo
ls -hasl

docker images
docker build -t "$IMAGE_NAME:$IMAGE_TAG_NEW" .
docker images


echo "______________________________________________________________________"
echo "Finished:["$0"]: $(date)"
echo "______________________________________________________________________"


