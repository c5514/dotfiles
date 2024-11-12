{pkgs,...}:
{
	imports = [
		./firefox.nix
		./zathura.nix
		./spicetify.nix
	];
	home.packages = with pkgs; [
		vesktop
		evince
		zotero
		wineWowPackages.waylandFull
		# (pkgs.inkscape-with-extensions.override {inkscapeExtensions = [ inkscape-extensions.textext ]; })
		inkscape
		typst
		python312Packages.tkinter
		telegram-desktop
		feh
		obs-studio
		libreoffice-qt6-fresh
		thunderbird
		vlc
	];
}
