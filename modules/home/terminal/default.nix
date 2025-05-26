{pkgs,...}:
{
	imports = [
		./shell/default.nix
		./fastfetch.nix
		./git.nix
    ./ghostty.nix
		# ./kitty.nix
		# ./tmux.nix
		./yazi.nix
		# ./zellij.nix
		# ./wezterm.nix
	];
  home.packages = with pkgs; [
    ghostty
  ];
}
