#!/bin/bash
active_windows=$(eww active-windows)
if echo "$active_windows" | grep -q "menu_popup"; then
    eww close menu_popup
else
    eww open menu_popup
fi
