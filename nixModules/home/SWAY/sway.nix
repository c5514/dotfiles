{ lib, pkgs, inputs,... }:
with lib;
let 
	super = "Mod4";
	
	terminal = "${pkgs.kitty}/bin/kitty";
	appLauncher = "${pkgs.rofi-wayland}/bin/rofi -show drun -theme ~/.config/rofi/launcher.rasi";
	clipboard = "${pkgs.rofi-wayland}/bin/rofi -theme ~/.config/rofi/cliphist2.rasi -modi clipboard:cliphist-rofi-img -show clipboard -show-icons";
	notification = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
in
{
	home.packages = with pkgs; [
		sov
	];
	imports = [
		./rofi.nix
		./swayidle.nix
		./swaylock.nix
		./swaync.nix
		./waybar/default.nix
		./waypaper.nix
	];
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
			inherit terminal;
			modifier= super;
			keybindings = {
				"--to-code ${super}+Return" = "exec ${terminal}";
				"--to-code ${super}+q" = "kill";
				"--to-code ${super}+Space" = "exec ${appLauncher}";
				"--to-code ${super}+v" = "exec ${clipboard}";
				"--to-code ${super}+d" = "exec ${notification}";
				"--to-code ${super}+f" = "floating toggle";
				"--to-code ${super}+Shift+f" = "fullscreen";
				"--to-code ${super}+h" = "focus left";
				"--to-code ${super}+j" = "focus down";
				"--to-code ${super}+k" = "focus up";
				"--to-code ${super}+l" = "focus right";
				"--to-code ${super}+Left" = "focus left";
				"--to-code ${super}+Down" = "focus down";
				"--to-code ${super}+Up" = "focus up";
				"--to-code ${super}+Right" = "focus right";
				# Move focused window
				"--to-code ${super}+Shift+h" = "move left";
				"--to-code ${super}+Shift+j" = "move down";
				"--to-code ${super}+Shift+k" = "move up";
				"--to-code ${super}+Shift+l" = "move right";
				"--to-code ${super}+Shift+Left" = "move left";
				"--to-code ${super}+Shift+Down" = "move down";
				"--to-code ${super}+Shift+Up" = "move up";
				"--to-code ${super}+Shift+Right" = "move right";
				"--to-code ${super}+1" = "${workspace1}";
				"--to-code ${super}+2" = "${workspace2}";
        		"--to-code ${super}+3" = "${workspace3}";
				"--to-code ${super}+4" = "${workspace4}";
				"--to-code ${super}+5" = "${workspace5}";
				"--to-code ${super}+6" = "${workspace6}";
				"--to-code ${super}+7" = "${workspace7}";
    			"--to-code ${super}+8" = "${workspace8}";
    			"--to-code ${super}+9" = "${workspace9}";
				"--to-code ${super}+0" = "${workspace10}";
				"--to-code ${super}+minus" = "${workspace11}";
				"--to-code ${super}+equal" = "${workspace12}";
				# Switch to scratchpad
    			"--to-code ${super}+s" = "scratchpad show";
    			# Move window to workspace using number row
				"--to-code ${super}+Shift+1" = "move container to ${workspace1}";
				"--to-code ${super}+Shift+2" = "move container to ${workspace2}";
				"--to-code ${super}+Shift+3" = "move container to ${workspace3}";
				"--to-code ${super}+Shift+4" = "move container to ${workspace4}";
				"--to-code ${super}+Shift+5" = "move container to ${workspace5}";
    			"--to-code ${super}+Shift+6" = "move container to ${workspace6}";
				"--to-code ${super}+Shift+7" = "move container to ${workspace7}";
    			"--to-code ${super}+Shift+8" = "move container to ${workspace8}";
    			"--to-code ${super}+Shift+9" = "move container to ${workspace9}";
    			"--to-code ${super}+Shift+0" = "move container to ${workspace10}";
    			"--to-code ${super}+Shift+minus" = "move container to ${workspace11}";
    			"--to-code ${super}+Shift+equal" = "move container to ${workspace12}";
				# Move window to scratchpad
				"--to-code ${super}+Shift+z" = "move scratchpad";
				# Resize mode
				"--to-code${super}+r" = "mode resize";
			};
			modes = {
				resize = {
					# Shrink windows
					"h" = "resize shrink width 10px";
					"j" = "resize shrink height 10px";
					"k" = "resize shrink height 10px";
					"l" = "resize shrink width 10px";
					"Left"  = "resize shrink width 10px";
					"Down"  = "resize shrink height 10px";
					"Up"    = "resize shrink height 10px";
					"Right" = "resize shrink width 10px";
					# Grow windows
					"Shift+h" = "resize grow width 10px";
					"Shift+j" = "resize grow height 10px";
					"Shift+k" = "resize grow height 10px";
					"Shift+l" = "resize grow width 10px";
					"Shift+Left"  = "resize grow width 10px";
					"Shift+Down"  = "resize grow height 10px";
					"Shift+Up"    = "resize grow height 10px";
    				"Shift+Right" = "resize grow width 10px";
					# Return to normal mode
					"Escape" = "mode default";
					"Return" = "mode default";
				};
			};
		};
	};
	services.swayosd.enable = true;
}


