#!/bin/bash
dir="$HOME/.config/rofi/powermenu.rasi"
selected=$(printf "Shutdown\nRestart\nSuspend\nHibernate" | rofi -dmenu -i -theme $dir "Power Options")

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
