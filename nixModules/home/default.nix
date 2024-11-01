{inputs,...}:
{
	imports = [
		./PICTURE/default.nix
		./TERMINAL/default.nix
		./EDITOR/nixvim/main.nix
		./EDITOR/emacs.nix
		./EDITOR/vscodium.nix
		./dconf.nix#Remove it for hosts other than main
		./theme.nix
		./APPS/default.nix
	];
}
