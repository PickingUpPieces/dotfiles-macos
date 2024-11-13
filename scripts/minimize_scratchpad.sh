#!/usr/bin/env bash
# When a scratchpad window isn't focused anymore, minimize it

scratchpad_apps=("$@")

focused_window_app=$(yabai -m query --windows --window | jq '.app' | tr -d '"') # Remove quotes from string

# Iterate over all scratchpad applications and check if it
for scratchpad_app in "${scratchpad_apps[@]}" 
do
    scratchpad_window=$(yabai -m query --windows | jq --arg app "$scratchpad_app" '.[] | select(.app==$app)')
#   echo "For app $scratchpad_app is the window information is: \n $scratchpad_window"

    # Check if scratchpad_window is not empty -> App has been started and a window exists
    if [[ ! -z "$scratchpad_window" ]]; then
        scratchpad_minimized=$(echo $scratchpad_window | jq '."is-minimized"')
#       echo "Scratchpad app $scratchpad_app minimized status is: $scratchpad_minimized"

        # Check if currently focused app is the scratchpad app and if it is not minimized yet
        if [[ "$focused_window_app" != "$scratchpad_app" ]] && [[ "$scratchpad_minimized" == "false" ]]; then
            scratchpad_id=$(echo $scratchpad_window | jq '.id')
            yabai -m window $scratchpad_id --minimize
        fi
    fi
done

