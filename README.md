# Dotfiles for NixOS:
## 21/08/2024
Includes:
- Neovim configuration for TeX editing and required dependecies for pdf compilation
- Emacs simple configuration using Org and Elpaca package manager.
- Installation of Hyprland, without including its configuration using home manager. For future updates, this feature will be included as well Aquamarine implementation.
- Waybar, rofi-wayland, kitty, waypaper, pywal, hyprland, hyprlock, hypridle configurations in .config directory.
## 24/08/2024
New changes:
- New default shell: Zsh
- Disabled amd-gpu at the beginning of booting
- Disabled battery saving configurations due to conflict with optimal performance.
## 25/08/2024
New changes: 
- Enabled amd-gpu at the beginning of booting.
- New Hyprland animations in hyprland.conf
- Waybar: App launcher buttom, hyprshader buttom are fixed.
- New bootloader, systemd boot is replaced by grub bootloader with a custom theme.
- Using display manager gdm in services.xserver.displayManager.gdm.
- Added Plymouth with breeze theme.
- Moved some packages from configuration.nix to home.nix and installed ags for future change of status bar(waybar -> ags).
## 05/09/2024
- Changed waybar for hyprpanel.
- Enabled dependencies for hyprpanel.
- Bluetooth needs to be configured.
