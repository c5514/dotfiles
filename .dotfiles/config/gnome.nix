{pkgs, ...}:
{

	services.xserver.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.desktopManager.xterm.enable = false;
	services.xserver.displayManager.gdm = {
		enable = true;
		wayland = true;
	};
	programs.dconf.profiles.gdm.databases = [
		{
			settings = {
				"org/gnome/desktop/peripherals/touchpad" = {
					tap-to-click = true;
				};
				"org/gnome/desktop/interface" = {
					cursor-theme = "Bibata-Modern-Ice";
					show-battery-percentage = true;
				};
				"org/gnome/desktop/background" = {
					picture-uri = "file:///home/c5514/nixwall.png";
					picture-uri-dark = "file:///home/c5514/nixwall.png";
				};
			};
		}
	];
	users.users.gdm.packages = with pkgs; [
		bibata-cursors
	];
	environment.gnome.excludePackages = (with pkgs; [
		gnome-console
		gnome-photos
		gnome-tour
		gnome-connections
		snapshot
		gedit
		cheese
		epiphany
		geary
		totem
		evince
		yelp
		gnome-font-viewer
		gnome-text-editor
		gnome-music
		gnome-characters
		tali
		iagno
		hitori
		atomix
		gnome-contacts
		gnome-maps
	]);
}
