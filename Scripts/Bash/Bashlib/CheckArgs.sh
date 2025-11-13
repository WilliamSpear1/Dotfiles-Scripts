#!/bin/bash

check_args() {
    local min_args=$1
    local number_of_args=$2

    if [ "$number_of_args" -lt "$min_args" ]; then
        echo "Error: Needed ${min_args} Argument, Provided ${number_of_args}." >&2
        return 1
    fi
}
