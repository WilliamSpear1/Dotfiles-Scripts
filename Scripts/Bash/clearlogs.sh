#!/bin/sh
# Clear out the Logs of the system. ############################################

##########################
#       Variables        #
##########################
log="/home/wilabeast/Logs/clear_files.logs"
time="$(date +"[%Y-%m-%d %H:%M:%S]")"

##########################
#       functions        #
##########################
clear_files(){
    echo "$time:Clearing out RenameFiles.logs" >> $log
    true > /home/wilabeast/Logs/RenameFiles.logs 
    echo "$time:Clearing out ImageDetection.logs" >> $log
    true > /home/wilabeast/Logs/ImageDetection.logs 
    echo "$time:Clearing out update.logs" >> $log
    true > /home/wilabeast/Logs/update.logs 
    echo "$time:Clearing out DateFiles.logs" >> $log
    true > /home/wilabeast/Logs/DateFiles.logs 
    echo "$time:Clearing out RenameFiles.logs" >> $log
}

##########################
#       main             #
##########################
echo "$time:Starting the process of clearing out files...." >> $log
clear_files
echo "$time:All files cleared out. Process finished" >> $log
