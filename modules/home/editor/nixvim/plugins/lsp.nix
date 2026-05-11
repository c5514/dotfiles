{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          html.enable = true;
          lua_ls = {
            enable = true;
            settings = {
              Lua.diagnostics.globals = [
                "vim"
                "require"
              ];
            };
          };
          nixd = {
            enable = true;
            extraOptions = {
              formatting.enable = false;
            };
          };
          marksman.enable = true;
          pyright.enable = true;
          texlab.enable = true;
        };
        # capabilities.__raw = ''
        #   require("blink.cmp").get_lsp_capabilities()
        # '';
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
          # diagnostic = {
          #   "<leader>cd" = {
          #     action = "open_float";
          #     desc = "Line Diagnostics";
          #   };
          #   "[d" = {
          #     action = "goto_next";
          #     desc = "Next Diagnostic";
          #   };
          #   "]d" = {
          #     action = "goto_prev";
          #     desc = "Previous Diagnostic";
          #   };
          # };
        };
      };
      # lsp-format = lib.mkIf config.programs.nixvim.plugins.lsp.enable {
      #   enable = true;
      # };
      lspsaga = lib.mkIf config.programs.nixvim.plugins.lsp.enable {
        enable = true;
        settings = {
          beacon = {
            enable = true;
          };
          ui = {
            border = "rounded"; # One of none, single, double, rounded, solid, shadow
            codeAction = "💡"; # Can be any symbol you want 💡
          };
          hover = {
            openCmd = "!firefox"; # Choose your browser
            openLink = "gx";
          };
          diagnostic = {
            borderFollow = true;
            diagnosticOnlyCurrent = false;
            showCodeAction = true;
          };
          symbolInWinbar = {
            enable = true; # Breadcrumbs
          };
          codeAction = {
            extendGitSigns = false;
            showServerName = true;
            onlyInCursor = true;
            numShortcut = true;
            keys = {
              exec = "<CR>";
              quit = [
                "<Esc>"
                "q"
              ];
            };
          };
          lightbulb = {
            enable = false;
            sign = false;
            virtualText = true;
          };
          implement = {
            enable = false;
          };
          rename = {
            autoSave = false;
            keys = {
              exec = "<CR>";
              quit = [
                "<C-k>"
                "<Esc>"
              ];
              select = "x";
            };
          };
          outline = {
            autoClose = true;
            autoPreview = true;
            closeAfterJump = true;
            layout = "normal"; # normal or float
            winPosition = "right"; # left or right
            keys = {
              jump = "e";
              quit = "q";
              toggleOrJump = "o";
            };
          };
          scrollPreview = {
            scrollDown = "<C-f>";
            scrollUp = "<C-b>";
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "gd";
        action = "<cmd>Lspsaga finder def<CR>";
        options = {
          desc = "Goto Definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>Lspsaga finder ref<CR>";
        options = {
          desc = "Goto References";
          silent = true;
        };
      }

      # {
      #   mode = "n";
      #   key = "gD";
      #   action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      #   options = {
      #     desc = "Goto Declaration";
      #     silent = true;
      #   };
      # }

      {
        mode = "n";
        key = "gI";
        action = "<cmd>Lspsaga finder imp<CR>";
        options = {
          desc = "Goto Implementation";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "gT";
        action = "<cmd>Lspsaga peek_type_definition<CR>";
        options = {
          desc = "Type Definition";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "K";
        action = "<cmd>Lspsaga hover_doc<CR>";
        options = {
          desc = "Hover";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<leader>cw";
        action = "<cmd>Lspsaga outline<CR>";
        options = {
          desc = "Outline";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<leader>cr";
        action = "<cmd>Lspsaga rename<CR>";
        options = {
          desc = "Rename";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>Lspsaga code_action<CR>";
        options = {
          desc = "Code Action";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<leader>cd";
        action = "<cmd>Lspsaga show_line_diagnostics<CR>";
        options = {
          desc = "Line Diagnostics";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "]d";
        action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
        options = {
          desc = "Next Diagnostic";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "[d";
        action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
        options = {
          desc = "Previous Diagnostic";
          silent = true;
        };
      }
    ];
    extraConfigLua = ''
      local _border = "rounded"
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = _border
        }
      )
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = _border
        }
      )
      vim.diagnostic.config{
        float={border=_border}
      };
      require('lspconfig.ui.windows').default_options = {
        border = _border
      }
    '';
  };
}
