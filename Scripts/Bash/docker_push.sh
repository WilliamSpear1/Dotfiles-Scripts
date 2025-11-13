#!/bin/sh

docker_push() {
    docker push $REGISTRY/$image_name
    echo -------------
    echo Docker Image Pushed.
    echo -------------
}

image_name=$1

echo -------------
echo Registry: $REGISTRY
echo -------------
echo Image Name: $image_name
echo -------------

docker_push $image_name
