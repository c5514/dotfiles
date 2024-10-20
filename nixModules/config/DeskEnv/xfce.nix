{pkgs, ...}:
{
	services.xserver = {
		enable = true;
		desktopManager = {
			xfce.enable = true;
			xterm.enable = false;
		};
	};
	environment.systemPackages = with pkgs; [
    	xfce.xfce4-weather-plugin
		xfce.xfce4-clipman-plugin
		xfce.xfce4-windowck-plugin
		xfce.xfce4-cpugraph-plugin
		xfce.xfce4-cpufreq-plugin
		xfce.xfce4-whiskermenu-plugin
		xfce.xfce4-panel
	];
}
