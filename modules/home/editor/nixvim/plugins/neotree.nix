{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      settings.filesystem = {
        filtered_items.visible = true;
        follow_current_file = {
          enabled = true;
          leave_dirs_open = true;
        };
      };
    };
    keymaps = lib.mkIf config.programs.nixvim.plugins.neo-tree.enable [
      {
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        mode = "n";
        options = {
          desc = "NeoTree";
        };
      }
    ];
  };
}
