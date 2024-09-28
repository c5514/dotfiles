{pkgs,...}:
{
	programs.nixvim = {
		globals = {
			mapleader = " ";
			maplocalleader = " ";
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
		};
		opts = {
			number = true;
			relativenumber = true;
			shiftwidth = 4;
			signcolumn = "yes";
			tabstop = 4;
			updatetime = 150;
			termguicolors = true;
			mouse = "a";
			swapfile = false;
			conceallevel = 2;
		};
		clipboard.register = "unnamedplus";
		keymaps = [
			{
				key = ";";
				action = ":";
			}
			{
				mode = "i";
				key = "jk";
				action = "<ESC>";
				options.silent = true;
			}
		];
	};
}
