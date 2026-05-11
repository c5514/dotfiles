{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings = {
        completion = {
          list.selection = {
            preselect = true;
            auto_insert = true;
          };
          ghost_text.enabled = false;
          menu.draw = {
            gap = 1;
            columns = [
              [
                "label"
                "label_description"
              ]
              [
                "kind_icon"
                "source_id"
              ]
            ];
            treesitter = [ "lsp" ];
            components = {
              label = {
                width = {
                  fill = true;
                  max = 60;
                };
              };
              kind = {
                width = {
                  fill = true;
                  max = 30;
                };
              };
              source_id = {
                width.max = 50;
                text.__raw = ''
                  function(ctx)
                    return ctx.source_name
                  end
                '';
                highlight = "BlinkCmpSource";
              };
            };
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
            treesitter_highlighting = true;
          };
        };
        snippets = {
          preset = "luasnip";
        };
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "spell"
            "vimtex"
          ];
          # min_keyword_length = 4;
          providers = {
            lsp = {
              name = "LSP";
              module = "blink.cmp.sources.lsp";
              enabled = true;
              score_offset = 750;
              max_items = 10;
            };
            path = {
              name = "path";
              score_offset = 250;
            };
            snippets = {
              name = "snippets";
              module = "blink.cmp.sources.snippets";
              score_offset = 1000;
              max_items = 10;
              opts = {
                use_show_condition = true;
                show_autosnippets = false;
              };
            };
            vimtex = {
              name = "vimtex";
              module = "blink.compat.source";
              score_offset = 900;
            };
            buffer = {
              name = "buffer";
              score_offset = 500;
              max_items = 8;
              min_keyword_length = 4;
            };
            spell = {
              name = "Spell";
              module = "blink-cmp-spell";
            };
          };
        };
        keymap = {
          "<A-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<A-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<A-Space>" = [
            "show"
            "hide"
            "show_documentation"
            "hide_documentation"
            "fallback"
          ];
          "<A-j>" = [
            "select_next"
            "fallback"
          ];
          "<A-k>" = [
            "select_prev"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<Tab>" = [
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];
        };
      };
    };
    blink-compat.enable = true;
    blink-cmp-spell.enable = true;
    cmp-vimtex.enable = true;
  };
}
