#!/usr/bin/env bash
# Script for opening firefox new window. 
# At the moment new window on space where previous firefox window is opened

current_space=$(yabai -m query --spaces --space | jq -re '.index')
export MOZ_DISABLE_SAFE_MODE_KEY=0 && open -na Firefox
echo $current_space

# Busy waiting on focused window changing to "app":"Firefox"
sleep 0.2
while [[ "$(yabai -m query --windows --window | jq -re 'select(."title" == "Mozilla Firefox" and ."app" == "Firefox")|length')" == "0" ]]; 
do
    echo $current_space
    yabai -m window --space $current_space
    yabai -m space --focus $current_space
done

sleep 0.1
yabai -m space --focus $current_space
echo $current_space
