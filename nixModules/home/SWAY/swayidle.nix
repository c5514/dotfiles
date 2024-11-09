{pkgs,...}:
{
	services.swayidle = {
		enable = true;
		timeouts = [
			{ timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
			{ timeout = 360; command = "swaymsg output * dpms off && ${pkgs.systemd}/bin/systemctl suspend"; }
		];
		events = [
			{ event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF";}
			{ event = "before-sleep"; command = "${pkgs.playerctl}/bin/playerctl pause";}
			{ event = "after-resume"; command = "sleep 1 && swaymsg output * dpms on"; }
		];
	};
}
