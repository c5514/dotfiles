{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    plugins.todo-comments = {
      enable = true;
    };
    keymaps = lib.mkIf config.programs.nixvim.plugins.todo-comments.enable [
      {
        mode = "n";
        key = "]t";
        action.__raw = ''
          function()
            require("todo-comments").jump_next()
          end
        '';
        options = {
          desc = "Next TODO";
        };
      }
      {
        mode = "n";
        key = "[t";
        action.__raw = ''
          function()
            require("todo-comments").jump_prev()
          end
        '';
        options = {
          desc = "Previous TODO";
        };
      }
    ];
  };
}
