#!/bin/bash
foot --title="w3m Browser" -e bash -c '
echo "Enter URL or search term:"
read -r query
if [[ "$query" == http* ]]; then
    w3m "$query"
else
    w3m "https://duckduckgo.com/?q=$query"
fi
'
