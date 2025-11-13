#!/bin/sh
docker_pull() {
    docker pull $REGISTRY/$image_name
}

image_name=$1

echo --------------------
echo Image Name: $image_name
echo --------------------
echo Registry: $REGISTRY
echo --------------------
