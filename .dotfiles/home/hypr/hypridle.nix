{pkgs, ...}:

{
	services.hypridle.enable = true;
	services.hypridle.package = pkgs.hypridle;
	services.hypridle.settings = {
		general = {
    		lock_cmd = "pidof hyprlock || hyprlock";# avoid starting multiple hyprlock instances.
    		before_sleep_cmd = "loginctl lock-session";# lock before suspend.
    		after_sleep_cmd = "hyprctl dispatch dpms on";# to avoid having to press a key twice to turn on the display.
		};
		# Screenlock
		listener = [
			{
    			# HYPRLOCK TIMEOUT
    			timeout = 600;
    			# HYPRLOCK ONTIMEOUT
    			on-timeout = "loginctl lock-session";
			}
			# dpms
			{
    			# DPMS TIMEOUT
    			timeout = 660;
    			# DPMS ONTIMEOUT
    			on-timeout = "hyprctl dispatch dpms off";
    			# DPMS ONRESUME
    			on-resume = "hyprctl dispatch dpms on";
			}
			# Suspend
			{
    			# SUSPEND TIMEOUT
    			timeout = 1800;
    			#SUSPEND ONTIMEOUT
    			on-timeout = "systemctl suspend";
			}
		];
	};
}
