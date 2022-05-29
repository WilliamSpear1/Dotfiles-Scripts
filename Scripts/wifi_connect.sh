#!/bin/sh
#  Bash Script for connecting device to wifi using nmcli command line tool ##############################
echo "Please choose wifi access point from the list provided below"

nmcli dev wifi list

read -p "Wifi name: " wifi_name

# Empty echo command acts as a new line character
echo
echo "Chosen wifi is $wifi_name"

read -p "Is this correct(yes or no)? " answer

if [[ $answer == "no" ]]; then
    nmcli dev wifi list
    read -p "New Wifi name: " new_wifi_name
else 
    echo "yes"
fi

if [[ $answer == "no" ]]; then
    echo "$new_wifi_name"
else
    echo "$wifi_name"
fi

#read command with additional parameters for prompt and silent echo
read -sp "Please enter wifi password: " wifi_password

if [[ $answer == "no" ]]; then
    sudo nmcli dev wifi connect $new_wifi_name password $wifi_password
else
    sudo nmcli dev wifi connect $wifi_name password $wifi_password
fi

echo "Successfully ran Wifi Bash Script =) Enjoy the rest of your day"
