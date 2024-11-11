{pkgs, ...}:
{
	services.xserver = {
		windowManager.awesome = {
			enable = true;
			luaModules = with pkgs.luaPackages; [
				luarocks
				luadbi-mysql
			];
		};
	};
	programs.i3lock = {
		enable = true;
		package = pkgs.i3lock-color;
	};
	services.redshift.enable = true;
	location = {
		provider = "manual";
		latitude = -12.0;
		longitude = -77.0;
	};
}
