{inputs,...}:
{
	imports = [
		./PICTURE/default.nix
		./TERMINAL/default.nix
		./EDITOR/nixvim/main.nix#Add conditions for editor and remove it from this part
		./dconf.nix#Remove it for hosts other than main
		./theme.nix
		./APPS/default.nix
	];
}
