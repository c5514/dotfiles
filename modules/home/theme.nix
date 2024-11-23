{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Dark";
      # name = "adw-gtk3-dark";
      package = pkgs.orchis-theme;
      # package = pkgs.adw-gtk3;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    iconTheme = {
      # package = pkgs.papirus-icon-theme;
      package = pkgs.tela-circle-icon-theme;
      # name = "Papirus";
      name = "Tela-circle";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    x11.enable = true;
  };
}
