#!/usr/bin/env bash

#TODO Check if on the space only a scratchpad window id is left AND minimized (or maybe in general a minimized window). If that's the case move this window to current space or space 1.
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
