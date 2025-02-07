#/bin/bash

echo "Installing packages..."
sudo dnf install fish python3 pip gnome-tweaks

echo "Installing Orchis theme"
git clone http://github.com/vinceliuice/Orchis-theme.git
cd "Orchis-theme" || exit
./install.sh
cd ..
rm -rf "Orchis-theme"

echo "Installing Tela circle icon theme"
git clone http://github.com/vinceliuice/Tela-circle-icon-theme.git
cd "Tela-circle-icon-theme" || exit
./install.sh
cd ..
rm -rf "Tela-circle-icon-theme"

#echo "Installing Bibata cursor theme"
#sudo dnf copr enable peterwu/rendezvous
#sudo dnf install bibata-cursor-themes

echo "Configuring terminal"
sudo dnf install eza zoxide
curl -sS https://starship.rs/install.sh | sh
sudo dnf copr enable pgdev/ghostty
sudo dnf install ghostty
cd "config" || exit
mv starship.toml ~/.config
mv ghostty ~/.config
cd ..

echo "Installing neovim and LaTex related dependencies..."
sudo dnf install nvim zathura zathura-pdf-poppler texlive-scheme-full inkscape
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
git clone https://github.com/c5514/nvim.git
cd "nvim" || exit
mv nvim ~/.config
mv zathura ~/.config
cd ..
rm -rf "nvim"
# Variables
TEXTEXT_URL="https://github.com/textext/textext/releases/download/1.11.0/TexText-Linux-1.11.0.zip"
DOWNLOAD_DIR="$HOME/Downloads"
INSTALL_DIR="$HOME/.config/inkscape/extensions"
ZIP_FILE="$DOWNLOAD_DIR/TexText-Linux-1.11.0.zip"
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
cd "$HOME/Downloads/textext-1.11.0/" || exit
python3 setup.py --skip-requirements-check
# Clean up
echo "Cleaning up..."
rm -rf "$ZIP_FILE" "$DOWNLOAD_DIR/textext-1.11.0"
echo "TexText extension installed successfully!"

# TODO: Need to add spotify installation via flatpak and spicetify
# Need to add vesktop
# And extensions and gnome-tweaks installation. I am not sure how to configure gnome via dconf
