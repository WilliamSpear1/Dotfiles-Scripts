#!/bin/sh
# A bash script for updating and upgrading tool ################################

##########################
#       Variables        #
##########################
log=/var/log/Scripts/update.log
time=$(date +[%Y-%m-%d %H:%M:%S])

##########################
#       functions        #
##########################
update(){
    yes | sudo pacman -Sy >> $log
    yes | sudo pacman -Syu >> $log
    yes | sudo pacman -Sc >> $log
    yes | yay -Syu >> $log
}

##########################
#       main             #
##########################
echo $time:Starting update and upgrade of packages >> $log 
update
echo $time:Finished update and upgrade of packages >> $log 
