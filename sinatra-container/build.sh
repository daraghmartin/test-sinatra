#!/bin/bash

REPO_NAME="daraghmartin"
DOCKER_IMAGE_NAME="test-sinatra"
DEFAULT_TAG="latest"

if [ -d app ]; then
  echo "rm app dir"
  rm -rf app
fi

echo "copy in app"
cp -rf ../app .

echo "build image"
docker build -t $REPO_NAME/$DOCKER_IMAGE_NAME:$DEFAULT_TAG .

echo $REPO_NAME/$DOCKER_IMAGE_NAME:$DEFAULT_TAG

if [ -z "$1" ]; then
  echo "No tag argument supplied - will build default only"
else
  echo "tag ${DEFAULT_TAG} with ${1}"
  docker tag -f $REPO_NAME/$DOCKER_IMAGE_NAME:$DEFAULT_TAG $REPO_NAME/$DOCKER_IMAGE_NAME:$1
fi

docker build -t test-sinatra:latest .

rm -rf app
