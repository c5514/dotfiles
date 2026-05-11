{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    plugins.yazi = {
      enable = true;
    };
    keymaps = lib.mkIf config.programs.nixvim.plugins.yazi.enable [
      {
        mode = "n";
        key = "<leader>y";
        action = "+yazi";
        options = {
          desc = "+yazi";
        };
      }
      {
        mode = "n";
        key = "<leader>yy";
        action = "<cmd>Yazi<cr>";
        options = {
          desc = "Yazi at current file";
        };
      }
      {
        mode = "n";
        key = "<leader>yw";
        action = "<cmd>Yazi cwd<cr>";
        options = {
          desc = "Yazi at working directory";
        };
      }
      {
        mode = "n";
        key = "<leader>yr";
        action = "<cmd>Yazi toggle<cr>";
        options = {
          desc = "Resume Yazi session";
        };
      }
    ];
  };
}
