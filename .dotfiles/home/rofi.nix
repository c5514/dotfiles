{pkgs, ...}:
{
		programs.rofi.enable = true;
		programs.rofi.package = pkgs.rofi-wayland;
		home.file = {
			".config/rofi/launcher.rasi".source = ./rofi/launcher.rasi;
			".config/rofi/custom_theme.rasi".source = ./rofi/custom_theme.rasi;
			".config/rofi/cliphist.rasi".source = ./rofi/cliphist.rasi;
			".config/rofi/wallpaper-select.rasi".source = ./rofi/wallpaper-select.rasi;
			".config/wal/templates/colors-rofi.rasi".source = ./rofi/colors-rofi.rasi;
		};
}
