#!/usr/bin/env bash
# When a scratchpad window isn't focused anymore, minimize it

# Some backoff so focused_window is the right one
sleep 0.2
scratchpad_apps=("$@")

focused_window_app=$(yabai -m query --windows --window | jq '.app' | tr -d '"') # Remove quotes from string

for scratchpad_app in "${scratchpad_apps[@]}" 
do
    scratchpad_window=$(yabai -m query --windows | jq --arg app "$scratchpad_app" '.[] | select(.app==$app)')

    if [[ ! -z "$scratchpad_window" ]]; then
        scratchpad_minimized=$(echo $scratchpad_window | jq '."is-minimized"')

        if [[ "$focused_window_app" != "$scratchpad_app" ]] && [[ "$scratchpad_minimized" == "false" ]]; then
            scratchpad_id=$(echo $scratchpad_window | jq '.id')
            yabai -m window $scratchpad_id --minimize
        fi
    fi
done

