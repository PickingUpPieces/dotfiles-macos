#!/usr/bin/env bash

yabai -m query --spaces --display | \
     jq -re 'map(select(."native-fullscreen" == 0)) | length > 1' \
     && yabai -m query --spaces | \
          jq -re 'map(select(."windows" == [] and ."focused" == 0).index) | reverse | .[] ' | \
          xargs -I % sh -c 'yabai -m space % --destroy'

