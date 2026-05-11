{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim.plugins = {
    markview = lib.mkIf config.programs.nixvim.plugins.treesitter.enable {
      enable = true;
    };
  };
}
