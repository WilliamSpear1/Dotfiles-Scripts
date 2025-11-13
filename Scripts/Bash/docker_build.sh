#!/bin/bash

# Method
docker_build() {
    docker build -t $REGISTRY/$image_name .
}

print_out() {
    #Print out of variables
    echo ----------------------------------
    echo Image Name: $image_name
    echo ----------------------------------
    echo Docker Registry: $REGISTRY
    echo ----------------------------------
}
# Variable Assignment
image_name=$1

# Method Call
print_out
docker_build $image_name
