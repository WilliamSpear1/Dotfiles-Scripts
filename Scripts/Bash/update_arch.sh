#!/bin/sh
# A bash script for updating and upgrading tool ################################

##########################
#       Variables        #
##########################
log="/home/wilabeast/Logs/update.logs"
time="$(date +"[%Y-%m-%d %H:%M:%S]")"

##########################
#       functions        #
##########################
update(){
    yes | sudo pacman -Sy >> $log
    yes | sudo pacman -Suy >> $log
    yes | sudo pacman -Sc >> $log
}

##########################
#       main             #
##########################
echo "$time:Starting update and upgrade of packages" >> $log 
update
echo "$time:Finished update and upgrade of packages" >> $log 
