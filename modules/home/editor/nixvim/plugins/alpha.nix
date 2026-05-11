{
  programs.nixvim.plugins.alpha = {
    enable = true;
    settings = {
      layout = [
        {
          type = "padding";
          val = 4;
        }

        {
          type = "text";
          val = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
          opts = {
            position = "center";
            hl = "AlphaHeader";
          };
        }

        {
          type = "padding";
          val = 4;
        }

        {
          type = "group";
          val = [
            {
              type = "button";
              val = "󰱼  Find File";
              on_press.__raw = "function() require('telescope.builtin').find_files() end";
              opts = {
                position = "center";
                shortcut = "f";
                keymap = [
                  "n"
                  "f"
                  "<cmd>Telescope find_files<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                width = 40;
                align_shortcut = "right";
              };
            }

            {
              type = "button";
              val = "󱋡  Recent Files";
              on_press.__raw = "function() require('telescope.builtin').oldfiles() end";
              opts = {
                position = "center";
                shortcut = "r";
                keymap = [
                  "n"
                  "r"
                  "<cmd>Telescope oldfiles<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                width = 40;
                align_shortcut = "right";
              };
            }

            {
              type = "button";
              val = "󰊄  Find Word";
              on_press.__raw = "function() require('telescope.builtin').live_grep() end";
              opts = {
                position = "center";
                shortcut = "g";
                keymap = [
                  "n"
                  "g"
                  "<cmd>Telescope live_grep<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                width = 40;
                align_shortcut = "right";
              };
            }

            {
              type = "button";
              val = "  Keymaps";
              on_press.__raw = "function() require('telescope.builtin').keymaps() end";
              opts = {
                position = "center";
                shortcut = "K";
                keymap = [
                  "n"
                  "K"
                  "<cmd>Telescope keymaps<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                width = 40;
                align_shortcut = "right";
              };
            }

            {
              type = "button";
              val = "󰈆  Quit Neovim";
              on_press.__raw = "function() vim.cmd('qa') end";
              opts = {
                position = "center";
                shortcut = "q";
                keymap = [
                  "n"
                  "q"
                  "<cmd>qa<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                width = 40;
                align_shortcut = "right";
              };
            }
          ];
          opts = {
            position = "center";
          };
        }
      ];

      highlight = [
        {
          group = "AlphaHeader";
          link = "Title";
        }
      ];
    };
  };
}
