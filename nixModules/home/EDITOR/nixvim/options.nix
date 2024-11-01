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
			vimtex_compiler_latexmk = {
				options = [
				"-shell-escape"
    			"-verbose"
				"-file-line-error"
				"-synctex=1"
				"-interaction=nonstopmode"
				];
			};
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
					cchar_close = "⟩⟨";
					cchar_mid = "|";
				}
				{
					name = "abs";
					mathmode = 1;
					cchar_open = "|";
					cchar_close = "|";
				}
				{
					name = "vec";
					mathmode = 1;
					conceal = 1;
					argstyle = "bold";
				}
			];
		};
		opts = {
			number = true;
			relativenumber = true;
			timeoutlen = 250;
			smartindent = true;
			cursorline = true;
			shiftwidth = 4;
			signcolumn = "yes";
			tabstop = 4;
			updatetime = 50;
			termguicolors = true;
			mouse = "a";
			swapfile = false;
			conceallevel = 2;
			# spell = true;
			# spelllang = ["en_us" "es"];
			ignorecase = true;
			smartcase = true;
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
			{
				mode = "n";
				key = "<leader>cs";
				action = ":setlocal spell spelllang=es<CR>";
				options.desc = "Change spelllang to Spanish";
				options.silent = true;
				options.noremap = true;
			}
			{
				mode = "n";
				key = "<leader>ce";
				action = ":setlocal spell spelllang=en_us<CR>";
				options.desc = "Change spelllang to English";
				options.silent = true;
				options.noremap = true;
			}
			{
				mode = "n";
				key = "<leader>gg";
				action = ":Lazygit<CR>";
				options.desc = "Open lazygit";
				options.silent = true;
				options.noremap = true;
			}
		];
	};
}
