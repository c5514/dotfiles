{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.python
      ms-python.debugpy
      ms-pyright.pyright
      arrterian.nix-env-selector
      emroussel.atomize-atom-one-dark-theme
      ms-toolsai.jupyter
      james-yu.latex-workshop
    ];
  };
}
