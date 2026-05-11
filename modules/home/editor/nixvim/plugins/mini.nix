{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        comment = { };
        # indentscope = { };
        cursorword = { };
        align = { };
        bracketed = { };
        icons = { };
        surround = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            replace = "gsr";
            update_n_lines = "gsn";
          };
        };
        notify = {
          content = {
            format.__raw = "nil";
            sort.__raw = "nil";
          };
          lsp_progress = {
            enable = true;
            level = "INFO";
            duration_last = 1000;
          };
          window = {
            config = { };
            max_width_share = 0.382;
            winblend = 25;
          };
        };
        clue = {
          window = {
            delay = 500;
            config = {
              border = "none";
              width.__raw = ''
                math.floor(0.318 * vim.o.columns)
              '';
              row = "auto";
              col = "auto";
              anchor = "NE";
            };
          };
          triggers = [
            {
              mode = "n";
              keys = "<leader>";
            }
            {
              mode = "x";
              keys = "<leader>";
            }
            {
              mode = "i";
              keys = "<C-x>";
            }
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "x";
              keys = "g";
            }
            {
              mode = "n";
              keys = "'";
            }
            {
              mode = "n";
              keys = "`";
            }
            {
              mode = "n";
              keys = "]";
            }
            {
              mode = "n";
              keys = "[";
            }
            {
              mode = "x";
              keys = "'";
            }
            {
              mode = "x";
              keys = "`";
            }
            {
              mode = "n";
              keys = "\"";
            }
            {
              mode = "x";
              keys = "\"";
            }
            {
              mode = "i";
              keys = "<C-r>";
            }
            {
              mode = "c";
              keys = "<C-r>";
            }
            {
              mode = "n";
              keys = "<C-w>";
            }
            {
              mode = "n";
              keys = "z";
            }
            {
              mode = "x";
              keys = "z";
            }
          ];
          clues = [
            { __raw = "require('mini.clue').gen_clues.builtin_completion()"; }
            { __raw = "require('mini.clue').gen_clues.g()"; }
            { __raw = "require('mini.clue').gen_clues.marks()"; }
            { __raw = "require('mini.clue').gen_clues.registers()"; }
            { __raw = "require('mini.clue').gen_clues.windows()"; }
            { __raw = "require('mini.clue').gen_clues.z()"; }
          ];
        };
      };
    };
    highlight = lib.mkIf config.programs.nixvim.plugins.mini.enable {
      MiniClueDescSingle = {
        bg = "#1e1e1e";
      };
      MiniClueDescGroup = {
        bg = "#1e1e1e";
        fg = "#c678dd";
      };
      MiniClueNextKey = {
        bg = "#1e1e1e";
        fg = "#57a5e5";
      };
      MiniClueNextKeyWithPostkeys = {
        bg = "#1e1e1e";
        fg = "#818387";
      };
      MiniClueSeparator = {
        bg = "#1e1e1e";
        fg = "#c678dd";
      };
      MiniClueBorder = {
        bg = "#1e1e1e";
        fg = "#c678dd";
      };
    };
  };
}
