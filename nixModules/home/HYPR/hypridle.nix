{ pkgs, lib, config, inputs, ...}:
let
	suspendScript = pkgs.writeShellScript "suspend-script" ''
	${lib.getExe pkgs.playerctl} -a status | ${lib.getExe pkgs.ripgrep} Playing -q
	if [ $? == 1 ]; then
		${pkgs.systemd}/bin/systemctl suspend
	fi
	'';
	brillo = lib.getExe pkgs.brillo;
	timeout = 600;
in {
	services.hypridle = {
		enable = true;

		package = inputs.hypridle.packages.${pkgs.system}.hypridle;
		settings = {
    		general = {
			lock_cmd = lib.getExe config.programs.hyprlock.package;
			before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
    	};
		listener = [
			{
				timeout = timeout - 10;
				on-timeout = "${brillo} -O; ${brillo} -u 1000000 -S 10";
				on-resume = "${brillo} -I -u 500000";
			}
			{
				inherit timeout;
				on-timeout = "hyprctl dispatch dpms off";
				on-resume = "hyprctl dispatch dpms on";
			}
			{
				timeout = timeout + 10;
				on-timeout = suspendScript.outPath;
			}
		];
		};
	};
}
