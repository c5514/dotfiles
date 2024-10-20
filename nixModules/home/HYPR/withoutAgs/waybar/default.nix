{
	imports = [./style.nix];
	home.file = {
		"~/.config/waybar/config".source = ./config;
		"~/.config/waybar/modules.json".source = ./modules.json;
	};
	programs.waybar = {
		enable = true;
	};
}
