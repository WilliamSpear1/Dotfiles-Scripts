#!/bin/sh
# A bash script for updating and upgrading tool ########################################################
# Variables ############################################################################################
log="/home/wilabeast/Logs/update.logs"
time="$(date +"[%Y-%m-%d %H:%M:%S]")"

echo "$time:Starting update and upgrade of packages\n" >> $log 
yes | sudo pacman -Syyu >> $log
yes | sudo pacman -Suy >> $log
yes | sudo pacman -Sc >> $log
echo "$time:Finished update and upgrade of packages\n" >> $log 
