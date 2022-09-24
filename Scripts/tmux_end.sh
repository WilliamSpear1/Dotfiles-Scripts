#!/bin/bash
EndTmux(){
    tmux kill-session -t $1 
}

# file/session name
EndTmux "$1"
tls
