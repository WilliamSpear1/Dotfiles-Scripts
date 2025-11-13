#!/bin/sh
source /home/wilabeast/Scripts/Bash/VideoQuality.sh $1 | grep -E '480|360|240|144' >> deletelist.txt
