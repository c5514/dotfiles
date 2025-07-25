= Arch linux installation
= Connect to wifi: 
  - Verify that with `rfkill` that it is unblocked. 
  - Run `iwctl` and then
  ```bash
  device list
  stations name scan
  station name get-networks
  stations name name connect SSID
  exit
  ```
  - Verify that it is connected to wifi with `ping archlinux.org`.
- Problem with timedatectl: 
  - Type `nano /etc/systemd/timesyncd.conf` and add `NTP=time.google.com`. Then run `systemctl restart systemd-timesyncd`.
  - Verify with `timedatetctl`.
- Partitioning
  - Run `lsblk` to see the partition table and then run `cfdisk /dev/name`.
  - Then create three partitions: `swap_partition`, `root_partition` and `boot_partition`; with the types: `Linux swap`, `Linux filesystem`, `EFI system`, respectively. Then select `Write` and confirm.
  - To format those partitions:
  ```bash
  mkfs-vfat -F 32 /dev/boot_partition
  mkfs.btrfs -f /dev/root_partition
  mkswap /dev/swap_partition
  ```
  - Btrfs subvolumes:
  ```bash
  mount /dev/root_partition /mnt
  btrfs su cr /mnt/@
  btrfs su cr /mnt/@home
  btrfs su cr /mnt/@pkg
  btrfs su cr /mnt/@log
  btrfs su cr /mnt/@snapshots
  umount /mnt
  ```
  - Mountpoints:
  ```bash
  mkdir /mnt/archinstall
  mount -o noatime,compress=zstd:5,discard=async,space_cache=v2,subvol=@ /dev/root_partition /mnt/archinstall
  mkdir -p /mnt/archinstall/home
  mkdir -p /mnt/archinstall/var/cache/pacman/pkg
  mkdir -p /mnt/archinstall/var/log
  mkdir -p /mnt/archinstall/.snapshots
  mount -o noatime,compress=zstd:5,discard=async,space_cache=v2,subvol=@home /dev/root_partition /mnt/archinstall/home
  mount -o noatime,compress=zstd:5,discard=async,space_cache=v2,subvol=@pkg /dev/root_partition /mnt/archinstall/var/cache/pacman/pkg
  mount -o noatime,compress=zstd:5,discard=async,space_cache=v2,subvol=@log /dev/root_partition /mnt/archinstall/var/log
  mount -o noatime,compress=zstd:5,discard=async,space_cache=v2,subvol=@snapshots /dev/root_partition /mnt/archinstall/.snapshots
  mount -p /mnt/archinstall/boot
  mount /dev/boot_partition /mnt/archinstall/boot
  swapon /dev/swap_partition
  ```
  - Arch install:
    - Select the mirror, locales, user.
    - Disk configuration: Select `Pre-mounted configuration` and type `/mnt/archinstall`.
    - Bootloader: Select `grub`.
    - Optional repositories: `Multilib`
    - Additional packages: Select with `TAB`, then press `ENTER`.
  - Grub configuration:
  After installation select `chroot`, then run:
  ```bash
  grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
  grub-mkconfig -o /boot/grub/grub.cfg
  ```
= App installation
- Neovim
```bash
sudo pacman -S neovim npm fzf ripgrep git curl wget npm lazygit yazi
```
- Utils
```bash
sudo pacman -S brightnessctl playerctl upower power-profiles-daemon wl-clipboard cliphist unzip foot 7zip udiskie udisks2 gvfs ImageMagick poppler 
```
- Shell programs
```bash
sudo pacman -S fish starship zoxide eza github-cli
```
- Cli apps
```bash
sudo pacman -S btop cava ttyper 
```
- Fonts
```bash
sudo pacman -S ttf-liberation ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra cantarell-fonts ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono 
```
- LaTeX
```bash
paru -S texlive-full
sudo pacman -S typst zathura zathura-pdf-poppler
sudo pacman -S biber perl-yaml-tiny perl-file-homedir
sudo fmtutil-sys --all
```
- Hyprland
```bash
sudo pacman -S hyprlock hypridle hyprsunset hyprpicker nautilus tela-circle-icon-theme-blue swww fuzzel
sudo pacman -S xdg-desktop-portal-gtk xdg-desktop-portal-gnome qt5-wayland qt6-wayland uwsm
paru -S bibata-cursor-theme grimblast-git matugen-bin
```
- Aplications
```bash
sudo pacman -S firefox spotify-launcher inkscape python-tinycss2 gtksourceview3
```
- Games
```bash
paru -S protonup-qt
sudo pacman -S lib32-mesa steam
sudo pacman -S gamemode lib32-gamemode
sudo gpasswsd -a c5514 gamemode
```
= Ricing:
  - GTK theme:
  ```bash
  gsettings set org.gnome.desktop.interface icon-theme "'Tela-circle-blue-dark'" 
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  ```
  - Inkscape window problem:
  ```bash
  sudo cp /usr/share/applications/org.inkscape.Inkscape.desktop ~/.local/share/applications/
  sudo sed -i 's/^Exec=inkscape/Exec=env GDK_BACKEND=x11 inkscape/' ~/.local/share/applications/org.inkscape.Inkscape.desktop
  update-desktop-database ~/.local/share/applications/
  ```
