#!/bin/bash
choice=$(printf " Quick LaTeX\n Music Player\n Video Player\n󰖟 Web Browser\n󰼭 Typing Test" | fuzzel --dmenu --prompt "Tools: ")

case "$choice" in
    " Quick LaTeX") ~/.config/fuzzel/scripts/quick-latex.sh ;;
    " Music Player") ~/.config/fuzzel/scripts/music.sh ;;
    " Video Player") ~/.config/fuzzel/scripts/videos.sh ;;
    "󰖟 Web Browser") ~/.config/fuzzel/scripts/web.sh ;;
    "󰼭 Typing Test") ~/.config/fuzzel/scripts/ttyper.sh ;;
    *) exit 1 ;;
esac
