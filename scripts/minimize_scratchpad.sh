#!/usr/bin/env bash
# Not so generic script
# When a scratchpad window isn't focused anymore, minimize it

# Some backoff so focused_window is the right one
sleep 0.2
scratchpad_apps=("$@")

focused_window=$(yabai -m query --windows --window | jq '.id')

for scratchpad_app in "${scratchpad_apps[@]}" 
do
    scratchpad_id=$(yabai -m query --windows | jq --arg app "$scratchpad_app" '.[] | select(.app==$app).id')

    if [[ ! -z "$scratchpad_id" ]]; then
        if [[ "$focused_window" -ne "$scratchpad_id" ]]; then
            # Due to performance just minimize every scratchpad window
            yabai -m window $scratchpad_id --minimize
        fi
    fi
done

