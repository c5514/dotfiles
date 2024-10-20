{pkgs, ...}:
{
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
    	platformTheme.name = "gtk3";
		style.package = pkgs.adwaita-qt;
    	style.name = "adwaita-dark";
	};
}
