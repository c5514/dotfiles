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
= Install neovim and cli apps
  ```bash
  sudo xbps-install -S neovim  ripgrep nodejs gcc wget fzf eza git yazi lazygit github-cli starship zoxide mpv yt-dlp rmpc mpc mpd ffmpeg
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
  sudo xbps-install -S niri evince Waybar fuzzel foot wlsunset swww wl-clipboard cliphist firefox nautilus swaylock sassc poppler gvfs unzip playerctl  obs mako
  ```
  - Fonts
  ```bash
  sudo xbps-install -S noto-fonts-cjk noto-fonts-cjk-sans noto-fonts-cjk-serif noto-fonts-emoji nerd-fonts nerd-fonts-otf nerd-fonts-symbols-ttf nerd-fonts-ttf
  ```
+ To run niri write the following script:
```bash
#!/bin/bash
nohup pipewire > /dev/null & 
dbus-run-session niri --session
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
  #alias ls='ls --color=auto'
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

  eval "$(zoxide init bash)"
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  }
  PS1="\[\033[0;32m\]  \[\033[0;90m\]\[\033[0;100m\]\W\[\033[0;90m\]\[\033[0m\] \[\033[0;35m\]\$(parse_git_branch)\[\033[0;32m\]\n❯ \[\033[0m\]"
  export PATH="$HOME/.config/fuzzel/scripts:$PATH"
  export PATH="$HOME/.cargo/bin:$PATH"
  export MPD_HOST=/tmp/mpd_socket
  export HISTCONTROL=ignoreboth
  export EDITOR="nvim"
  export VISUAl="nvim"
  PROMPT_COMMAND="printf '\e[6 q'${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
  ```
+ Fuzzel scripts
  - Made this in the directory `~/.config/fuzzel/scripts/` and create the file `launcher.sh`
  ```bash
#!/bin/bash
choice=$(printf " Music Player\n Video Player\n󰖟 Web Browser\n󰼭 Typing Test" | fuzzel --dmenu --prompt "Tools: ")

case "$choice" in
    " Music Player") ~/.config/fuzzel/scripts/music.sh ;;
    " Video Player") ~/.config/fuzzel/scripts/videos.sh ;;
    "󰖟 Web Browser") ~/.config/fuzzel/scripts/web.sh ;;
    "󰼭 Typing Test") ~/.config/fuzzel/scripts/ttyper.sh ;;
    *) exit 1 ;;
esac
  ```
  - Music script (`music.sh`):
  ```bash
#!/bin/bash

foot --title="Music Player" -e bash -c '
while true; do
    echo "========================================================"
    echo "                      Music Player                      "
    echo "========================================================"
    echo "1) Open rmpc"
    echo "2) Search and add music to rmpc"
    echo "3) Exit"
    echo ""
    read -p "Choose an option (1-3): " -r choice
    
    case "$choice" in
        1)
            echo "Opening rmpc..."
            rmpc
            ;;
        2)
            echo ""
            echo "Search for music:"
            read -r search_term
            
            if [[ -z "$search_term" ]]; then
                echo "No search term provided"
                continue
            fi
            
            if [[ "$search_term" == http* ]]; then
                echo "Adding URL to rmpc: $search_term"
                rmpc addyt "$search_term"
            else
                echo "Searching for: $search_term"
                echo "Getting YouTube URL..."
                
                # Get the actual YouTube page URL
                youtube_url=$(yt-dlp --get-filename -o "https://www.youtube.com/watch?v=%(id)s" "ytsearch:$search_term" | head -n1)
                
                if [[ -n "$youtube_url" ]]; then
                    echo "Found: $youtube_url"
                    echo "Adding to rmpc..."
                    rmpc addyt "$youtube_url"
                    echo "✓ Song added to queue!"
                else
                    echo "✗ No results found for: $search_term"
                fi
            fi
            echo ""
            ;;
        3|*)
            break
            ;;
    esac
done

echo "Goodbye!"
read -p "Press enter to close..."
'
  ```
  - Videos script (`videos.sh`):
  ```bash
#!/bin/bash
foot --title="Video Player" -e bash -c '
last_input=""
while true; do
    if [[ -z "$last_input" ]]; then
        echo "Video Player - Enter URL or search term:"
        read -r input
        if [[ -z "$input" ]]; then
            echo "No input provided"
            break
        fi
        last_input="$input"
    else
        input="$last_input"
    fi

    if [[ "$input" == http* ]]; then
        echo "Playing URL: $input"
        mpv --ytdl-format="bestvideo[height<=?1080]+bestaudio" "$input"
    else
        echo "Searching for: $input"
        mpv --ytdl-format="bestvideo[height<=?1080]+bestaudio" "ytdl://ytsearch:$input"
    fi
    
    echo ""
    echo "Video finished playing."
    echo "Choose an option:"
    echo "1) Replay same video"
    echo "2) Choose another video"
    echo "3) Exit"
    read -p "Enter your choice (1-3): " -r choice
    
    case "$choice" in
        1)
            echo "Replaying..."
            echo ""
            ;;
        2)
            echo ""
            echo "Video Player - Enter URL or search term:"
            read -r new_input
            if [[ -z "$new_input" ]]; then
                echo "No input provided, exiting..."
                break
            fi
            last_input="$new_input"
            echo ""
            ;;
        3|*)
            break
            ;;
    esac
done
echo "Goodbye!"
read -p "Press enter to close..."
'
  ```
  - Web browser script (`web.sh`):
  ```bash
#!/bin/bash
foot --title="w3m Browser" -e bash -c '
echo "Enter URL or search term:"
read -r query
if [[ "$query" == http* ]]; then
    w3m "$query"
else
    w3m "https://duckduckgo.com/?q=$query"
fi
'
  ```
  - Ttyper script (`ttyper.sh`):
  ```bash
#!/bin/bash
foot --title="Typing test" -e bash -c '
ttyper
'
  ```







