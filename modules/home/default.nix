{ inputs, ... }:
{
  imports = [
    ./picture/default.nix
    ./terminal/default.nix
    ./editor/nixvim/main.nix
    ./editor/emacs.nix
    ./editor/vscodium.nix
    ./dconf.nix
    ./theme.nix
    ./apps/default.nix
  ];
}
