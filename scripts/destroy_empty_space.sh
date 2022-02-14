#!/usr/bin/env bash

# Check only windows on current left space --> space_changed event
space=$(yabai -m query --spaces | jq --arg recent_space "$YABAI_RECENT_SPACE_ID" '.[] | select(.id == ($recent_space|tonumber))')
space_index=$(echo $space | jq '.index') 

windows=$(yabai -m query --windows --space $space_index) 

amount_minimized_windows=$(echo $windows | jq -re 'map(select(."is-minimized" or ."is-hidden")) | length') 
amount_all_windows=$(echo $windows | jq -re 'length')

 # Check if no windows are on the space --> Set minimized_windows equal 1 so its same length as window_ids
#if [[ $minimized_windows -eq 0 ]]; then
#    minimized_windows=1
#fi

if [ "$amount_minimized_windows" -eq "$amount_all_windows" ] && [ "$(echo $space | jq 'if ."is-native-fullscreen" and ."is-visible" == false and ."has-focus" == false then 1 else 0 end')" -eq "0" ]; then
    #echo "Destroy Space ID" $space_index) 
    yabai -m space $space_index --destroy
fi