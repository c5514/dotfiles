{pkgs,...}:
{
	imports = [
		./firefox.nix
		./zathura.nix
		./spicetify.nix
	];
	home.packages = with pkgs; [
		webcord
		evince
		zotero
		wineWowPackages.waylandFull
		(pkgs.inkscape-with-extensions.override {inkscapeExtensions = [ inkscape-extensions.textext ]; })
		telegram-desktop
		feh
		obs-studio
		libreoffice-qt6-fresh
		thunderbird
		vlc
	];
}
