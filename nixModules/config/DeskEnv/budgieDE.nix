{pkgs, ...}:
{

	services.xserver.enable = true;
	services.xserver.desktopManager.budgie.enable = true;
	environment.budgie.excludePackages = (with pkgs; [
		mate.mate-terminal
		vlc
		mate.mate-calc
	]);
}
