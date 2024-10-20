{pkgs,...}:
{
	services.xserver = {
		enable = true;
		desktopManager = {
			cinnamon.enable = true;
		};
	};
	environment.cinnamon.excludePackages = with pkgs; [
		blueman
	];
}
