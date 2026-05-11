{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };
    gtk4.theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
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
    gtk3.extraConfig = {
      Settings = "gtk-application-prefer-dark-theme=1";
    };
    gtk4.extraConfig = {
      Settings = "gtk-application-prefer-dark-theme=1";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
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
