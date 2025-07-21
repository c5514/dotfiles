= Principal programs
```bash
sudo pacman -S brightnessctl playerctl git curl wget wl-clipboard cliphist unzip foot qt6ct sass
```
```bash
sudo pacman -S ImageMagick poppler 
sudo pacman -S sassc 
```
- Shell programs
```bash
sudo pacman -S fish starship zoxide eza
```
- Cli apps
```bash
sudo pacman -S btop cava ttyper
```
- Fonts
```bash
sudo pacman -S ttf-liberation ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra cantarell-fonts
```
- LaTeX
```bash
sudo pacman -S texlive-bibtexextra texlive-binextra texlive-langenglish texlive-langspanish texlive-publishers texlive-fontsextra texlive-latexextra texlive-latexrecommended texlive-mathscience texlive-fontsrecommended biber
sudo pacman -S typst zathura zathura-pdf-poppler
```
- Steam
```bash
sudo pacman -S lib32-mesa steam
sudo pacman -S gamemode lib32-gamemode
sudo gpasswsd -a c5514 gamemode
```


= Yay packages
- Install yay
```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
- Aplications
```bash
yay -S matugen-bin protonup-qt bibata-cursor-theme
yay -S aylurs-gtk-shell-git
yay -S libastal-meta
```
- Hyprland
```bash
sudo pacman -S hyprlock hypridle hyprsunset hyprpicker
```


