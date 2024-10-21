{ pkgs,inputs, ... }:
{
	imports = [ inputs.ags.homeManagerModules.default ];
	home.packages = with pkgs; [
		inputs.matugen.packages.${system}.default
		fd
		bun
		dart-sass
		gtk3
		hyprpicker
		wf-recorder
		swappy
		slurp
		inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
	];
	programs.ags = {
		enable = true;
		configDir = ./ags;
		extraPackages = with pkgs; [
			gtksourceview
			accountsservice
			webkitgtk_6_0
		];
	};
}
