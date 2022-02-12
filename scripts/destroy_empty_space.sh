#!/usr/bin/env bash

spaces=$(yabai -m query --spaces | jq -c '.[]')
composable_spaces=()

# Check windows on every space if they are minimized
for space in $spaces
do
    window_ids=$(echo $space | jq -re '.windows | .[]')
    minimized_windows=0
    for window in $window_ids
    do
        minimized_windows=$(($minimized_windows + $(yabai -m query --windows --window "$window" | jq -re 'if ."is-minimized" then 1 else 0 end'))) 
    done

    if [[ "$minimized_windows" -eq "${#window_ids[@]}" ]] && [[ $(echo $space | jq 'if ."is-native-fullscreen" then 1 else 0 end') -eq 0 ]]; then
        echo "Destroy Space ID " $(echo $space | jq '.index') 
        composable_spaces+=( $(echo $space | jq '.index') )
    fi
done

# Destroy spaces in reversed order
composable_spaces=$(echo $composable_spaces | rev)
for space in $composable_spaces
do
    yabai -m space "$space" --destroy
done

#TODO Check for focus; Bug when using two displays with one empty desktop, that desktop gets destroyed

# Check if on current display is now a fullscreen window --> Then the previous space where window was before is empty, if it was the only window. Don't delete this space then.
yabai -m query --spaces --display | \
    # Check if a space is in native-fullscreen
    jq -re 'map(select(."is-native-fullscreen" == false)) | length > 1' \
    && yabai -m query --spaces | \
    # Check for a space with no windows AND isn't focused at the moment
    jq -re 'map(select(."windows" == [] and ."has-focus" == false).index) | reverse | .[] ' | \
    # Destroy this space
    xargs -I % sh -c 'yabai -m space % --destroy'
