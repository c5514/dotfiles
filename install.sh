#!/bin/bash
echo "Installing packages"
sudo apt update
sudo apt remove gnome-games
sudo apt install git npm wget python3 sassc escputil gh printer-driver-escpr gnome-tweaks bibata-cursor-theme neofetch

echo "Installing LaTeX dependecies"
sudo apt install texlive-base texlive-bibtex-extra texlive-binaries texlive-extra-utils texlive-fonts-extra-links texlive-fonts-extra texlive-fonts-recommended texlive-formats-extra texlive-lang-english texlive-lang-spanish texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-luatex texlive-pictures texlive-plain-generic texlive-publishers texlive-science texlive-xetex latexmk biber

echo "Installing Inkscape and Textext"
sudo apt install inkscape inkscape-textext

echo "Installing latest version of neovim"
sudo apt install -y cmake unzip curl zathura zathura-pdf-poppler
LATEST_RELEASE=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep "tag_name" | cut -d '"' -f 4)
wget "https://github.com/neovim/neovim/releases/download/$LATEST_RELEASE/nvim-linux-x86_64.tar.gz"
tar xzf "nvim-linux-x86_64.tar.gz"
sudo mv nvim-linux-x86_64/bin/nvim /usr/local/bin/
sudo mv nvim-linux-x86_64/share/nvim /usr/local/share/
rm -rf nvim-linux-x86_64*

echo "Downloading neovim configuration"
git clone http://github.com/c5514/nvim.git
cd "nvim" || exit
mv nvim ~/.config
mv zathura ~/.config
cd ..
rm -rf "nvim"

#echo "Adding JetBrainsMono Nerd Font"
#bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)" <<EOF
#28
#EOF

echo "Installing fish shell"
sudo apt install fish
cd "config" || exit
mv fish ~/.config
cat .bashrc >> $HOME/.bashrc
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

# echo "Installing yazi"
# #Add installation with wget
# cd "config" || exit
# mv yazi ~/.config
# cd ..

echo "Installing lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

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
cd .. 
rm -rf "Orchis-theme"

echo "Installing Tela circle icon theme"
git clone http://github.com/vinceliuice/Tela-circle-icon-theme.git
cd "Tela-circle-icon-theme" || exit
./install.sh
cd ..
rm -rf "Tela-circle-icon-theme"

echo "Installing flatpak"
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Modifying grub"
git clone https://github.com/vinceliuice/grub2-themes
cd "grub2-themes" || exit
sudo ./install.sh -b -t tela
cd .. 
rm -rf "grub2-themes"

echo "Reboot"
sudo reboot now
