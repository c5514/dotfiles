{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      lua-language-server
      texlab
      pyright
      rust-analyzer
      stylua
      shellcheck
      shfmt
      python312Packages.flake8
      python312Packages.isort
      python312Packages.black
      prettierd
      prettier
      nixfmt
      rustfmt
      ripgrep
      fd
      gcc
      tree-sitter
    ];
  };
  xdg.configFile."nvim".source = ./nvim;
}
