{pkgs, ...}:
{
	home.packages = with pkgs; [
		waypaper
	];
	xdg.configFile."waypaper".source = ./config.ini;
}
