{ inputs, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./zathura.nix
    ./spicetify.nix
  ];
  home.packages = with pkgs; [
    # megacmd
    #megasync
    # evince
    brave
    obsidian
    zettlr
    proton-vpn-cli
    zotero
    inkscape
    gimp
    texliveFull
    typst
    python312Packages.tkinter
    telegram-desktop
    mpv
    mpd
    feh
    obs-studio
    libreoffice-qt6-fresh
    tor-browser
    ttyper
    btop
    cava
  ];
}
