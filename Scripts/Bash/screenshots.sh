#!/bin/bash
log=/home/wilabeast/Logs/ScreenShots.logs
time=$(date +[%Y-%m-%d %H:%M:%S])

echo $time:Taking ScreenShots for System >> $log 
flameshot screen -p /home/wilabeast/Pictures/ScreenShots >> $log
echo $time:ScreenShot taken for System >> $log 

