{pkgs, ...}:
{
	home.packages = with pkgs; [
		waypaper
	];
	# home.file = {
	# 	".config/waypaper/config.ini".source = ./config.ini;
	# };
}
