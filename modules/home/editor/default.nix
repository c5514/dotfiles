{ inputs, pkgs, ... }:
{
  # imports = [
  #   ./emacs.nix
  #   ./helix.nix
  #   ./vscodium.nix
  # ];
  home = {
    sessionVariables.EDITOR = "nvim";
    packages = [
      inputs.nixvim.packages.${pkgs.system}.default
    ];
  };
}
