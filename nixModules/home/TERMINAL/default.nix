{pkgs,...}:
{
	imports = [
		./shell/default.nix
		./fastfetch.nix
		./git.nix
		./kitty.nix
		./yazi.nix
		./zellij.nix
	];
}
