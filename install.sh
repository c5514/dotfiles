#!/bin/bash
echo "Installing packages"
sudo apt update
sudo apt install git gnome-themes-extra npm python3 gtk2-engines-murrine sassc zathura texlive-science texlive-latex-extra texlive-publishers texlive-fonts-extra texlive-bibtex-extra texlive-fonts-recommended make perl-tk kitty fish latexmk

echo "Installing Orchis theme"
git clone http://github.com/vinceliuice/Orchis-theme.git
cd "Orchis-theme" || exit
./install.sh

echo "Installing Tela circle icon theme"
git clone http://github.com/vinceliuice/Tela-circle-icon-theme.git
cd "Tela-circle-icon-theme" || exit
./install.sh
cd ..
rm -rf "Tela-circle-icon-theme"

#Installing neovim
echo "Installing neovim"
sudo apt install -y ninja-build gettext cmake unzip curl

LATEST_RELEASE=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep "tag_name" | cut -d '"' -f 4)
wget "https://github.com/neovim/neovim/releases/download/$LATEST_RELEASE/nvim-linux64.tar.gz"
tar xzf "nvim-linux64.tar.gz"
sudo mv nvim-linux64/bin/nvim /usr/local/bin/
sudo mv nvim-linux64/share/nvim /usr/local/share/
sudo mv nvim-linux64/man/man1/nvim.1 /usr/local/share/man/man1/
rm -rf nvim-linux64*

echo "Adding neovim configuration"
git clone http://github.com/c5514/nvim_config.git
cd "nvim_config" || exit
mv nvim ~/.config
mv zathura ~/.config
cd ..
rm -rf "nvim_config"

echo "Adding JetBrainsMono Nerd Font"
bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)" <<EOF
28
EOF


echo "Adding new repository for wezterm"
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
echo "Installing wezterm"
sudo apt install wezterm

echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh
echo "Adding starship configuration"
# TODO: Need to finish 

# ALIAS_COMMAND="alias nv='nvim'"
#
# # Check if the alias already exists
# if ! grep -Fxq "$ALIAS_COMMAND" ~/.bashrc; then
#     # Append the alias to .bashrc
#     echo "$ALIAS_COMMAND" >> ~/.bashrc
#     echo "Alias 'nv' added to ~/.bashrc"
# else
#     echo "Alias 'nv' already exists in ~/.bashrc"
# fi
#
# # Inform the user to source .bashrc
# echo "Run 'source ~/.bashrc' to apply the change"
# source ~/.bashrc

echo "Installing Elegant-grub2-themes"
git clone https://github.com/vinceliuice/Elegant-grub2-themes.git
cd "Elegant-grub2-themes" || exit
sudo ./install.sh -t mojave -s 1080p -l system



echo "Updating to install inkscape"
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt install inkscape


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
