#!/bin/bash

set -e
#Installing Nix configuration
echo "Changing nix configuration to main host"
sudo nixos-rebuild switch --flake .
echo "Installing home-manager configuration"
home-manager switch --flake .

# Variables
TEXTEXT_URL="https://github.com/textext/textext/releases/download/1.10.2/TexText-Linux-1.10.2.zip"
DOWNLOAD_DIR="$HOME/Downloads"
INSTALL_DIR="$HOME/.config/inkscape/extensions"

# Create download and installation directories if they don't exist
mkdir -p "$DOWNLOAD_DIR"
mkdir -p "$INSTALL_DIR"

# Download the TexText ZIP file
echo "Downloading TexText extension..."
curl -L -o "$DOWNLOAD_DIR/TexText-Linux-1.10.2.zip" "$TEXTEXT_URL"
ZIP_FILE=$(find "$DOWNLOAD_DIR" -name "*.zip" -printf "%T@ %p\n" | sort -n | tail -n 1 | cut -d' ' -f2-)
echo "Download completed: $ZIP_FILE"

# Unzip the downloaded file
echo "Extracting TexText extension..."
unzip -o "$ZIP_FILE" -d "$DOWNLOAD_DIR"
# Get the modification time of the ZIP file
ZIP_MOD_TIME=$(stat -c %Y "$ZIP_FILE")

# Find the most recently extracted directory
EXTRACTED_DIR=$(find "$DOWNLOAD_DIR" -maxdepth 1 -type d -newermt "@$ZIP_MOD_TIME" -printf "%p\n" | sort | tail -n 1)
echo "Extraction completed."

# Install the TexText extension
echo "Installing TexText extension..."
cd "$EXTRACTED_DIR" || exit
python3 setup.py --skip-requirements-check

# Clean up
echo "Cleaning up..."
rm -rf "$ZIP_FILE" "$EXTRACTED_DIR"

echo "TexText extension installed successfully!"
