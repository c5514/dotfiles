{pkgs, ...}:
{
	home.packages = with pkgs; [
		picom
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
		redshift
		xfce.xfce4-power-manager
		imagemagick
		xclip
	];
}
