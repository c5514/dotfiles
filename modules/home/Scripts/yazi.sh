#!/usr/bin/env fish
# Script to toggle Yazi file manager in Hyprland scratchpad
# Usage: ./yazi-scratchpad.fish

set SCRATCHPAD_NAME "yazi_scratchpad"
set FOOT_CLASS "yazi"

# Check if the scratchpad window already exists
if hyprctl clients | grep -q "class: $FOOT_CLASS"
    # If it exists, toggle the scratchpad
    hyprctl dispatch togglespecialworkspace "$SCRATCHPAD_NAME"
else
    # If it doesn't exist, create it
    foot --app-id="$FOOT_CLASS" -e yazi &
    sleep 0.1
    # Move the newly created window to scratchpad
    hyprctl dispatch movetoworkspacesilent "special:$SCRATCHPAD_NAME,class:$FOOT_CLASS"
    # Show the scratchpad
    hyprctl dispatch togglespecialworkspace "$SCRATCHPAD_NAME"
end
