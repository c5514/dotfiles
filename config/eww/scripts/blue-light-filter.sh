#!/bin/bash

# State file for persistent storage
STATE_FILE="/tmp/blue_light_temp"

# Initialize state file if missing
if [[ ! -f "$STATE_FILE" ]]; then
    echo 5500 > "$STATE_FILE"
fi

# Read current temperature
CURRENT_TEMP=$(cat "$STATE_FILE")

# Kill any running wlsunset process
verify() {
    pkill -x "wlsunset" 2>/dev/null
}

# Set new temperature with boundary checks
set_temperature() {
    local new_temp=$1
    # Clamp values between 4001-8000
    (( new_temp < 4001 )) && new_temp=4001
    (( new_temp > 8000 )) && new_temp=8000
    
    verify
    wlsunset -T "$new_temp" &
    echo "$new_temp" > "$STATE_FILE"
    eww update blue_light_temp=$new_temp
}

# Handle commands
case "$1" in
    "blue-light")
        set_temperature $((CURRENT_TEMP + 200))
        ;;
    "red-light")  # Fixed typo (was red-ligth)
        set_temperature $((CURRENT_TEMP - 200))
        ;;
    *)
        echo "Error: Unknown command '$1'"
        exit 1
        ;;
esac
