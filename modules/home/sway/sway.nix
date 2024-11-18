{ lib, pkgs, inputs,... }:
with lib;
let 
	super = "Mod4";
	workspace1  = "workspace number 1";
	workspace2  = "workspace number 2";
	workspace3  = "workspace number 3";
	workspace4  = "workspace number 4";
	workspace5  = "workspace number 5";
	workspace6  = "workspace number 6";
	workspace7  = "workspace number 7";
	workspace8  = "workspace number 8";
	workspace9  = "workspace number 9";
	workspace10 = "workspace number 10";
	workspace11 = "workspace number 11";
	workspace12 = "workspace number 12";	
	terminal = "wezterm";
	appLauncher = "${pkgs.rofi-wayland}/bin/rofi -show drun -theme ~/.config/rofi/launcher.rasi";
	clipboard = "${pkgs.rofi-wayland}/bin/rofi -theme ~/.config/rofi/cliphist2.rasi -modi clipboard:cliphist-rofi-img -show clipboard -show-icons";
	notification = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
	browser = "${pkgs.firefox}/bin/firefox";
	powermenu = "${pkgs.wlogout}/bin/wlogout";
	filemanager = "${pkgs.nautilus}/bin/nautilus";
in
{
	home.packages = with pkgs; [
		sov
		pywal
		wayshot
		hyprpicker
		autotiling
	];
	imports = [
		./rofi.nix
		./swayidle.nix
		./swaylock.nix
		./swaync.nix
		./waybar/default.nix
		./waypaper.nix
		./wlogout/wlogout.nix
	];
	wayland.windowManager.sway = {
		enable = true;
		xwayland = true;
		config = {
			window = {
				titlebar = false;
				border = 3;
			};
			bars = [
				{
					position = "top";
					command = "${pkgs.waybar}/bin/waybar";
				}
			];
			seat = {
				"*" = {
					xcursor_theme = "Bibata-Modern-Ice 24";
				};
			};
			input = {
				"type:pointer" = {
					accel_profile = "flat";
					pointer_accel = "0.3";
				};
				"*" = {
					xkb_layout = "us";
					xkb_variant = "altgr-intl";
				};
				"type:touchpad" = {
					natural_scroll = "disabled";
					tap = "enabled";
					dwt = "enabled";
					middle_emulation = "enabled";
				};
			};
			startup = [
				{ command = "${pkgs.waypaper}/bin/waypaper --restore &"; }
				{ command = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"; }
				{ command = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"; }
				{ command = "${pkgs.megacmd}/bin/mega-cmd"; }
				{ command = "${pkgs.swayosd}/bin/swayosd-server"; }
				{ command = "${pkgs.autotiling}/bin/autotiling"; }
			];
			inherit terminal;
			modifier= super;
			keybindings = {
				"${super}+Return" = "exec ${terminal}";
				"${super}+q" = "kill";
				"${super}+Space" = "exec ${appLauncher}";
				"${super}+e" = "exec kitty -e yazi";
				"${super}+Shift+e" = "exec ${filemanager}";
				"${super}+v" = "exec ${clipboard}";
				"${super}+Shift+v" = "exec cliphist wipe";
				"${super}+d" = "exec ${notification}";
				"${super}+b" = "exec ${browser}";
				"${super}+w" = "exec ${pkgs.waypaper}/bin/waypaper";
				"${super}+Shift+w" = "exec ${pkgs.waypaper}/bin/waypaper --random";
				"${super}+Backspace" = "exec ${powermenu}";
				"xf86audioraisevolume" = "exec swayosd-client --output-volume raise";
				"xf86audiolowervolume" = "exec swayosd-client --output-volume lower";
				"xf86audiomute" = "exec swayosd-client --output-volume mute-toggle";
				"xf86monbrightnessup" = "exec swayosd-client --brightness raise";
				"xf86monbrightnessdown" = "exec swayosd-client --brightness lower";
				"xf86audioplay" = "exec playerctl play-pause";
				"xf86audionext" = "exec playerctl next";
				"xf86audioprev" = "exec playerctl previous";
				"Print" = "exec wayshot --stdout | wl-copy";
				"${super}+f" = "floating toggle";
				"${super}+Shift+f" = "fullscreen";
				"${super}+h" = "focus left";
				"${super}+j" = "focus down";
				"${super}+k" = "focus up";
				"${super}+l" = "focus right";
				"${super}+Left" = "focus left";
				"${super}+Down" = "focus down";
				"${super}+Up" = "focus up";
				"${super}+Right" = "focus right";
				# Move focused window
				"${super}+Shift+h" = "move left";
				"${super}+Shift+j" = "move down";
				"${super}+Shift+k" = "move up";
				"${super}+Shift+l" = "move right";
				"${super}+Shift+Left" = "move left";
				"${super}+Shift+Down" = "move down";
				"${super}+Shift+Up" = "move up";
				"${super}+Shift+Right" = "move right";
				"${super}+1" = "${workspace1}";
				"${super}+2" = "${workspace2}";
        		"${super}+3" = "${workspace3}";
				"${super}+4" = "${workspace4}";
				"${super}+5" = "${workspace5}";
				"${super}+6" = "${workspace6}";
				"${super}+7" = "${workspace7}";
    			"${super}+8" = "${workspace8}";
    			"${super}+9" = "${workspace9}";
				"${super}+0" = "${workspace10}";
				"${super}+minus" = "${workspace11}";
				"${super}+equal" = "${workspace12}";
				# Switch to scratchpad
    			"${super}+s" = "scratchpad show";
    			# Move window to workspace using number row
				"${super}+Shift+1" = "move container to ${workspace1}";
				"${super}+Shift+2" = "move container to ${workspace2}";
				"${super}+Shift+3" = "move container to ${workspace3}";
				"${super}+Shift+4" = "move container to ${workspace4}";
				"${super}+Shift+5" = "move container to ${workspace5}";
    			"${super}+Shift+6" = "move container to ${workspace6}";
				"${super}+Shift+7" = "move container to ${workspace7}";
    			"${super}+Shift+8" = "move container to ${workspace8}";
    			"${super}+Shift+9" = "move container to ${workspace9}";
    			"${super}+Shift+0" = "move container to ${workspace10}";
    			"${super}+Shift+minus" = "move container to ${workspace11}";
    			"${super}+Shift+equal" = "move container to ${workspace12}";
				# Move window to scratchpad
				"${super}+Shift+z" = "move scratchpad";
				# Resize mode
				"${super}+r" = "mode resize";
			};
			modes = {
				resize = {
					# Shrink windows
					"h" = "resize shrink width 40px";
					"j" = "resize shrink height 40px";
					"k" = "resize shrink height 40px";
					"l" = "resize shrink width 40px";
					"Left"  = "resize shrink width 40px";
					"Down"  = "resize shrink height 40px";
					"Up"    = "resize shrink height 40px";
					"Right" = "resize shrink width 40px";
					# Grow windows
					"Shift+h" = "resize grow width 40px";
					"Shift+j" = "resize grow height 40px";
					"Shift+k" = "resize grow height 40px";
					"Shift+l" = "resize grow width 40px";
					"Shift+Left"  = "resize grow width 40px";
					"Shift+Down"  = "resize grow height 40px";
					"Shift+Up"    = "resize grow height 40px";
    				"Shift+Right" = "resize grow width 40px";
					# Return to normal mode
					"Escape" = "mode default";
					"Return" = "mode default";
				};
			};
			floating = {
				criteria = [
					{
						title = "Spotify";
					}
					{
						title = "WebCord";
					}
					{
						class = "feh";
					}
					{
						class = "Evince";
					}
				];
			};
		};
	};
	services.swayosd.enable = true;
}


