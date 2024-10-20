{pkgs,...}:
{
	#Need to add conditionals for shell:fish,zsh,bash
	imports = [
		./shell/default.nix
		# ./fastfetch.nix
		./git.nix
		./kitty.nix
		./yazi.nix
		./zellij.nix
	];
}
