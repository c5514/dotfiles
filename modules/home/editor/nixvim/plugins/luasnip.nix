{ pkgs, config, ... }:
{
  home.file = {
    "snippets".source = ./snippets;
  };
  programs.nixvim = {
    plugins.luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        history = true;
        updateevents = "TextChanged,TextChangedI";
        store_selection_keys = "<C-s>";
      };
      fromVscode = [
        {
          exclude = [ "tex" ];
          paths = [
            "${pkgs.vimPlugins.friendly-snippets}"
          ];
        }
      ];
      fromLua = [
        {
          paths = "${config.home.homeDirectory}/snippets";
        }
      ];
    };
    keymaps = [
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-l>";
        action = "<Plug>luasnip-next-choice";
        options = {
          silent = true;
        };
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-j>";
        action = "<cmd>lua require('luasnip').jump(1)<CR>";
        options = {
          silent = true;
        };
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-k>";
        action = "<cmd>lua require('luasnip').jump(-1)<CR>";
        options = {
          silent = true;
        };
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-f>";
        action = "<cmd>lua _G.dynamic_node_external_update(1)<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-d>";
        action = "<cmd>lua _G.dynamic_node_external_update(2)<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
  };
}
