#!/usr/bin/env bash
# Generic Scratchpad script
# $1 (First parameter): Program name

scratchpad_id[0]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="Slack").id')
scratchpad_id[1]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="Rocket.Chat").id')
scratchpad_id[2]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="Bitwarden").id')
scratchpad_id[3]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="TickTick").id')

focused_window=$(yabai -m query --windows --window | jq '.id')

for i in 0 1 2 3 
do
    if [[ "${scratchpad_id[$i]}" -ne '' ]]; then
        if [[ "$focused_window" -ne "${scratchpad_id[$i]}" ]]; then
            is_minimized=$(yabai -m query --windows --window "${scratchpad_id[$i]}" | jq '.minimized')

            if [[ "$is_minimized" -ne 1 ]]; then
                yabai -m window "${scratchpad_id[$i]}" --minimize
            fi
        fi
    fi
done
