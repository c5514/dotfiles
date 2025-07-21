#!/bin/bash
foot --title="Video Player" -e bash -c '
last_input=""
while true; do
    if [[ -z "$last_input" ]]; then
        echo "Video Player - Enter URL or search term:"
        read -r input
        if [[ -z "$input" ]]; then
            echo "No input provided"
            break
        fi
        last_input="$input"
    else
        input="$last_input"
    fi

    if [[ "$input" == http* ]]; then
        echo "Playing URL: $input"
        mpv --ytdl-format="bestvideo[height<=?1080]+bestaudio" "$input"
    else
        echo "Searching for: $input"
        mpv --ytdl-format="bestvideo[height<=?1080]+bestaudio" "ytdl://ytsearch:$input"
    fi
    
    echo ""
    echo "Video finished playing."
    echo "Choose an option:"
    echo "1) Replay same video"
    echo "2) Choose another video"
    echo "3) Exit"
    read -p "Enter your choice (1-3): " -r choice
    
    case "$choice" in
        1)
            echo "Replaying..."
            echo ""
            ;;
        2)
            echo ""
            echo "Video Player - Enter URL or search term:"
            read -r new_input
            if [[ -z "$new_input" ]]; then
                echo "No input provided, exiting..."
                break
            fi
            last_input="$new_input"
            echo ""
            ;;
        3|*)
            break
            ;;
    esac
done
echo "Goodbye!"
read -p "Press enter to close..."
'
