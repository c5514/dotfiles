{pkgs, config, ...}:
{
	environment.etc."nextcloud-admin-pass".text = "hello24365074there";
	services.nextcloud = {
		enable = true;
		package = pkgs.nextcloud29;
		hostName = "localhost";
		config.adminpassFile = "/etc/nextcloud-admin-pass";
		extraApps = {
			inherit (config.services.nextcloud.package.packages.apps) tasks calendar contacts;
		};
		extraAppsEnable = true;
	};
}
