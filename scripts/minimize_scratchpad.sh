#!/usr/bin/env bash
# Not so generic script
# When a scratchpad window isn't focused anymore, minimize it

scratchpad_id[0]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="Slack").id')
scratchpad_id[1]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="Rocket.Chat").id')
scratchpad_id[2]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="Bitwarden").id')
scratchpad_id[3]=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app=="TickTick").id')

focused_window=$(yabai -m query --windows --window | jq '.id')

for i in 0 1 2 3 
do
    # Check if application is even started
    if [[ "${scratchpad_id[$i]}" -ne '' ]]; then
        # Check if focused window at the moment isn't the scratchpad_id
        if [[ "$focused_window" -ne "${scratchpad_id[$i]}" ]]; then
            # Check if window is already minimized --> Due to performance maybe just minimize every window
            # is_minimized=$(yabai -m query --windows --window "${scratchpad_id[$i]}" | jq '.minimized')

            #if [[ "$is_minimized" -ne 1 ]]; then
            yabai -m window "${scratchpad_id[$i]}" --minimize
            #fi
            # TODO Set focus right - Maybe call focus script (look TODO bottom of yabairc file)
        fi
    fi
done
