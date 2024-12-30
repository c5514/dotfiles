#!/bin/bash
echo "Installing packages"
sudo apt update
sudo apt install git npm python3 sassc escputil gh printer-driver-escpr
echo "Installing LaTeX dependecies"
sudo apt install texlive-base texlive-bibtex-extra texlive-binaries texlive-extra-utils texlive-fonts-extra-links texlive-fonts-extra texlive-fonts-recommended texlive-formats-extra texlive-lang-english texlive-lang-spanish texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-lualatex texlive-pictures texlive-plain-generic texlive-publishers texlive-science texlive-xetex latexmk

echo "To install inkscape answer the following question"
while true; do
    read -p "Are you in a Ubuntu based distro? (y/n): " answer

    case "$answer" in
        [yY] | [yY][eE][sS])
            echo "Adding latest version of inkscape to repository"
            sudo add-apt-repository ppa:inkscape.dev/stable
            sudo apt update
            echo "Installing inkscape"
            sudo apt install inkscape
            TEXTEXT_URL="https://github.com/textext/textext/releases/download/1.10.2/TexText-Linux-1.10.2.zip"
            DOWNLOAD_DIR="$HOME/Downloads"
            INSTALL_DIR="$HOME/.config/inkscape/extensions"
            ZIP_FILE="$DOWNLOAD_DIR/TexText-Linux-1.10.2.zip"
            mkdir -p "$DOWNLOAD_DIR"
            mkdir -p "$INSTALL_DIR"

            echo "Downloading TexText extension"
            if curl -L -o "$ZIP_FILE" "$TEXTEXT_URL"; then
                echo "Download completed."
            else
                echo "Error downloading the file. Please check the URL."
                exit 1
            fi

            echo "Extracting files"
            if unzip -o "$ZIP_FILE" -d "$DOWNLOAD_DIR"; then
                echo "Extraction completed."
            else
                echo "Error extracting the ZIP file."
                exit 1
            fi

            echo "Installing TexText extension"
            cd "$HOME/Downloads/textext-1.10.2/" || exit
            python3 setup.py --skip-requirements-check
            
            echo "Cleaning up..."
            rm -rf "$ZIP_FILE" "$DOWNLOAD_DIR/textext-1.10.2"

            echo "TexText extension installed successfully!"
            break
            ;;
        [nN] | [nN][oO])
            echo "Installing inkscape and textext extension"
            sudo apt install inkscape inkscape-textext
            break
            ;;
        *)
            echo "Invalid entry. Try again!"
            ;;
    esac
done


echo "Installing latest version of neovim"
sudo apt install -y ninja-build gettext cmake unzip curl zathura zathura-pdf-poppler
LATEST_RELEASE=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep "tag_name" | cut -d '"' -f 4)
wget "https://github.com/neovim/neovim/releases/download/$LATEST_RELEASE/nvim-linux64.tar.gz"
tar xzf "nvim-linux64.tar.gz"
sudo mv nvim-linux64/bin/nvim /usr/local/bin/
sudo mv nvim-linux64/share/nvim /usr/local/share/
sudo mv nvim-linux64/man/man1/nvim.1 /usr/local/share/man/man1/
rm -rf nvim-linux64*
echo "Downloading neovim configuration"
git clone http://github.com/c5514/nvim_config.git
cd "nvim_config" || exit
mv nvim ~/.config
mv zathura ~/.config
cd ..
rm -rf "nvim_config"

#echo "Adding JetBrainsMono Nerd Font"
#bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)" <<EOF
#28
#EOF

echo "Installing fish shell"
sudo apt install fish
cd "config" || exit
mv fish ~/.config
cd ..

echo "Adding new repository for wezterm"
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
echo "Installing wezterm"
sudo apt install wezterm
cd "config" || exit
mv weztern ~/.config
cd ..

echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh
echo "Adding starship configuration"
cd "config" || exit
mv starship.toml ~/.config
cd ..

echo "Installing zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo "Installing tmux"
sudo apt install tmux
cd "config" || exit
mv tmux ~/.config
cd ..

echo "Installing yazi"
#Add installation with wget
cd "config" || exit
mv yazi ~/.config
cd ..

echo "Installing lazygit"

echo "Installing noisetorch"
wget "https://github.com/neovim/neovim/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz"
tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz
gtk-update-icon-cache
sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch
cd "config" || exit
mv systemd ~/.config
cd ..
systemctl --user daemon-reload
systemctl --user start noisetorch
systemctl --user enable noisetorch

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

