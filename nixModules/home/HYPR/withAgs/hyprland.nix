{ pkgs, inputs,... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
		systemd.enable = true;
		xwayland.enable = true;
		# plugins = [
		# 	inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
		# ];
		settings = {
			monitor = ",preferred, auto, 1";
			#Autostart
			exec-once = [
				"ags &"
				"hypridle &"
				"mega-cmd &"
				"wl-paste --type text --watch cliphist store"
				"wl-paste --type image --watch cliphist store"
				"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
				"dbus-update-activation-environment --systemd --all"
				"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
			];
			#Set cursor theme
			env = [
				"HYPRCURSOR_THEME, Bibata-Modern-Ice"
				"HYPRCURSOR_SIZE, 24"
				"XCURSOR_THEME, Bibata-Modern-Ice"
				"XCURSOR_SIZE,24"
				"GDK_BACKEND,wayland,x11,*"
				"QT_QPA_PLATFORM,wayland;xcb"
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_TYPE,wayland"
				"XDG_SESSION_DESKTOP,Hyprland"
			];
			#Programs
			"$terminal" = "kitty";
			"$fileManager" = "nautilus";
			"$menu" = "rofi -show drun -theme ~/.config/rofi/launcher.rasi";
			"$clipboard" = "rofi -theme ~/.config/rofi/cliphist2.rasi -modi clipboard:cliphist-rofi-img -show clipboard -show-icons";
			# "$menu" = "ags -t launcher";
			# "$clipboard" = "ags -r 'launcher.open(\":ch\")'";
			"$browser" = "firefox";
			#Input
			input = {
				kb_layout = "us";
				kb_variant = "altgr-intl";
				follow_mouse = 1;
				sensitivity = 0;
				touchpad = {
					natural_scroll = false;
				};
				float_switch_override_focus = 2;
				numlock_by_default = true;
			};
			#General
			general = {
				gaps_in = 2;
				gaps_out = 5;
				border_size = 4;
				"col.active_border" = "rgba(33ccff99) rgba(7147DDaa) rgba(9848D688) rgba(7147DD99) rgba(33ccff88) 45deg";
    			"col.inactive_border" = "rgba(595959aa)";
				resize_on_border  = true;
				allow_tearing = false;
				layout = "dwindle";
			};
			#Dwindle and Master
			dwindle = {
				pseudotile = "yes";
				preserve_split = "yes";
			};
			master = {
				new_status = "master";
			};
			#Decoration
			decoration = {
				rounding = 15;
				active_opacity = 1.0;
				inactive_opacity = 0.9;
				shadow = {
					enabled = true;
					color = "rgba(1a1a1aee)";
					render_power = 3;
					range = 4;
				};
				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};
			#Animations
			animations = {
				enabled = true;
				bezier = [
					"linear, 0, 0, 1, 1"
					"md3_standard, 0.2, 0, 0, 1"
					"md3_decel, 0.05, 0.7, 0.1, 1"
					"md3_accel, 0.3, 0, 0.8, 0.15"
					"overshot, 0.05, 0.9, 0.1, 1.1"
					"crazyshot, 0.1, 1.5, 0.76, 0.92"
					"hyprnostretch, 0.05, 0.9, 0.1, 1.0"
					"menu_decel, 0.1, 1, 0, 1"
					"menu_accel, 0.38, 0.04, 1, 0.07"
					"easeInOutCirc, 0.85, 0, 0.15, 1"
					"easeOutCirc, 0, 0.55, 0.45, 1"
					"easeOutExpo, 0.16, 1, 0.3, 1"
					"softAcDecel, 0.26, 0.26, 0.15, 1"
					"md2, 0.4, 0, 0.2, 1" # use with .2s duration
				];
				animation = [
					"windows, 1, 3, md3_decel, popin 60%"
					"windowsIn, 1, 3, md3_decel, popin 60%"
					"windowsOut, 1, 3, md3_accel, popin 60%"
					"border, 1, 10, default"
					"fade, 1, 3, md3_decel"
					"layers, 1, 2, md3_decel, slide"
					"layersIn, 1, 3, menu_decel, slide"
					"layersOut, 1, 1.6, menu_accel"
					"fadeLayersIn, 1, 2, menu_decel"
					"fadeLayersOut, 1, 4.5, menu_accel"
					"workspaces, 1, 7, menu_decel, slide"
					# "workspaces, 1, 2.5, softAcDecel, slide"
					# "workspaces, 1, 7, menu_decel, slidefade 15%"
					# "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
					"specialWorkspace, 1, 3, md3_decel, slidevert"
				];
			};
			gestures = {
				workspace_swipe = true;
			};

			device = {
    			name = "epic-mouse-v1";
    			sensitivity = -0.5;
			};
			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};
			#Keybindings
			"$mainMod" = "SUPER";
			bind = [
				"$mainMod, RETURN, exec, $terminal"
				"$mainMod, Q, killactive,"
				"$mainMod, M, exec, exit"
				"$mainMod, E, exec, kitty -e yazi"
				"$mainMod SHIFT, E, exec, $fileManager"
				"$mainMod, F, togglefloating"
				"$mainMod, SPACE, exec, $menu"
				"$mainMod, P, pseudo,"
				"$mainMod, T, togglesplit,"
				"$mainMod, B, exec, $browser"
				"$mainMod, BACKSPACE, exec, ags -t powermenu"
				"$mainMod, N, exec,  if hyprshade current | grep -q 'blue-light-filter'; then hyprshade off; else hyprshade on blue-light-filter; fi"
				"$mainMod, D, exec, ags -t datemenu"
				"$mainMod, M, exec, ags -t quicksettings"
				#Workspaces overview
				# "$mainMod, R, overview:toggle"
				"$mainMod, R, exec, ags -t overview"
				#Screenshot
				", PRINT, exec, grimblast copy screen"
				"$mainMod, PRINT, exec, grimblast copy active"
				"$mainMod SHIFT, PRINT, exec, grimblast copy area"
				#Cliphist
				"$mainMod, V, exec, $clipboard"
				"$mainMod CTRL, V, exec, cliphist wipe"
				#Change focus of workspace
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"
				#Change focus of workspace using vim-like keybindings
				"$mainMod, H, movefocus, l"
				"$mainMod, L, movefocus, r"
				"$mainMod, K, movefocus, u"
				"$mainMod, J, movefocus, d"
				#Resize active panel
				"$mainMod SHIFT, L, resizeactive, 40 0"
				"$mainMod SHIFT, H, resizeactive, -40 0"
				"$mainMod SHIFT, K, resizeactive, 0 -40"
				"$mainMod SHIFT, J, resizeactive, 0 40"
				#Switch workspaces
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				#Move active window to a workspace
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
				#Special workspace
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"
				#Scroll through existing workspaces
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
				#Move through existing workspaces
				"$mainMod, Tab, workspace, e+1"
				"$mainMod SHIFT, Tab, workspace, e-1"
			];
			binds = {
				allow_workspace_cycles = true;
			};
			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];
			bindl = [
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPrev, exec, playerctl previous"
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			];
			bindle = [
				", XF86MonBrightnessUp, exec, brightnessctl -q s 5%+"
				", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
				", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
			];
			windowrule = let 
				f = regex: "float, ^(${regex})$";
				in [
				# (f "waypaper")
				(f "com.github.Aylur.ags")
				(f "org.gnome.Calculator")
				(f "org.gnome.Weather")
				(f "org.inkscape.Inkscape")
				(f "org.gnome.Settings")
				"workspace 7 silent, title:Telegram"
				"workspace 7 silent, title:Spotify"
				"workspace 7 silent, title:WebCord"
			];
			windowrulev2 = [
				"suppressevent maximize, class:.*"
				"float,class:(xdg-desktop-portal-gtk)"
				"center,class:(xdg-desktop-portal-gtk)"
				"float,class:(firefox),title:(Library)"
				"center,class:(firefox),title:(Library)"
				"float,class:(evince),title:(Print)"
				"center,class:(evince),title:(Print)"
				"float,class:(evince),title:(Save As...)"
				"center,class:(evince),title:(Save As...)"
				"float,class:(evince),title:(Properties)"
				"center,class:(evince),title:(Properties)"
				"float,class:(simple-scan),title:(Print)"
				"float,class:(simple-scan),title:(Preferences)"
				"float,class:(simple-scan),title:(About)"
				"float,class:(Zotero)"
				"size 50% 50%,class:(Zotero),title:(Zotero)"
				"size 80% 80%,class:(org.inkscape.Inkscape),title:(Inkscape)"

				"float,title:(TexText)"
				"move 80% 6%,class:(TexText)"
				"float,class:(soffice)"
				"center,class:(soffice)"
				# "stayfocused,title:(MainPicker)"
				"float,class:(org.gnome.Nautilus),title:(Open File)"
				"center,class:(org.gnome.Nautilus),title:(Open File)"
				"float,class:(org.gnome.Nautilus),title:(Properties)"
				"center,class:(org.gnome.Nautilus),title:(Properties)"
				"float,class:(org.telegram.desktop)"
				"move 60% 6%,class:(org.telegram.desktop)"
				"size 35% 45%,class:(org.telegram.desktop)"
				"bordersize 2, class:(kitty)"
				"float,title:(Spotify)"
				"bordercolor rgba(f5dd27aa) rgba(ffffffaa) rgba(33ccffaa) 45deg,title:(Spotify)"
				"size 50% 50%,title:(Spotify)"
				"move 2% 10%,title:(Spotify)"
				"float,class:(WebCord)"
				"move 53% 53%,class:(WebCord)"
				"size 46% 45%,class:(WebCord)"
				"float,class:(nm-connection-editor)"
				"size 35% 60%,class:(nm-connection-editor)"
				"center,class:(nm-connection-editor)"
				"float,class:(org.pulseaudio.pavucontrol)"
				"center,title:(Volume Control)"
				"size 60% 50%,title:(Volume Control)"
				"float,class:(blueberry.py)"
				"size 35% 60%,class:(blueberry.py)"
				"center,class:(blueberry.py)"
				"float,class:(feh)"
				"size 50% 50%,class:(feh)"
				"center,class:(feh)"
			];
		};
	};
}
