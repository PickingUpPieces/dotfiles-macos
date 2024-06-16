#!/usr/bin/env bash

# Detects if iTerm2 is running
if ! pgrep -f "iTerm" > /dev/null; then
    open -a "/Applications/iTerm.app"
else
    # Create a new window
    if ! osascript -e 'tell application "iTerm2" to create window with default profile' > /dev/null; then
        # Get pids for any app with "iTerm" and kill
        for i in $(pgrep -f "iTerm"); do kill -15 "$i"; done
        open  -a "/Applications/iTerm.app"
    fi
    if [ -n "$1" ]; then
        path="~"
        # Currently depends on a file with the last destination of cd
        # TODO: Only works if in the current terminal the last cd was called
        if [ -f ~/.last_dir ]
            then path=$(cat ~/.last_dir)
osascript -  "$path"  <<EOF
on run argv -- argv is a list of strings
    tell application "iTerm2"
        set currentSession to current window
            tell current session of currentSession
                write text "cd " & quoted form of item 1 of argv & "; clear"
            end tell
    end tell
end run
EOF
        fi
    fi
fi

# With processID of the current shell you can easily get the cwd
#lsof -p 73329 | grep cwd
