#/bin/bash

echo "Installing packages..."
sudo dnf install fish python3 pip

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

echo "Installing Bibata cursor theme"
sudo dnf copr enable peterwu/rendezvous
sudo dnf install bibata-cursor-themes

echo "Configuring terminal"
sudo dnf install eza
curl -sS https://starship.rs/install.sh | sh
sudo dnf copr enable wezfurlong/wezterm-nightly
sudo dnf install wezterm
#
# echo "Installing Hyprland and some dependencies..."
# sudo dnf copr enable solopasha/hyprland
# sudo dnf install hyprland cliphist swwww hypridle hyprlock

# echo "Installing pywal and hyprshade..."
# pip install --user pywal
# sudo dnf install pipx
# pipx ensurepath
# sudo pipx ensurepath --global
# pipx install hyprshade

echo "Installing fonts..."
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CaskaydiaMono.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz

echo "Installing neovim and LaTex related dependencies..."
sudo dnf install nvim zathura zathura-poppler-pdf texlive-scheme-full inkscape
git clone https://github.com/c5514/nvim_config.git
mv nvim ~/.config
mv zathura ~/.config

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
cd "$HOME/Downloads/textext-1.10.2/" || exit
python3 setup.py --skip-requirements-check
# Clean up
echo "Cleaning up..."
rm -rf "$ZIP_FILE" "$DOWNLOAD_DIR/textext-1.10.2"
echo "TexText extension installed successfully!"

# TODO: Need to add spotify installation via flatpak and spicetify
# Need to add vesktop
# And extensions and gnome-tweaks installation. I am not sure how to configure gnome via dconf

echo "Changing shell to fish"
chsh -s /usr/bin/fish
