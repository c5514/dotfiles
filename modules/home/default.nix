{ inputs, ... }:
{
  imports = [
    ./terminal/default.nix
    ./editor/default.nix
    # ./dconf.nix
    ./sound.nix
    ./theme.nix
    ./apps/default.nix
    ./Scripts/default.nix
  ];
  home.file = {
    "Pictures/Nix".source = ./pictures;
    "Templates/latex".source = ./latex;
  };
}
