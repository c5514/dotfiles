{ pkgs, lib,modulesPath,...}:
{
	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-graphical-gnome.nix"
		"${modulesPath}/installer/cd-dvd/channel.nix"
	];
	nixpkgs = {
		hostPlatform = lib.mkDefault "x86_64-linux";
		config.allowUnfree = true;
	};
	nix = {
		settings.experimental-features = ["nix-command" "flakes"];
		extraOptions = "experimental-features = nix-command flakes";
	};
	boot = {
		kernelPackages = pkgs.linuxPackages_latest;
		supportedFilesystems = lib.mkForce ["btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];
	};
	networking = {
		hostName = "iso";
	};
	systemd = {
		services.sshd.wantedBy = pkgs.lib.mkForce ["multi-user.target"];
		targets = {
    		sleep.enable = false;
    		suspend.enable = false;
    		hibernate.enable = false;
    		hybrid-sleep.enable = false;
		};
	};

	environment.systemPackages = with pkgs; [
		neovim
		disko
		git
		parted
	];
	# home-manager.users.nixos = import ./home.nix;
	users.extraUsers.root.password = "nixos";
}
