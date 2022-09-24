#!/bin/bash

# 2>/dev/null .
# 2 is the file descriptor of stderr and this redirects it to /dev/null.
# Basically suppressing out error messages.

CreateTmux(){
    tmux new-session -s $1 
}

CheckSession(){
    # We can check $? for the exit status (zero for success, non-zero for failure).
    tmux has-session -t $1 2>/dev/null 
    
    # $? used to get the exit status of the previous command.
    if [ $? == 0 ]; then
        tmux attach-session -t $1 
    else
        CreateTmux "$1"
    fi
}

# Check if session is already up.
CheckSession "$1"
