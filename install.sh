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
ZIP_FILE="$DOWNLOAD_DIR/TexText-Linux-1.10.2.zip"

# Create download and installation directories if they don't exist
mkdir -p "$DOWNLOAD_DIR"
mkdir -p "$INSTALL_DIR"

# Download the TexText ZIP file
echo "Downloading TexText extension..."
if curl -L -o "$ZIP_FILE" "$TEXTEXT_URL"; then
    echo "Download completed."
else
    echo "Error downloading the file. Please check the URL."
    exit 1
fi

# Unzip the downloaded file
echo "Extracting TexText extension..."
if unzip -o "$ZIP_FILE" -d "$DOWNLOAD_DIR"; then
    echo "Extraction completed."
else
    echo "Error extracting the ZIP file."
    exit 1
fi

# Move the extracted files to
echo "Installing TexText extension..."
cd "$DOWNLOAD_DIR" || exit
python3 setup.py --skip-requirements-check
# Clean up
echo "Cleaning up..."
rm -rf "$ZIP_FILE" "$DOWNLOAD_DIR/TexText-Linux-1.10.2"

echo "TexText extension installed successfully!"
