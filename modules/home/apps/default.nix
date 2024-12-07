{ inputs, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./zathura.nix
    ./spicetify.nix
  ];
  home.packages = with pkgs; [
    vesktop
    freetube
    # evince
    inputs.zen-browser.packages.${pkgs.system}.default
    zotero
    wineWowPackages.waylandFull
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
