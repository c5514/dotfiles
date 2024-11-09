{pkgs, ...}:
{
	home.packages = with pkgs; [
		picom
		rofi
		maim
		ffmpeg
		iw
		xidlehook
		i3lock-fancy
	];
}
