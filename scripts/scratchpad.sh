#!/usr/bin/env bash
# Found here: https://github.com/koekeishiya/yabai/issues/379#issuecomment-616838371
# Generic Scratchpad script
# $1 (First parameter): Program name

scratchpad_id=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app==$program).id')


if [[ "$scratchpad_id" -lt 1 ]]; then
  scratchpad_id=$(open -a "$1" | awk '{print $NF}')
  sleep 1
  yabai -m window --focus "$scratchpad_id"
  yabai -m window --grid 6:6:1:1:4:4
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.minimized')
  current_space=$(yabai -m query --spaces --space | jq '.index')

  if [[ "$is_minimized" -eq 1 ]]; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
    yabai -m window --grid 6:6:1:1:4:4
  else
      # TODO Check if current focused window isn't minimized and is on the current space
      # TODO If not, focus current space; Deals with the problem of double opened scratchpad windows
      yabai -m window --focus first
    yabai -m window "$scratchpad_id" --minimize
  fi
fi
