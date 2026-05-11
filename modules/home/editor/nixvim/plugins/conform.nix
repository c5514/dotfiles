{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save.__raw = ''
          function(bufnr)
            local ft = vim.bo[bufnr].filetype
            if ft == "tex" or ft == "bib" then
              return nil
            end
            return {
              timeout_ms = 5000,
              lsp_fallback = true,
            }
          end
        '';
        notify_on_error = true;
        formatters_by_ft = {
          lua = [ "stylua" ];
          python = [
            "isort"
            "black"
          ];
          rust = {
            __unkeyed-1 = "rustfmt";
            lsp_format = "fallback";
          };
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          nix = [ "nixfmt" ];
          markdown = [
            "prettierd"
            "prettier"
          ];
          tex = [ "latexindent" ];
          bib = [ "latexindent" ];
        };
      };
    };
    keymaps = lib.mkIf config.programs.nixvim.plugins.conform-nvim.enable [
      {
        mode = "n";
        key = "<leader>c";
        action = "+formatting";
        options = {
          desc = "+formatting";
        };
      }
      {
        mode = "n";
        key = "<leader>cp";
        action.__raw = ''
          function()
            local start_pos =
              vim.fn.search("^\\s*$", "bnW") + 1
            local end_pos =
              vim.fn.search("^\\s*$", "nW") - 1
            if start_pos <= 0 then
              start_pos = 1
            end
            if end_pos <= 0 then
              end_pos = vim.api.nvim_buf_line_count(0)
            end
            require("conform").format({
              range = {
                start = { start_pos, 0 },
                ["end"] = { end_pos, 0 },
              },
              timeout_ms = 500,
            })
          end
        '';
        options = {
          desc = "Format paragraph in LaTeX";
        };
      }
      {
        mode = "n";
        key = "<leader>cb";
        action.__raw = ''
          function()
            local ft = vim.bo.filetype
            local timeout = 5000
            if ft == "tex" or ft == "bib" then
              timeout = 10000
            end
            require("conform").format({
              timeout_ms = timeout,
              lsp_fallback = true,
            })
          end
        '';
        options = {
          desc = "Format buffer";
        };
      }
    ];
    extraPackages = with pkgs; [
      black
      isort
      stylua
      rustfmt
      prettierd
      prettier
      nixfmt
    ];
  };
}
