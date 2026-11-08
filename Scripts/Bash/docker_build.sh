#!/bin/bash

# Method
DockerBuild() {
    docker build -t $REGISTRY/$image_name .
}

PrintOut() {
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
PrintOut
DockerBuild $image_name
