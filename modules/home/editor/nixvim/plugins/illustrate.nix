{
  pkgs,
  lib,
  config,
  ...
}:

let
  illustrate-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "illustrate.nvim";
    version = "2026-05-07";
    src = pkgs.fetchFromGitHub {
      owner = "rpapallas";
      repo = "illustrate.nvim";
      rev = "270cd02a055842df96c1f461ab82ae740a87c48e";
      hash = "sha256-MPRvXTq3dMJrQJZMkaQwe08hnkQS49JnFcMKdjJ/Fv4=";
    };
    buildInputs = [ pkgs.vimPlugins.telescope-nvim ];
  };

in
{
  programs.nixvim = {
    extraPlugins = lib.mkIf config.programs.nixvim.plugins.telescope.enable [
      illustrate-nvim
    ];
    keymaps = [
      {
        mode = "n";
        key = "<leader>is";
        action.__raw = ''
          function()
            local filename =
              vim.fn.input("[SVG] Filename: ")

            if filename and filename ~= "" then
              require("illustrate")
                .create_and_open_svg(filename)

              vim.defer_fn(function()
                local pathFile =
                  "figures/" .. filename .. ".svg"

                vim.fn.system(
                  "chmod +w " .. pathFile
                )
              end, 100)
            else
              print("Filename cannot be empty.")
            end
          end
        '';
        options.desc = "Create and open SVG";
      }

      {
        mode = "n";
        key = "<leader>ia";
        action.__raw = ''
          function()
            require("illustrate")
              .create_and_open_ai()
          end
        '';
        options.desc = "Create and open AI file";
      }
      {
        mode = "n";
        key = "<leader>io";
        action.__raw = ''
          function()
            require("illustrate")
              .open_under_cursor()
          end
        '';
        options.desc = "Open illustration under cursor";
      }
      {
        mode = "n";
        key = "<leader>if";
        action.__raw = ''
          function()
            require("illustrate.finder")
              .search_and_open()
          end
        '';
        options.desc = "Search illustrations";
      }
      {
        mode = "n";
        key = "<leader>ic";
        action.__raw = ''
          function()
            require("illustrate.finder")
              .search_create_copy_and_open()
          end
        '';
        options.desc = "Copy and open illustration";
      }
    ];
  };
}
