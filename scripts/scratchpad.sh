#!/usr/bin/env bash
# Found here: https://github.com/koekeishiya/yabai/issues/379#issuecomment-616838371
# Generic Scratchpad script
# $1 (First parameter): Program name

# Get the window ID of the program
scratchpad_id=$(yabai -m query --windows | jq --arg app "$1" '.[] | select(.app==$app).id')

# Check if program is running
if [[ "$scratchpad_id" -lt 1 ]]; then
  # Scratchpad app is not running so start it
  scratchpad_id=$(open -a "$1" | awk '{print $NF}')
  # Wait for scratchpad app to start
  sleep 1
  yabai -m window --focus "$scratchpad_id"
  # Needed for first start of the app
  yabai -m window --grid 6:6:1:1:4:4
else
  # Scratchpad window is already started
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '."is-minimized"')
  current_space=$(yabai -m query --spaces --space | jq '."index"')

  # Check if the scratchpad is minimized
  if [[ "$is_minimized" = "true" ]]; then
    echo "scratchpad $scratchpad_id is already minimized. Move it to space $current_space and focus it."
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
    yabai -m window --grid 6:6:1:1:4:4
  else
    # Scratchpad window is not minimized, so we assume it is currently focused -> minimize it
    echo "Minimize scratchpad $scratchpad_id and focus $window_id"
    yabai -m window "$scratchpad_id" --minimize

    # Get next window ID to focus
    window_id=$(yabai -m query --windows --space | jq --arg id $scratchpad_id 'map(select(."is-minimized" == false and ."is-hidden" == false and .id != ($id | tonumber))) | .[0].id')
    yabai -m window --focus $window_id
  fi
fi
