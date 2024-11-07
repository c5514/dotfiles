{ lib, pkgs, inputs,... }:
with lib;
let 
	cfg = config.module.sway.keybindings;
	super = "Mod4";
	
	terminal = "${pkgs.kitty}/bin/kitty";
	appLauncher = "${pkgs.rofi-wayland}/bin/rofi -show drun -theme ~/.config/rofi/launcher.rasi";
	clipboard = "${pkgs.rofi-wayland}/bin/rofi -theme ~/.config/rofi/cliphist2.rasi -modi clipboard:cliphist-rofi-img -show clipboard -show-icons";
in
{
	wayland.windowManager.sway = {
		enable = true;
		xwayland = true;
		config = {
			window = {
				titlebar = false;
			};
			input = {
				"type:pointer" = {
					accel_profile = "flat";
					pointer_accel = "0.3";
				};
				"type/keyboard" = {
					xkb_layout  = "en";
					xkb_variant = "altgr-intl";
				};
				"type/touchpad" = {
					natural_scroll = "disabled";
					tap = "enabled";
					click_method = "button_areas";
				};
			};
			startup = [
				{ command = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"; }
				{ command = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"; }
				{ command = "${pkgs.megacmd}/bin/mega-cmd"; }
			];
		};
	};
}


