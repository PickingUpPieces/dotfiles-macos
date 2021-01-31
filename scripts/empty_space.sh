#!/usr/bin/env bash

# Check if on current display is now a fullscreen window --> Then the previous space where window was before is empty, if it was the only window. Don't delete this space then.
yabai -m query --spaces --display | \
    # Check if a space is in native-fullscreen
     jq -re 'map(select(."native-fullscreen" == 0)) | length > 1' \
     && yabai -m query --spaces | \
     # Check for a space with no windows AND isn't focused at the moment
          jq -re 'map(select(."windows" == [] and ."focused" == 0).index) | reverse | .[] ' | \
    # Destroy this space
          xargs -I % sh -c 'yabai -m space % --destroy'

