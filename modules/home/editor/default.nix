{ inputs, pkgs, ... }:
{
  imports = [
    ./nixvim/default.nix
    # ./emacs.nix
    # ./helix.nix
    # ./vscodium.nix
  ];
  home = {
    sessionVariables.EDITOR = "nvim";
    # packages = [
    #   inputs.nixvim.packages.${pkgs.system}.default
    # ];
  };
}
