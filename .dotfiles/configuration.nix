{ config, lib, pkgs, inputs,... }:

{
	imports =
	[ # Include the results of the hardware scan.
    	./hardware-configuration.nix
		./config/bootloader.nix
		./config/network.nix
		./config/bluetooth.nix
		./config/sddm.nix
		./config/sound.nix
		./config/printers.nix
		./config/firewall.nix
		./config/vm.nix
		./config/xfce.nix
	];

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
		xkb.layout = "us";
		xkb.variant = "altgr-intl";
		videoDrivers = [ "amdgpu" ];
	};
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
	hardware.i2c.enable = true;
	# hardware.opengl = {
	# 	enable = true;
	# 	# driSupport = true;
	# 	driSupport32Bit = true;
	# };
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.c5514 = {
		isNormalUser = true;
		description = "Cesar Levano";
		extraGroups = [ "networkmanager" "wheel" ];
		# packages = with pkgs; [
		# ];
	};
	# programs.zsh.enable = true;
	programs.fish.enable = true;
	# users.users.c5514.shell = pkgs.zsh;
	users.users.c5514.shell = pkgs.fish;
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	# Hyprland modules
	programs.hyprland.enable = true;
	programs.hyprland.portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
	programs.hyprlock.enable = true;
	# programs.hyprland.xwayland.enable = true;
	environment.systemPackages = 
	(with pkgs; [
		brightnessctl
		wl-clipboard
		playerctl
		pavucontrol
		cliphist
		btop
		unzip
		git
		telegram-desktop
		#USB utilities
		usbutils
		udiskie
		udisks
		#Extra
		material-design-icons
		pavucontrol
		feh
		obs-studio
		libreoffice-qt6-fresh
		thunderbird
		vlc
		hyprshade
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
	# services.gnome.gnome-keyring.enable = true;
	security.polkit.enable = true;
	programs.thunar.enable = true;
	programs.xfconf.enable = true;
	services.gvfs.enable = true;
	services.tumbler.enable = true;
	services.udisks2.enable = true;
	services.libinput.enable = true;
	#To enable power saving
	services.upower.enable = true;
	services.power-profiles-daemon.enable = true;
	powerManagement.powertop.enable = true;
	#To enable Gnome apps outside Gnome 
	programs.dconf.enable = true;
	#To enable Ozone Wayland support
	environment.sessionVariables.NIXOS_OZONE_WL = 1;

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
