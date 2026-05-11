{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      indent.enable = true;
      highlight = {
        enable = true;
        disable = [ "latex" ];
      };
      folding.enable = true;
      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
    treesitter-context = lib.mkIf config.programs.nixvim.plugins.treesitter.enable {
      enable = true;
    };
    treesitter-textobjects = lib.mkIf config.programs.nixvim.plugins.treesitter.enable {
      enable = true;
      settings = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
        swap = {
          enable = true;
          swap_next = {
            "<leader>a" = "@parameters.inner";
          };
          swap_previous = {
            "<leader>A" = "@parameter.outer";
          };
        };
        lsp_interop = {
          enable = true;
          border = "single";
          peekDefinitionCode = {
            "<leader>df" = {
              query = "@function.outer";
              desc = "Peek definition outer function";
            };
            "<leader>dF" = {
              query = "@class.outer";
              desc = "Peek definition outer class";
            };
          };
        };
      };
    };
  };
}
