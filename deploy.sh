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
echo "--------------------------------------------------------------"
ls -hasl
echo "--------------------------------------------------------------"
docker images
echo "--------------------------------------------------------------"

echo "INFO - REMOVING existing container $CONTAINER_NAME_PREFIX"
docker ps | grep -w $CONTAINER_NAME_PREFIX | awk '{print $1}' | xargs docker rm -f &>/dev/null | sleep 0

echo "INFO - REMOVING existing images $IMAGE_NAME"
docker rmi $(docker images | grep -w $IMAGE_NAME | awk '{print $3}') &>/dev/null | sleep 0

echo "INFO: START BUILDING IMAGE:[$IMAGE_NAME:$IMAGE_TAG_NEW]" && echo
docker build -t $IMAGE_NAME:$IMAGE_TAG_NEW .

echo "--------------------------------------------------------------"
docker images
echo "--------------------------------------------------------------"

echo "INFO - RUN the new container $CONTAINER_NAME" 
docker run -d -p 8085:8080 --name "$CONTAINER_NAME" "$IMAGE_NAME:$IMAGE_TAG_NEW"

echo "--------------------------------------------------------------"
docker ps


echo "______________________________________________________________________"
echo "Finished:["$0"]: $(date)"
echo "______________________________________________________________________"


