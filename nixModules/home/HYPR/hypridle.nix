{pkgs, lib,...}:
let suspendScript = pkgs.writeShellScript "suspend-script" ''
		${lib.getExe pkgs.playerctl} -a status | ${lib.getExe pkgs.ripgrep} Playing -q
		if [ ¿? == 1 ]; then
			${pkgs.systemd}/bin/systemctl suspend
		fi
	'';
	brillo = lib.getExe pkgs.brillo;
	timeout = 300;
in
{
	services.hypridle.enable = true;
	services.hypridle.package = pkgs.hypridle;
	services.hypridle.settings = {
		general = {
    		lock_cmd = "pidof hyprlock || hyprlock";# avoid starting multiple hyprlock instances.
    		before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";# lock before suspend.
		};
		# Screenlock
		listener = [
			{
				timeout = timeout - 10;
				on-timeout = "${brillo} -O; ${brillo} -u 1000000 -S 10";
				on-resume = "${brillo} -I -u 500000";
			}
			# dpms
			{
    			# DPMS TIMEOUT
    			inherit timeout;
    			on-timeout = "hyprctl dispatch dpms off";
    			on-resume = "hyprctl dispatch dpms on";
			}
			# Suspend
			{
    			# SUSPEND TIMEOUT
    			timeout = timeout + 10;
				on-timeout = suspendScript.outPath;
			}
		];
	};
}
