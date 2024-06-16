#!/usr/bin/env bash

# Some backoff time needed for anti-swoosh. Otherwise space is deleted in between swooshs
sleep 0.4

# Check only windows on current left space --> space_changed event
space=$(yabai -m query --spaces | jq --arg recent_space "$YABAI_RECENT_SPACE_ID" '.[] | select(.id == ($recent_space|tonumber))')
space_index=$(echo $space | jq '.index') 

windows=$(yabai -m query --windows --space $space_index) 

amount_minimized_windows=$(echo $windows | jq -re 'map(select(."is-minimized" or ."is-hidden")) | length') 
amount_all_windows=$(echo $windows | jq -re 'length')

if [ "$amount_minimized_windows" -eq "$amount_all_windows" ] && [ "$(echo $space | jq 'if ."is-native-fullscreen" == true or ."is-visible" == true or ."has-focus" == true then 1 else 0 end')" -eq "0" ]; then
    #echo "Destroy Space ID" $space_index
    yabai -m space $space_index --destroy

    # FIXME: Delete this if you aren't using spacebar
    # Updating spacebar for reflecting destroyed desktops
    # https://github.com/cmacrae/spacebar/issues/82
    # spacebar -m config spaces on
fi

