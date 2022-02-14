#!/usr/bin/env bash
# Found here: https://github.com/koekeishiya/yabai/issues/379#issuecomment-616838371
# Generic Scratchpad script
# $1 (First parameter): Program name

scratchpad_id=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app==$program).id')

# TODO: Safe window id of current focused window before opening the scratchpad. Set this ID as env variable. This can be used to focus the correct window again when two or more scratchpad windows have been openend.

if [[ "$scratchpad_id" -lt 1 ]]; then
  scratchpad_id=$(open -a "$1" | awk '{print $NF}')
  sleep 1
  yabai -m window --focus "$scratchpad_id"
  yabai -m window --grid 6:6:1:1:4:4
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '."is-minimized"')
  current_space=$(yabai -m query --spaces --space | jq '."index"')

  if [[ "$is_minimized" = "true" ]]; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
    yabai -m window --grid 6:6:1:1:4:4
  else
      # TODO Check if current focused window isn't minimized and is on the current space
      # TODO If not, focus current space; Deals with the problem of double opened scratchpad windows
    yabai -m window "$scratchpad_id" --minimize
    window_id=$(yabai -m query --windows --space | jq 'map(select(."is-minimized" == false and ."is-hidden" == false)) | .[0].id')
    yabai -m window --focus $window_id
  fi
fi
