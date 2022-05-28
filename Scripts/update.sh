#!/bin/sh
# A bash script for updating and upgrading tool ########################################################
read -p "Hello would you like to update your system at this time: " answer

if [[ $answer == "yes" ]]; then
    echo "Starting update now..."
    sudo pacman -Syyu
    echo "Successfully updated System"
fi

echo "Thank you"
