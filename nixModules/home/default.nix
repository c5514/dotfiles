{inputs,...}:
{
	imports = [
		./TERMINAL/default.nix
		./EDITOR/nixvim/main.nix#Add conditions for editor and remove it from this part
		./PICTURE/default.nix
		./dconf.nix#Remove it for hosts other than main
		./theme.nix
		./APPS/default.nix
	];
}
