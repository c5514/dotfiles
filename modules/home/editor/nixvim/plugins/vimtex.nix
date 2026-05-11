{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim = {
    highlightOverride = {
      Conceal.fg = "#d3d3d3";
    };
    plugins.vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull;
      settings = {
        view_method = "zathura_simple";
        quickfix_enabled = true;
        quickfix_open_on_warning = false;
        quickfix_ignore_filters = [
          "Underfull"
          "Overfull"
          "specifier changed to"
          "Token not allowed in a PDF string"
          "Package siunitx Warning: Detected the 'physics' package"
        ];
      };
    };
    globals = lib.mkIf config.programs.nixvim.plugins.vimtex.enable {
      vimtex_syntax_conceal = {
        accents = 1;
        ligatures = 1;
        cites = 1;
        fancy = 1;
        spacing = 1;
        greek = 1;
        math_bounds = 1;
        math_delimiters = 1;
        math_fracs = 1;
        math_super_sub = 1;
        math_symbols = 1;
        sections = 1;
        styles = 1;
      };
      vimtex_compiler_latexmk = {
        options = [
          "-shell-escape"
          "-verbose"
          "-file-line-error"
          "-synctex=1"
          "-interaction=nonstopmode"
        ];
      };
      vimtex_syntax_custom_cmds = [
        {
          name = "vec";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
        }
        {
          name = "vb";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
        }
        {
          name = "dd";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "d";
        }
        {
          name = "longrightarrow";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "⟶";
        }
        {
          name = "longleftarrow";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "⟵";
        }
        {
          name = "longleftrightarrow";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "⟷";
        }
        {
          name = "Longrightarrow";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "⇒";
        }
        {
          name = "Longleftarrow";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "⇐";
        }
        {
          name = "Longleftrightarrow";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "⇔";
        }
        {
          name = "longmapsto";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "↦";
        }
        {
          name = "surjto";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "↠";
        }
        {
          name = "injto";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "↪";
        }
        {
          name = "mi";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "i";
        }
        {
          name = "Q";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "ℚ";
        }
        {
          name = "C";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "ℂ";
        }
        {
          name = "N";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "ℕ";
        }
        {
          name = "Z";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "ℤ";
        }
        {
          name = "R";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "ℝ";
        }
        {
          name = "dg";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "°";
        }
        {
          name = "dang";
          mathmode = 1;
          conceal = 1;
          argstyle = "bold";
          concealchar = "∡";
        }
      ];
      vimtex_syntax_custom_cmds_with_concealed_delims = [
        {
          name = "ket";
          mathmode = 1;
          cchar_open = "|";
          cchar_close = "⟩";
        }
        {
          name = "bra";
          mathmode = 1;
          cchar_open = "⟨";
          cchar_close = "|";
        }
        {
          name = "abs";
          mathmode = 1;
          cchar_open = "|";
          cchar_close = "|";
        }
        {
          name = "norm";
          mathmode = 1;
          cchar_open = "‖";
          cchar_close = "‖";
        }
        {
          name = "floor";
          mathmode = 1;
          cchar_open = "⌊";
          cchar_close = "⌋";
        }
        {
          name = "mean";
          mathmode = 1;
          cchar_open = "⟨";
          cchar_close = "⟩";
        }
        {
          name = "braket";
          nargs = 2;
          mathmode = 1;
          cchar_open = "⟨";
          cchar_mid = "|";
          cchar_close = "⟩";
        }
        {
          name = "ketbra";
          nargs = 2;
          mathmode = 1;
          cchar_open = "|";
          cchar_mid = "X";
          cchar_close = "|";
        }
        {
          name = "frac";
          nargs = 2;
          mathmode = 1;
          cchar_open = " ";
          cchar_mid = "/";
          cchar_close = " ";
        }
        {
          name = "dfrac";
          nargs = 2;
          mathmode = 1;
          cchar_open = " ";
          cchar_mid = "/";
          cchar_close = " ";
        }
      ];
    };
    keymaps = lib.mkIf config.programs.nixvim.plugins.vimtex.enable [
      {
        mode = "n";
        key = "<leader>l";
        action = "+latex";
        options = {
          desc = "+latex";
        };
      }
      # Change of math mode ds$ --> dsm, cs$ --> csm, ts$ --> tsm
      {
        mode = "n";
        key = "dsm";
        action = "<Plug>(vimtex-env-delete-math)";
        options = {
          silent = true;
          noremap = false;
        };
      }
      {
        mode = "n";
        key = "csm";
        action = "<Plug>(vimtex-env-change-math)";
        options = {
          silent = true;
          noremap = false;
        };
      }
      {
        mode = "n";
        key = "tsm";
        action = "<Plug>(vimtex-env-toggle-math)";
        options = {
          silent = true;
          noremap = false;
        };
      }
      # Change of environment ]m --> ]e, ]M --> ]E, [m-->[e, [M --> [E
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "]e";
        action = "<Plug>(vimtex-]m)";
        options = {
          silent = true;
          noremap = false;
          desc = "next start of env";
        };
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "]E";
        action = "<Plug>(vimtex-]M)";
        options = {
          silent = true;
          noremap = false;
          desc = "next end of env";
        };
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "[e";
        action = "<Plug>(vimtex-[m)";
        options = {
          silent = true;
          noremap = false;
          desc = "prev. start of env";
        };
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "[E";
        action = "<Plug>(vimtex-[M)";
        options = {
          silent = true;
          noremap = false;
          desc = "prev. end of env";
        };
      }
      # Change of math mode ]n --> ]m, ]N --> ]M, [n-->[m, [N --> [M
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "]m";
        action = "<Plug>(vimtex-]n)";
        options = {
          silent = true;
          noremap = false;
          desc = "next start of math";
        };
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "]M";
        action = "<Plug>(vimtex-]N)";
        options = {
          silent = true;
          noremap = false;
          desc = "next end of math";
        };
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "[m";
        action = "<Plug>(vimtex-[n)";
        options = {
          silent = true;
          noremap = false;
          desc = "prev. start of math";
        };
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "[M";
        action = "<Plug>(vimtex-[N)";
        options = {
          silent = true;
          noremap = false;
          desc = "prev. end of math";
        };
      }
      # Change of itemize/enumerate environment am --> ai, im --> ii
      {
        mode = [
          "x"
          "o"
        ];
        key = "ai";
        action = "<Plug>(vimtex-am)";
        options = {
          silent = true;
          noremap = false;
        };
      }
      {
        mode = [
          "x"
          "o"
        ];
        key = "ii";
        action = "<Plug>(vimtex-im)";
        options = {
          silent = true;
          noremap = false;
        };
      }
      # Change of math mode a$ --> am, i$ --> im
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "am";
        action = "<Plug>(vimtex-a$)";
        options = {
          silent = true;
          noremap = false;
        };
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "im";
        action = "<Plug>(vimtex-i$)";
        options = {
          silent = true;
          noremap = false;
        };
      }
    ];
  };
}
