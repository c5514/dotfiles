#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Directory to search
directory="$1"

# Prompt the user for the new username
read -p "Choose a username: " new_username

# Use find to locate files and sed to perform the replacement
find "$directory" -type f -exec sed -i "s/NAME/$new_username/g" {} +

echo "Replacement of 'NAME' with '$new_username' complete."
