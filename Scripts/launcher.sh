#!/bin/bash
if pgrep -x fuzzel > /dev/null; then
    pkill fuzzel
    exit 0
fi
choice=$(printf " Quick LaTeX\n Music Player\n Video Player\n󰖟 Web Browser\n󰼭 Typing Test" | fuzzel --dmenu --prompt "Tools: ")

case "$choice" in
    " Quick LaTeX") ~/Scripts/quick-latex.sh ;;
    " Music Player") ~/Scripts/music.sh ;;
    " Video Player") ~/Scripts/videos.sh ;;
    "󰖟 Web Browser") ~/Scripts/web.sh ;;
    "󰼭 Typing Test") ~/Scripts/ttyper.sh ;;
    *) exit 1 ;;
esac
