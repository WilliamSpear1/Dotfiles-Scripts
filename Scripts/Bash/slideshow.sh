#!/bin/sh
# A Script for a slideshows using the feh background tool ######################
##########################
#       Variables        #
##########################
#directory=/home/wilabeast/.SexyWallpapers
directory=/home/wilabeast/Wallpapers
log=/var/log/slideshow.log
time=$(date +[%Y-%m-%d %H:%M:%S])

##########################
#       functions        #
##########################
wallpaper_display(){
     feh --randomize --recursive --no-fehbg --bg-fill $directory
}

check_i3(){
    if  pgrep -x i3 > /dev/null 
    then  
        return 1
    else
        return 0
    fi
}

##########################
#       main             #
##########################
check_i3 
if [ $? -eq 0 ]; then
    echo $time:i3wm not running ending script... >> $log 
    exit 0
else
    while true; do
        wallpaper_display
        sleep 30m
    done
fi
