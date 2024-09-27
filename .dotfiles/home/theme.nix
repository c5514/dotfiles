{pkgs, ...}:
{
	home.packages = with pkgs; [
		(catppuccin-kvantum.override {
			accent = "Blue";
			variant = "Macchiato";
		})
	];
	gtk.enable = true;
	gtk.cursorTheme.package = pkgs.bibata-cursors;
	gtk.cursorTheme.name = "Bibata-Modern-Ice";
	gtk.cursorTheme.size = 24;
	gtk.theme.package = pkgs.adw-gtk3;
	gtk.theme.name = "adw-gtk3-dark";
	gtk.iconTheme.package = pkgs.papirus-icon-theme;
	gtk.iconTheme.name = "Papirus";
	qt = {
    	enable = true;
    	platformTheme.name = "qt5ct";
		# style.package = pkgs.catppuccin-kvantum;
    	style.name = "kvantum";
	};
	xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
	General.theme = "Catppuccin-Macchiato-Blue";
	};
}
