{pkgs, ...}:
{
	home.packages = with pkgs; [
		picom-pijulius
		# rofi
		maim
		ffmpeg
		iw
		xidlehook
		i3lock-fancy
		light
		alsa-utils
		acpi
		mpd
		xfce.xfce4-power-manager
		imagemagick
		xclip
		nitrogen
		flameshot
	];
	services.screen-locker = {
		enable = true;
		inactiveInterval = 5;
		lockCmd = "${pkgs.i3lock-color}/bin/i3lock-color -n -c 000000";
		xautolock = {
			enable = true;
			detectSleep = true;
		};
	};
}
