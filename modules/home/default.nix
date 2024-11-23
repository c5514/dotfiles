{ inputs, ... }:
{
  imports = [
    ./terminal/default.nix
    ./editor/default.nix
    ./dconf.nix
    ./theme.nix
    ./apps/default.nix
  ];
  home.file = {
    "Pictures/Nix".source = ./pictures;
  };
}
