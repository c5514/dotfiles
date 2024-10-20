{ pkgs, lib,modulesPath,...}:
{
	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
	];
	nixpkgs = {
		hostPlatform = lib.mkDefault "x86_64-linux";
		config.allowUnfree = true;
	};
	nix.settings.experimental-features = ["nix-command" "flakes"];
	networking = {
		hostName = "iso";
	};
	environment.systemPackages = with pkgs; [
		neovim
		disko
		git
		parted
	];
	users.extraUsers.root.password = "nixos";
}
