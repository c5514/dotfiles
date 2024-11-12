{pkgs, ...}:
{
	services.xserver = {
		enable = true;
		desktopManager = {
			xfce = {
				enable = true;
				noDesktop = true;
				enableXfwm = false;
			};
			xterm.enable = false;
		};
		windowManager.xmonad = {
			enable = true;
			enableContribAndExtras = true;
			extraPackages = haskellPackages : [
				haskellPackages.xmonad-contrib
				haskellPackages.xmonad-extras
				haskellPackages.xmonad
			];
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
