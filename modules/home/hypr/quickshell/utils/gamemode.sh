#!/usr/bin/env fish
set ANIM_STATE (hyprctl getoption animations:enabled | string match -r '\d+')
set POWER_STATE (powerprofilesctl get)

if test "$ANIM_STATE" = "1"
    hyprctl --batch "\
        keyword animations:enabled 0; \
        keyword decoration:shadow:enabled 0; \
        keyword decoration:blur:enabled 0; \
        keyword general:gaps_in 0; \
        keyword general:gaps_out 0; \
        keyword decoration:rounding 0"
    powerprofilesctl set performance
    notify-send "Gamemode on" &
else
    hyprctl --batch "\
        keyword animations:enabled 1; \
        keyword decoration:shadow:enabled 1; \
        keyword decoration:blur:enabled 1; \
        keyword general:gaps_in 2; \
        keyword general:gaps_out 4; \
        keyword decoration:rounding 15"
    powerprofilesctl set balanced
    notify-send "Gamemode off" &
end
