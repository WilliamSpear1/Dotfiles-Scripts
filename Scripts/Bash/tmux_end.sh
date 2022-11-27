#!/bin/bash

##########################
#       functions        #
##########################
EndTmux(){
    tmux kill-session -t $1 
}

##########################
#       main             #
##########################
# file/session name
EndTmux "$1"
tls
