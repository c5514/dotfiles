{ config, lib, pkgs, inputs,... }:
{
	imports = [
    	./hardware-configuration.nix
		../../nixModules/config/bootloader.nix
		../../nixModules/config/Utils/default.nix
		../../nixModules/config/Network/default.nix
		../../nixModules/config/DeskEnv/gnome.nix
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
		windowManager.awesome = {
			enable = true;
			luaModules = with pkgs.luaPackages; [
				luarocks
				luadbi-mysql
			];
		};
	};
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
	hardware.i2c.enable = true;
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.c5514 = {
		isNormalUser = true;
		description = "Cesar Levano";
		extraGroups = [ "networkmanager" "wheel" "scanner" "lp"];
		shell = pkgs.fish;
		# packages = with pkgs; [
		# ];
	};
	programs.fish.enable = true;
	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
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
		usbutils
		udiskie
		udisks
		material-design-icons
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
		material-icons
		jetbrains-mono
		freefont_ttf
		inter
		(nerdfonts.override {fonts = ["JetBrainsMono" "NerdFontsSymbolsOnly"];})
	];
	xdg.portal.enable = true;
	services.gnome.gnome-keyring.enable = true;
	security.polkit.enable = true;
	security.pam.services.swaylock = {};
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	services.libinput.enable = true;
	#To enable power saving
	services.upower.enable = true;
	services.power-profiles-daemon.enable = true;
	powerManagement.powertop.enable = true;
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
