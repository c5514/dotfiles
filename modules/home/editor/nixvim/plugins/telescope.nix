{ lib, config, ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        file-browser = {
          enable = true;
        };
        frecency = {
          enable = true;
        };
        fzf-native = {
          enable = true;
        };
      };
      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
            };
          };
          sorting_strategy = "ascending";
        };
        mappings = {
          i = {
            "<C-k>" = {
              __raw = "require('telescope.actions').move_selection_previous";
            };
            "<C-j>" = {
              __raw = "require('telescope.actions').move_selection_next";
            };
          };
        };
      };
    };
    keymaps = lib.mkIf config.programs.nixvim.plugins.telescope.enable [
      {
        mode = "n";
        key = "<leader>f";
        action = "find";
        options = {
          desc = "+find/file";
        };
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = "git_files";
        options = {
          desc = "Telescope Git Files";
        };
      }
      {
        mode = "n";
        key = "<leader>ft";
        action = "<Cmd>TodoTelescope<CR>";
        options = {
          desc = "Find TODO's";
        };
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<Cmd>Telescope find_files<CR>";
        options = {
          desc = "Find files";
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<Cmd>Telescope live_grep<CR>";
        options = {
          desc = "Find text";
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<Cmd>Telescope old_files<CR>";
        options = {
          desc = "Recent files";
        };
      }
      {
        mode = "n";
        key = "<leader>fc";
        action = "<Cmd>Telescope grep_string<CR>";
        options = {
          desc = "Find string under cursor";
        };
      }
    ];
  };
}
