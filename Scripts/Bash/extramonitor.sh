#!/bin/sh

intern=LVDS-1
extern=HDMI-1

case $1 in 
    disconnect) xrandr --output $extern --primary --off --output $intern --auto ;;
    extra) xrandr --output $extern --right-of $intern ;;
esac
