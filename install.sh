#!/bin/bash

sudo pacman -Syu

echo "Installing dependencies..."
sudo pacman -S cliphist kitty network-manager network-manager-applet iwd htop polkit-gnome polkit-kde-agent pavucontrol nwg-look brightnessctl unzip usbutils

echo "Installing yay"
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si 

echo "Installing hyprland dependencies..."
sudo pacman -S hyprlock aylurs-gtk-shell swww-git rofi-wayland hyprland hypridle
yay -S matugen-bin
sudo pacman -S bun dart-sass fd fzf hyprpicker slurp wf-recorder wl-clipboard wayshot swappy
git clone https://github.com/Aylur/dotfiles.git
cp -r dotfiles/ags ~/.config/ags

echo "Installing neovim and LaTex related dependencies..."
sudo pacman -S neovim zathura zathura-pdf-mupdf inkscape texlive-bibtexextra texlive-binextra texlive-langchinese texlive-langenglish texlive-langfrench texlive-langjapanese texlive-korean texlive-spanish texlive-publishers texlive-fontsextra texlive-latexextra texlive-latexrecommended texlive-mathscience
git clone htpps://github.com/c5514/nvim_config.git
mv ./nvim_config/nvim ~/.config/
mv ./nvim_config/zathura ~/.config/
echo "Installing inkscape extension textext"
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

echo "Installing icon themes and fonts"
sudo pacman -S papirus-icon-theme otf-font-awesome gnu-free-fonts noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-jetbrains-mono ttf-font-awesome ttf-jetbrains-mono-nerd ttf-material-design-icons-desktop-git

echo "Installing non essential dependencies..."
sudo pacman -S telegram-desktop spotify-launcher 

echo "Changing shell to fish"
chsh -s /usr/bin/fish
