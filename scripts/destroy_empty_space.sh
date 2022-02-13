#!/usr/bin/env bash

space=$(yabai -m query --spaces | jq --arg recent_space "$YABAI_RECENT_SPACE_ID" '.[] | select(.id == ($recent_space|tonumber))')

# Check only windows on current leaft space --> space_changed event
 window_ids=$(echo $space | jq -re '.windows | .[]')
 minimized_windows=0

 # Check if no windows are on the space --> Set minimized_windows equal 1 so its same length as window_ids
if [[ ! -z "$window_ids" ]]; then
    for window in $window_ids
    do
        minimized_windows=$(($minimized_windows + $(yabai -m query --windows --window "$window" | jq -re 'if ."is-minimized" or ."is-hidden" then 1 else 0 end'))) 
    done
else
    minimized_windows=1
fi

if [[ "$minimized_windows" -eq "${#window_ids[@]}" ]] && [[ $(echo $space | jq 'if ."is-native-fullscreen" and ."is-visible" == false and ."has-focus" == false then 1 else 0 end') -eq 0 ]]; then
    # echo "Destroy Space ID " $(echo $space | jq '.index') 
    yabai -m space "$(echo $space | jq '.index')" --destroy
fi
