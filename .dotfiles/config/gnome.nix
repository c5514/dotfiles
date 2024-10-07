{pkgs, ...}:
{

	services.xserver.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
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
