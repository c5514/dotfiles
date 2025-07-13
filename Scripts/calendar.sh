#!/bin/bash
active_windows=$(eww active-windows)
if echo "$active_windows" | grep -q "calendar-popup"; then
    eww close calendar-popup
else
    eww open calendar-popup
fi
