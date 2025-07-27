#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}=== $1 ===${NC}"
}

# Function to check if command succeeded
check_success() {
    if [ $? -eq 0 ]; then
        print_status "$1 completed successfully"
    else
        print_error "$1 failed"
        exit 1
    fi
}

# Function to ask yes/no questions
ask_yes_no() {
    while true; do
        read -r -p "$1 (yes/no): " choice
        choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')
        case "$choice" in
            yes|y) return 0 ;;
            no|n) return 1 ;;
            *) echo "Please answer yes or no." ;;
        esac
    done
}

print_header "System Update"
sudo pacman -Syu --noconfirm
check_success "System update"

print_header "Installing Core Development Tools"
sudo pacman -S --needed --noconfirm neovim npm fzf ripgrep git curl wget lazygit yazi
check_success "Core tools installation"
INSTALLED_COMPONENTS+=("Development Tools (neovim, git, npm, fzf, ripgrep, lazygit, yazi)")

print_header "Installing System Utilities"
sudo pacman -S --needed --noconfirm \
    brightnessctl playerctl upower power-profiles-daemon \
    wl-clipboard cliphist unzip 7zip udiskie udisks2 gvfs \
    imagemagick poppler fish starship zoxide eza github-cli \
    btop cava ttyper dart-sass gnome-bluetooth-3.0 bluez bluez-utils \
    easyeffects mpv mpd
check_success "System utilities installation"
INSTALLED_COMPONENTS+=("CLI Utilities (brightnessctl, playerctl, fish, starship, zoxide, eza, btop, cava, etc.)")

print_header "Installing Fonts"
sudo pacman -S --needed --noconfirm \
    ttf-liberation ttf-jetbrains-mono-nerd ttf-jetbrains-mono \
    ttf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji \
    noto-fonts-extra cantarell-fonts ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono
check_success "Fonts installation"
INSTALLED_COMPONENTS+=("Font Packages (JetBrains Mono, Nerd Fonts, Noto Fonts, Font Awesome)")

# Installation tracking
INSTALLED_COMPONENTS=()

# AUR Helper Installation
if ask_yes_no "Do you want to install an AUR helper?"; then
    print_header "Installing AUR Helper"
    
    # Install base-devel if not already installed
    sudo pacman -S --needed --noconfirm base-devel
    
    # Ask which AUR helper
    while true; do
        read -r -p "Which AUR helper would you like to use? (yay/paru): " aur_helper
        aur_helper=$(echo "$aur_helper" | tr '[:upper:]' '[:lower:]')
        case "$aur_helper" in
            yay|paru) break ;;
            *) echo "Please choose yay or paru." ;;
        esac
    done
    
    tmpdir=$(mktemp -d)
    
    if [[ "$aur_helper" == "yay" ]]; then
        print_status "Installing yay..."
        git clone --depth=1 https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
        (cd "$tmpdir/yay-bin" && makepkg -si --noconfirm)
        check_success "Yay installation"
    else
        print_status "Installing paru..."
        git clone --depth=1 https://aur.archlinux.org/paru.git "$tmpdir/paru"
        (cd "$tmpdir/paru" && makepkg -si --noconfirm)
        check_success "Paru installation"
    fi
    
    rm -rf "$tmpdir"
    AUR_HELPER_INSTALLED=true
    INSTALLED_COMPONENTS+=("AUR Helper ($aur_helper)")
else
    print_warning "AUR helper installation skipped."
    AUR_HELPER_INSTALLED=false
fi

# Hyprland Installation
if ask_yes_no "Do you want to install Hyprland and applications?"; then
    print_header "Installing Hyprland and Applications"
    
    sudo pacman -S --needed --noconfirm \
        hyprland hyprlock hypridle hyprsunset hyprpicker \
        nautilus swww fuzzel firefox spotify-launcher \
        qt5-wayland qt6-wayland foot uwsm
    check_success "Hyprland packages installation"
    INSTALLED_COMPONENTS+=("Hyprland Desktop Environment (hyprland, hyprlock, hypridle, uwsm)")
    
    # Install AUR packages if AUR helper is available
    if [[ "$AUR_HELPER_INSTALLED" == true ]]; then
        print_status "Installing AUR packages..."
        $aur_helper -S --noconfirm \
            tela-circle-icon-theme-blue \
            bibata-cursor-theme \
            grimblast-git \
            matugen-bin
        check_success "AUR packages installation"
        INSTALLED_COMPONENTS+=("Desktop Themes & Tools (Tela icons, Bibata cursors, Grimblast, Matugen)")
        
        # Set GTK theme
        print_status "Setting GTK theme..."
        gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-blue-dark'
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        check_success "GTK theme configuration"
    else
        print_warning "Skipping AUR packages (no AUR helper installed)"
    fi
    
    # Inkscape X11 workaround
    print_status "Setting up Inkscape X11 workaround..."
    sudo pacman -S --needed --noconfirm inkscape python-tinycss2 gtksourceview3
    
    # Create ~/.local/share/applications if it doesn't exist
    mkdir -p ~/.local/share/applications/
    
    # Copy and modify Inkscape desktop file
    cp /usr/share/applications/org.inkscape.Inkscape.desktop ~/.local/share/applications/
    sed -i 's/^Exec=inkscape/Exec=env GDK_BACKEND=x11 inkscape/' ~/.local/share/applications/org.inkscape.Inkscape.desktop
    update-desktop-database ~/.local/share/applications/
    check_success "Inkscape configuration"
    INSTALLED_COMPONENTS+=("Applications (Nautilus, Firefox, Spotify, Foot terminal, Fuzzel launcher)")
    
    # Configure UWSM for auto-start
    print_status "Configuring UWSM auto-start..."
    if [ ! -f ~/.bash_profile ]; then
        touch ~/.bash_profile
    fi
    
    # Check if UWSM configuration already exists
    if ! grep -q "uwsm check may-start" ~/.bash_profile; then
        cat >> ~/.bash_profile << 'EOF'

# UWSM auto-start
if uwsm check may-start && uwsm select; then
    exec uwsm start default
fi
EOF
        check_success "UWSM auto-start configuration"
    else
        print_status "UWSM configuration already exists in ~/.bash_profile"
    fi
else
    print_warning "Skipping Hyprland installation..."
fi

# LaTeX Installation
if ask_yes_no "Do you want to install LaTeX dependencies? It might take a while."; then
    print_header "Installing LaTeX Dependencies"
    
    if [[ "$AUR_HELPER_INSTALLED" == true ]]; then
        $aur_helper -S --noconfirm texlive-full
        check_success "TeXLive installation"
    else
        print_error "AUR helper required for TeXLive installation"
        exit 1
    fi
    
    sudo pacman -S --needed --noconfirm \
        typst zathura zathura-pdf-poppler biber \
        perl-yaml-tiny perl-file-homedir
    check_success "LaTeX utilities installation"
    
    print_status "Updating LaTeX format files..."
    sudo fmtutil-sys --all
    check_success "LaTeX format update"
    INSTALLED_COMPONENTS+=("LaTeX Environment (TeXLive, Typst, Zathura, Biber)")
else
    print_warning "Skipping LaTeX dependencies..."
fi

# Config files installation
if ask_yes_no "Do you want to copy configuration files from ./config?"; then
    print_header "Installing Configuration Files"
    
    if [ -d "./config" ]; then
        # Create ~/.config if it doesn't exist
        mkdir -p ~/.config
        
        print_status "Backing up existing config files..."
        # Create backup of existing configs
        backup_dir=~/.config_backup_$(date +%Y%m%d_%H%M%S)
        mkdir -p "$backup_dir"
        
        # Copy existing configs to backup (if they exist)
        for item in ./config/*; do
            if [ -e "$item" ]; then
                basename_item=$(basename "$item")
                if [ -e ~/.config/"$basename_item" ]; then
                    cp -r ~/.config/"$basename_item" "$backup_dir/"
                    print_status "Backed up existing $basename_item to $backup_dir"
                fi
            fi
        done
        
        # Copy new config files
        print_status "Copying configuration files..."
        cp -r ./config/* ~/.config/
        check_success "Configuration files installation"
        INSTALLED_COMPONENTS+=("Configuration Files (dotfiles copied to ~/.config)")
        
        print_status "Config backup created at: $backup_dir"
    else
        print_error "./config directory not found"
    fi
else
    print_warning "Skipping configuration files installation..."
fi

print_header "Installation Complete!"
print_status "Your system has been set up successfully."

echo -e "\n${GREEN}Installed components:${NC}"
for i in "${!INSTALLED_COMPONENTS[@]}"; do
    echo "$(($i + 1)). ${INSTALLED_COMPONENTS[$i]}"
done

if [[ "$AUR_HELPER_INSTALLED" == true ]]; then
    echo -e "\n${GREEN}AUR helper ($aur_helper) is available for future package installations.${NC}"
fi
