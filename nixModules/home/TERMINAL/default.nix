{pkgs,...}:
{
	imports = [
		./shell/default.nix
		./fastfetch.nix
		./git.nix
		./kitty.nix
		# ./tmux.nix
		./yazi.nix
		./zellij.nix
	];
}
