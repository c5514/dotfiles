{pkgs,...}:
{
	programs.nixvim = {
		globals = {
			mapleader = " ";
			maplocalleader = " ";
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
			# concealcursor = "nc";
			encoding = "utf-8";
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
				action = "<cmd>LazyGit<CR>";
				options.desc = "Open lazygit";
				options.silent = true;
				options.noremap = true;
			}
			{
				mode = "n";
				key = "<leader>yy";
				action = "<cmd>Yazi<CR>";
				options.desc = "Open Yazi";
				options.silent = true;
				options.noremap = true;
			}
			{
				mode = "n";
				key = "<leader>yd";
				action = "<cmd>Yazi cwd<CR>";
				options.desc = "Open Yazi in current directory";
				options.silent = true;
				options.noremap = true;
			}
			{
				mode = "n";
				key = "<leader>yr";
				action = "<cmd>Yazi toggle<CR>";
				options.desc = "Resume last Yazi session";
				options.silent = true;
				options.noremap = true;
			}
		];
	};
}
