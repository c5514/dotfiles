#!/bin/bash
# Configuration
OSD_DURATION=2
VOLUME_STEP=5
BRIGHTNESS_STEP=5

# Helper functions for showing OSD
show_volume_osd() {
    eww update volume_osd_visible=true
    sleep $OSD_DURATION
    eww update volume_osd_visible=false
}

show_brightness_osd() {
    eww update brightness_osd_visible=true
    sleep $OSD_DURATION
    eww update brightness_osd_visible=false
}

show_caps_osd() {
    eww update caps_osd_visible=true
    sleep $OSD_DURATION
    eww update caps_osd_visible=false
}

# Volume control functions
volume_up() {
    pactl set-sink-volume 0 +${VOLUME_STEP}%
    show_volume_osd &
}

volume_down() {
    pactl set-sink-volume 0 -${VOLUME_STEP}%
    show_volume_osd &
}

volume_mute() {
    pactl set-sink-mute 0 toggle
    show_volume_osd &
}

mic_mute() {
    pactl set-source-mute 0 toggle
    # Optionally add mic OSD here if you create one
}

# Brightness control functions
brightness_up() {
    brightnessctl set ${BRIGHTNESS_STEP}%+
    show_brightness_osd &
}

brightness_down() {
    brightnessctl set ${BRIGHTNESS_STEP}%-
    show_brightness_osd &
}

# System information functions (for polling)
get_volume() {
    pactl get-sink-volume 0 | awk '{print $5}' | sed 's/%//'
}

get_volume_muted() {
    pactl get-sink-mute 0 | awk '{print $2}' | sed 's/yes/true/; s/no/false/'
}

get_brightness() {
    brightnessctl get
}

get_max_brightness() {
    brightnessctl max
}

# Main script logic
case "$1" in
    # Volume controls
    "volume-up"|"vol-up")
        volume_up
        ;;
    "volume-down"|"vol-down")
        volume_down
        ;;
    "volume-mute"|"vol-mute")
        volume_mute
        ;;
    "mic-mute"|"microphone-mute")
        mic_mute
        ;;
    
    # Brightness controls
    "brightness-up"|"bright-up")
        brightness_up
        ;;
    "brightness-down"|"bright-down")
        brightness_down
        ;;
    
    
    # OSD display functions
    "show-volume-osd")
        show_volume_osd
        ;;
    "show-brightness-osd")
        show_brightness_osd
        ;;
    
    # System info functions (for polling)
    "get-volume")
        get_volume
        ;;
    "get-volume-muted")
        get_volume_muted
        ;;
    "get-brightness")
        get_brightness
        ;;
    "get-max-brightness")
        get_max_brightness
        ;;
    *)
        echo "Error: Unknown command '$1'"
        exit 1
        ;;
esac
