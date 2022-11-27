#!/bin/sh
CopyOver() {
    echo "Copying $wallpaper Over..."
    cp -r ~/Wallpapers/$wallpaper ~/Mountain-Wallpapers/$wallpaper
    echo "Finished Copying"
}

i=1
# $@ represents as the array of all the parameters 
wallpapers=$(cat $1)

for wallpaper in $wallpapers
do
    CopyOver $wallpaper
done
