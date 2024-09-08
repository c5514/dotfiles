{ config, lib, pkgs, pkgs-unstable, grub2-themes,... }:

{
	imports =
	[ # Include the results of the hardware scan.
    	./hardware-configuration.nix
		./config/bootloader.nix
		./config/bluetooth.nix
		./config/sddm.nix
		./config/sound.nix
		./config/printers.nix
		./config/firewall.nix
	];
	networking.hostName = "nixos"; # Define your hostname.
	#networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;
	# Set your time zone.
	time.timeZone = "America/Lima";
	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	console = {
		earlySetup = true;
		font = "ter-v20n";
		packages = with pkgs; [ terminus_font ];
		keyMap = "us";
	};
	#Configure keymap in X11
	services.xserver = {
		# enable = true;
		layout = "us";
		xkbVariant = "altgr-intl";
		videoDrivers = [ "amdgpu" ];
	};
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.c5514 = {
		isNormalUser = true;
		description = "Cesar Levano";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
	programs.zsh.enable = true;
	users.users.c5514.shell = pkgs.zsh;
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	# Hyprland modules
	programs.hyprland.enable = true;
	programs.hyprlock.enable = true;
	services.hypridle.enable = true;
	programs.hyprland.xwayland.enable = true;
	environment.systemPackages = 
	(with pkgs; [
		firefox
		#Utilities
		grim
		slurp
		brightnessctl
		wl-clipboard
		playerctl
		pavucontrol
		cliphist
		htop
		unzip
		
		kitty
		texliveFull

		pywal
		telegram-desktop
		#USB utilities
		usbutils
		udiskie
		udisks
		#Extra
		rofi-wayland
		waypaper
		wlogout
		material-design-icons
		pavucontrol
		gnome.nautilus
		feh
		obs-studio
		libreoffice-qt6-fresh
		thunderbird
		spotify
		vlc
		#Hyprland
		hyprland
		hyprpaper
		hyprshade
		xdg-desktop-portal-hyprland
	])
	++
	(with pkgs-unstable; [
		fastfetch
	]);
	fonts.packages = with pkgs;[
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		fira-code
		fira-code-symbols
		fira-sans
		font-awesome
		jetbrains-mono
		freefont_ttf
		(nerdfonts.override {fonts = ["JetBrainsMono"];})
	];
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	security.polkit.enable = true;
	#To enable trash and USB support in nautilus
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	#To enable power saving
	services.upower.enable = true;
	services.power-profiles-daemon.enable = true;
	powerManagement.powertop.enable = true;

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
