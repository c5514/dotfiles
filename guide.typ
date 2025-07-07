#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
= Basic dependencies
+ *(If dual-boot)* Configuring grub bootloader:
  - First install os-prober
  #codly(number-format: none, languages: codly-languages)
  ```bash
  sudo xbps-install -S os-prober
  ```
  - Then edit `/etc/default/grub` and updade grub configuration:  
  #codly(number-format: none, languages: codly-languages)
  ```bash
  echo "GRUB_DISABLE_OS_PROBER=false" | sudo tee -a /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  ```
+ NetworkManager and dbus
  - First install NetworkManager in dbus then see if it is in `/var/service`.
  ```bash
  sudo xbps-install -S NetworkManager dbus network-manager-applet
  ```
  - Disable other nertwork services like `wpa_supplicant` and `dhcpcd` using    
  ```bash
  sudo sv down wpa_supplicant
  sudo rm -rf /var/service/wpa_supplicant
  sudo sv down dhcpcd
  sudo rm -rf /var/service/dhcpcd
  ```
  - After that create a semilink for dbus and NetworkManager, and enable them.
  ```bash
  sudo ln -s /etc/sv/NetworkManager /var/service
  sudo sv enable NetworkManager
  sudo ln -s /etc/sv/dbus /var/service
  sudo sv enable dbus
  ```
+ Elogind and pipewire
  - Install elogind, pipewire and pulseaudio
  ```bash
  sudo xbps-install -S elogind pipewire pulseaudio pavucontrol
  ```
  - Configure pipewire for system-wide configuration
  ```bash
  sudo mkdir -p /etc/pipewire/pipewire.conf.d
  sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
  ```
  - Configure pulseaudio interface 
  ```bash
  sudo mkdir -p /etc/pipewire/pipewire.conf.d
  sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d
  ```
  - For ALSA integration
  ```bash
  sudo xbps-install -S alsa-pipewire
  sudo mkdir -p /etc/alsa/conf.d
  sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
  sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
  ```
+ Power management: 
- Install power-profiles-daemon and enable it
```bash
sudo xbps-install -S power-profiles-daemon
sudo ln -s /etc/sv/power-profiles-daemon/ /var/service
```
= Install neovim and cli apps
  ```bash
  sudo xbps-install -S neovim  ripgrep nodejs gcc wget curl fzf eza git yazi lazygit github-cli starship zoxide mpv yt-dlp rmpc mpc mpd ffmpeg
  sudo xbps-install -S cargo rust
  cargo install ttyper
  ```
= Configuring niri window manager
+ Install drivers and additional services
  ```bash
  sudo xbps-install -S mesa mesa-vulkan-radeon mesa-dri xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-wlr udiskie udisks2 qt6-wayland
  ```
+ Install niri and some dependencies
  - Niri and apps
  ```bash
  sudo xbps-install -S niri evince Waybar fuzzel wofi foot wlsunset swww wl-clipboard cliphist firefox nautilus swaylock sassc poppler gvfs unzip playerctl  obs mako ImageMagick
  ```
  - Fonts
  ```bash
  sudo xbps-install -S noto-fonts-cjk noto-fonts-cjk-sans noto-fonts-cjk-serif noto-fonts-emoji nerd-fonts nerd-fonts-otf nerd-fonts-symbols-ttf nerd-fonts-ttf dejavu-fonts-ttf liberation-fonts-ttf font-awesome5
  ```
+ To run niri write the following script:
```bash
#!/bin/bash
nohup pipewire > /dev/null & 
dbus-run-session niri --session
``` 
 - Or use the script from the `Scripts` folder and execute when login in. Add this to `.bash_profile`
```bash
if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec /home/c5514/Scripts/goNiri
fi
```
> *[WARNING]* Not sure if to be able to run niri you need to have seatd, it worked but I had elogind enabled too
+ Customizing
  - Install Tela-circle-dark
  ```bash
  git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
  ```
  - Install Orchis Grey Dark theme
  ```bash
  git clone https://github.com/vinceliuice/Orchis-theme.git
  cd Orchis-theme 
  ```
  - Install Bibata-Modern-Ice: First download the tar.xz file
  ```bash
  sudo xbps-install -S xz
  tar -xf Bibata-Modern-Ice.tar.xz
  mv Bibata-Modern-Ice /usr/share/icons
  ```
  - Install set gnome apps to use Orchis theme:
  ```bash
  gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-dark"
  gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Grey-Dark"
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
  gsettings set org.gnome.desktop.interface cursor-size 24
  ```
+ LaTeX and typst
  - Install texlive and some dependencies to work with latexindent:
  ```bash
  sudo xbps-install -S texlive-full biber perl-YAML-Tiny perl-File-HomeDir
  ```
  - Install typst and additional utilities:
  ```bash
  sudo xbps-install -S typst zathura zathura-pdf-poppler inkscape gimp
  ```
+ Enable printer
  - Install some packages and enable cupsd service:
  ```bash
  sudo xbps-install cups system-config-printer
  sudo ln -s /etc/sv/cupsd /var/service
  ```
= Bash configuration and scripts
+ Bash configuration
  - Install bash-completion
    ```bash
    sudo xbps-install -S bash-completion
    ```
  - Then add this to `~/.inputrc`:
    ```bash
    set colored-stats on
    set colored-completion-prefix on
    set show-all-if-ambiguous on
    set show-all-if-unmodified on
    set print-completions-horizontally on
    set completion-ignore-case on
    set visible-stats on
    set mark-directories on
    set mark-symlinked-directories on
    ```
  - And this to `~/.bashrc`:
  ```bash
alias ls='eza --icons'
# alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias nv='nvim'
alias ee='exit'
alias cc='clear'
alias '..'='cd ..'
alias ff='fastfetch'
alias dwn='cd ~/Downloads'
alias doc='cd ~/Documents'
alias bye='sudo shutdown -P now'
alias syl='sudo reboot now'
alias ns='nix-shell --run bash'

PS1='[\u@\h \W]\$ '

export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export MPD_HOST=/tmp/mpd_socket
export HISTCONTROL=ignoreboth
export EDITOR="nvim"
export VISUAl="nvim"
PROMPT_COMMAND="printf '\e[6 q'${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
  ```
+ Fuzzel and wofi scripts:
  - Fuzzel: Clipboard history, launcher, Some tools.
  - Wofi: Wallpapper-selector with swww backend.
