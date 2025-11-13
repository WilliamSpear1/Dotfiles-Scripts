#!/bin/sh
log=/home/wilabeast/Logs/update.logs
time=$(date +[%Y-%m-%d %H:%M:%S])

echo $time: Starting the update and upgrade maintaince... >> $log
apt-get update     >> $log
apt-get upgrade    >> $log
apt-get autoremove >> $log
apt-get autoclean  >> $log
echo $time: Stopping the update and upgrade maintaince... >> $log
