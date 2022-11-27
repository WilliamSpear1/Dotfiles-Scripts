#!/bin/sh
# A Script for a slideshows using the feh background tool ######################

##########################
#       Variables        #
##########################
directory=/home/wilabeast/.SexyWallpapers
log="/home/wilabeast/Logs/slideshow.logs"
time="$(date +"[%Y-%m-%d %H:%M:%S]")"

##########################
#       functions        #
##########################
wallpaper_display(){
    echo "$time:Starting the wallpapaer_display function" >> $log 
    feh --randomize --recursive --no-fehbg --bg-fill $directory
    echo "$time:Ending of the wallpaper_display function" >> $log 
}

check_i3(){
    if  pgrep -x "i3" > /dev/null 
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
    echo "$time:i3wm not running ending script..." >> $log 
    exit 0
else
    wallpaper_display
    echo "$time:ending slideshow.sh script..." >> $log 
fi
