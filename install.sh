#!/bin/bash
sudo pacman -Syu
echo "Installing neovim"
sudo pacman -S neovim npm fzf ripgrep git curl wget npm lazygit yazi

echo "Installing utils"
sudo pacman -S brightnessctl playerctl upower power-profiles-daemon wl-clipboard cliphist unzip 7zip udiskie udisks2 gvfs ImageMagick poppler fish starship zoxide eza github-cli btop cava ttyper 

echo "Installing fonts"
sudo pacman -S ttf-liberation ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra cantarell-fonts ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono 

echo "Do you want to install an AUR helper? (yes/no)"
read -r install_choice
install_choice=$(echo "$install_choice" | tr '[:upper:]' '[:lower:]')
if [[ "$install_choice" == "yes" || "$install_choice" == "y" ]]; then
  tmpdir=$(mktemp -d)
  sudo pacman -S --needed base-devel
  echo "Which AUR helper would you like to use? (yay/paru)"
  read -r aur_helper
  aur_helper=$(echo "$aur_helper" | tr '[:upper:]' '[:lower:]')
  if [[ "$aur_helper" == "yay" ]]; then
    git clone --depth=1 https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
    (cd "$tmpdir/yay-bin" && makepkg -si --noconfirm)
  else
    git clone --depth=1 https://aur.archlinux.org/paru.git "$tmpdir/paru"
    (cd "$tmpdir/paru" && makepkg -si --noconfirm)
  fi
  rm -rf "$tmpdir"
else
  echo "AUR helper installation skipped."
fi

echo "Do you want to install Hyprland and applications:"
read -r hyprland_choice
if [[ "$hyprland_choice" == "yes" || "$hyprland_choice" == "no"]]; then
  sudo pacman -S hyprlock hypridle hyprsunset hyprpicker nautilus tela-circle-icon-theme-blue swww fuzzel firefox spotify-launcher xdg-desktop-portal-gtk xdg-desktop-portal-gnome qt5-wayland qt6-wayland foot
  paru -S bibata-cursor-theme grimblast-git matugen-bin
  gsettings set org.gnome.desktop.interface icon-theme "'Tela-circle-blue-dark'" 
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  sudo pacman -S inkscape python-tinycss2 gtksourceview3
  cp /usr/share/applications/org.inkscape.Inkscape.desktop ~/.local/share/applications/
  sed -i 's/^Exec=inkscape/Exec=env GDK_BACKEND=x11 inkscape/' ~/.local/share/applications/org.inkscape.Inkscape.desktop
  update-desktop-database ~/.local/share/applications/
else 
  echo "Skipping Hyprland installation..."
fi

echo "Do you want to install LaTeX dependencies? It might take a while. (yes/no)"
read -r latex_choice
if [["$latex_choice" == "yes" || "$latex_choice" == "y" ]]; then
  paru -S texlive-full
  sudo pacman -S typst zathura zathura-pdf-poppler biber perl-yaml-tiny perl-file-homedir 
  sudo fmtutil-sys --all
else 
  echo "Skipping LaTeX dependencies..."
fi

echo "Finished installation"
