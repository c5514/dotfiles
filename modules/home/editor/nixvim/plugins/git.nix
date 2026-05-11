{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      lazygit.enable = true;
      gitsigns.enable = true;
      gitblame = {
        enable = true;
        settings = {
          message_template = "<summary> • <date> • <author>";
          highlight_group = "Comment";
          delay = 200;
          date_format = "%r";
          display_virtual_text = true;
          message_when_not_committed = "Oh please, commit this !";
          set_extmark_options = {
            priority = 7;
          };
          use_blame_commite_file_urls = false;
          virtual_text_column = 80;
        };
      };
    };
    keymaps =
      (lib.optionals config.programs.nixvim.plugins.lazygit.enable [
        {
          mode = "n";
          key = "<leader>gg";
          action = "<cmd>LazyGit<CR>";
          options.desc = "LazyGit";
        }
      ])
      ++ (lib.optionals config.programs.nixvim.plugins.gitblame.enable [
        {
          mode = "n";
          key = "<leader>gb";
          action = "<cmd>GitBlameEnable<CR>";
          options = {
            desc = "GitBlame";
            silent = true;
          };
        }
        {
          mode = "n";
          key = "<leader>gbt";
          action = "<cmd>GitBlameToggle<CR>";
          options = {
            desc = "Toggle";
            silent = true;
          };
        }
        {
          mode = "n";
          key = "<leader>gbs";
          action = "<cmd>GitBlameCopySHA<CR>";
          options = {
            desc = "Copy SHA";
            silent = true;
          };
        }
        {
          mode = "n";
          key = "<leader>gbc";
          action = "<cmd>GitBlameCopyFileURL<CR>";
          options = {
            desc = "Copy URL";
            silent = true;
          };
        }
        {
          mode = "n";
          key = "<leader>gbo";
          action = "<cmd>GitBlameOpenFileURL<CR>";
          options = {
            desc = "Open file URL";
            silent = true;
          };
        }
      ]);
  };
}
