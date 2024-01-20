#!/bin/bash

selected=$(printf "Shutdown\nRestart\nSuspend\nHibernate" | rofi -dmenu -i "Power Options")

case "$selected" in
    "Shutdown")
        shutdown "now" 
        ;;
    "Restart")
        reboot 
        ;;
    "Suspend")
        systemctl suspend
        ;;
esac
