#!/bin/bash

foot --title="Music Player" -e bash -c '
while true; do
    echo "========================================================"
    echo "                      Music Player                      "
    echo "========================================================"
    echo "1) Open rmpc"
    echo "2) Search and add music to rmpc"
    echo "3) Exit"
    echo ""
    read -p "Choose an option (1-3): " -r choice
    
    case "$choice" in
        1)
            echo "Opening rmpc..."
            rmpc
            ;;
        2)
            echo ""
            echo "Search for music:"
            read -r search_term
            
            if [[ -z "$search_term" ]]; then
                echo "No search term provided"
                continue
            fi
            
            if [[ "$search_term" == http* ]]; then
                echo "Adding URL to rmpc: $search_term"
                rmpc addyt "$search_term"
            else
                echo "Searching for: $search_term"
                echo "Getting YouTube URL..."
                
                # Get the actual YouTube page URL
                youtube_url=$(yt-dlp --get-filename -o "https://www.youtube.com/watch?v=%(id)s" "ytsearch:$search_term" | head -n1)
                
                if [[ -n "$youtube_url" ]]; then
                    echo "Found: $youtube_url"
                    echo "Adding to rmpc..."
                    rmpc addyt "$youtube_url"
                    echo "✓ Song added to queue!"
                else
                    echo "✗ No results found for: $search_term"
                fi
            fi
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
