#!/bin/sh

intern="LVDS-1"
extern="HDMI-1"

case "$1" in 
    "disconnect") xrandr --output "$extern" --off --output "$intern" --auto ;;
    "extra") xrandr --output "$extern" --primary --left-of "$intern" ;;
esac
