#!/bin/sh

docker_tag() {
    docker tag $image_name $REGISTRY/$image_name
    echo --------------------
    echo Docker Image has been tagged.
    echo --------------------
}

image_name=$1

echo --------------------
echo Image Name: $image_name
echo --------------------
echo Docker Registry: $REGISTRY
echo --------------------

docker_tag $image_name
