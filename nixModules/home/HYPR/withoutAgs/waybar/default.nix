{
	imports = [./style.nix];
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
			layer = "top";
			position = "top";
			height = 30;
			output = [ "eDP-1" "HDMI-A-1" ];
			};
			modules-left = [
    			"custom/appmenu"
        		"hyprland/language"
        		"cpu"
        		"custom/empty"
        		"group/links"
        		"hyprland/window"
    			"custom/empty"
			];
			modules-center = [ "hyprland/workspaces" ];
			modules-right = [
				"pulseaudio"
    			"backlight"
    			"bluetooth"
    			"battery"
    			"network"
				"group/hardware"
    			"group/tools"
    			"tray"
        		"custom/exit"
				"clock"
			];
# Workspaces
  "hyprland/workspaces"= {
    "on-scroll-up"= "hyprctl dispatch workspace r-1";
    "on-scroll-down"= "hyprctl dispatch workspace r+1";
    "on-click"= "activate";
    "active-only"= false;
    "all-outputs"= true;
    "format"= "{}";
    "format-icons"= {
      "1"= "";
      "2"= "";
      "3"= "";
      "4"= "";
      "5"= "";
      "6"= "";
      "urgent"= "";
      "active"= "";
      "default"= "";
    };
    "persistent-workspaces"= {
            "*" = 0;
    };
  };

# Taskbar
  "wlr/taskbar"= {
    "format"= "{icon}";
    "icon-size"= 18;
    "tooltip-format"= "{title}";
    "on-click"= "activate";
    "on-click-middle"= "close";
    "ignore-list"= ["Alacritty" "kitty"];
    "app_ids-mapping"= {
      "firefoxdeveloperedition"= "firefox-developer-edition";
    };
    "rewrite"= {
      "Firefox Web Browser"= "Firefox";
      "Foot Server"= "Terminal";
    };
  };

# Hyprland Window
  "hyprland/window"= {
    "rewrite"= {
      "(.*) - Brave"= "$1";
      "(.*) - Chromium"= "$1";
      "(.*) - Brave Search"= "$1";
      "(.*) - Outlook"= "$1";
      "(.*) Microsoft Teams"= "$1";
    };
    "separate-outputs"= true;
  };

# Empty
  "custom/empty"= {
    "format"= "";
  };
  
  # Empty
  "custom/tools"= {
    "format"= "";
    "tooltip-format"= "Tools";
  };

# Cliphist
  "custom/cliphist"= {
    "format"= "";
    "on-click"= "sleep 0.1 && cliphist list | rofi -dmenu -theme ~/.config/rofi/cliphist.rasi| cliphist decode | wl-copy";
    "on-click-right"= "sleep 0.1 && cliphist list | rofi -dmenu -theme ~/.config/rofi/cliphist.rasi| cliphist delete";
    "on-click-middle"= "sleep 0.1 && cliphist wipe";
    "tooltip-format"= "Clipboard Manager: Left(select), right(delete), center(clean)";
  };

  # Wallpaper
  "custom/wallpaper"= {
    "format"= "";
    "on-click"= "waypaper";
    "on-click-right"= "waypaper --random";
    "tooltip-format"= "Left: Select a wallpaper\nRight: Select a random wallpaper";
  };

  "custom/github"= {
    "format"= "";
    "on-click"= "firefox --new-tab https://github.com";
    "tooltip-format"= "Open GitHub";
  };
  "custom/whatsapp"= {
    "format"= "";
    "on-click"= "firefox --new-tab https://web.whatsapp.com";
    "tooltip-format"= "Open WhatsApp";
  };
 # Rofi Application Launcher
  "custom/appmenu"= {
    "format"= " ";
"on-click"= "sleep 0.2; if pgrep -x rofi > /dev/null; then pkill rofi; else rofi -show drun -replace; fi";
    "tooltip-format"= "Open/Close the application launcher";
  };

# Power Menu
  "custom/exit"= {
    "format"= "";
    "on-click"= "wlogout";
    "tooltip-format"= "Power Menu";
  };

# Hyprshade
  "custom/hyprshade"= {
    "format"= "";
    "tooltip-format"= "Blue-light filter on/off";
"on-click"= "sleep 0.5; if hyprshade current | grep -q 'blue-light-filter'; then hyprshade off; else hyprshade on blue-light-filter; fi";
  };

# System tray
  "tray"= {
    "icon-size"= 21;
    "spacing"= 10;
  };

# Clock
  "clock"= {
    "format"= "{:%H:%M %a}";
    "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><big>{calendar}</big></tt>";
    "format-alt"= "{:%Y-%m-%d}";
  };

# System
  "custom/system"= {
    "format"= "";
    "tooltip"= false;
  };

# CPU
  "cpu"= {
    "format"= "/ CPU:{usage}% ";
  };

# Memory
  "memory"= {
    "format"= "/  {}% ";
  };
  "temperature"= {
    "thermal-zone"= 0;
    "critical-threshold"= 80;
    "format-critical"= " {temperatureC}°C";
    "format"= "/  {temperatureC}°C  ";
  };
# Harddisc space used
  "disk"= {
    "interval"= 30;
    "format"= "󰋊 {percentage_used}% ";
  };

  "hyprland/language"= {
    "format"= "  {short}";
  };

# Group Hardware
  "group/hardware"= {
    "orientation"= "inherit";
    "drawer"= {
      "transition-duration"= 300;
      "children-class"= "not-memory";
      "transition-left-to-right"= false;
    };
    "modules"= ["custom/system" "disk" "memory" "temperature"];
  };

# Group Tools
  "group/tools"= {
    "orientation"= "inherit";
    "drawer"= {
      "transition-duration"= 300;
      "children-class"= "not-memory";
      "transition-left-to-right"= false;
    };
    "modules"= [
      "custom/cliphist"
      "custom/wallpaper"
      "custom/hyprshade"
    ];
  };

# Group Links
	"group/links"= {
	"orientation"= "horizontal";
	"modules"= [
		"custom/empty"
		"custom/github"
		"custom/whatsapp"
		"custom/empty"
	];
	};

# Network
  "network"= {
    "format"= "{ifname}";
    "format-wifi"= "   {signalStrength}%";
    "format-ethernet"= "  {ifname}";
    "format-disconnected"= "Disconnected";
    "tooltip-format"= " {ifname} via {gwaddri}";
    "tooltip-format-wifi"= "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
    "tooltip-format-ethernet"= " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
    "tooltip-format-disconnected"= "Disconnected";
    "max-length"= 50;
    "on-click"= "nm-connection-editor";
  };

# Battery
  "battery"= {
    "states"= {
      "warning"= 30;
      "critical"= 15;
    };
    "format"= "{icon} {capacity}%";
    "format-charging"= " {capacity}%";
    "format-plugged"= " {capacity}%";
    "format-alt"= "{icon}  {time}";
    "format-icons"= [" " " " " " " " " "];
	"tooltip" = false;
  };

# Pulseaudio
  "pulseaudio"= {
    "format"= "{icon}  {volume}%";
    "format-bluetooth"= "{volume}% {icon} {format_source}";
    "format-bluetooth-muted"= " {icon} {format_source}";
    "format-muted"= "  {volume}%";
    "format-source"= "{volume}% ";
    "format-source-muted"= "";
    "format-icons"= {
      "headphone"= " ";
      "hands-free"= " ";
      "headset"= " ";
      "phone"= " ";
      "portable"= " ";
      "car"= " ";
      "default"= ["" "" ""];
    };
    "on-click"= "wpctl set-mute @DEFAULT_SINK@ toggle";
    "on-click-right"= "pavucontrol";
  };

  # Bluetooth
  "bluetooth"= {
    "format"= " {status}";
    "format-disabled"= "󰂲 off";
    "format-off"= "󰂲 off";
    "interval"= 30;
    "on-click"= "blueberry";
    "format-no-controller"= "";
  };

# Other
  "user"= {
    "format"= "{user}";
    "interval"= 60;
    "icon"= false;
  };

#backlight:
  "backlight"= {
    "format"= "{icon} {percent}%";
    "format-icons"= [
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
    ];
    "scroll-step"= 1;
  };
		};
	};
}
