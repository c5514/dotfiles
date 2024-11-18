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
			timeoutlen = 100;
			smartindent = true;
			cursorline = true;
			shiftwidth = 4;
			signcolumn = "yes";
			tabstop = 4;
			updatetime = 50;
			termguicolors = true;
			mouse = "a";
			swapfile = false;
			undofile = true;
			backup = false;
			conceallevel = 2;
			# concealcursor = "nc";
			encoding = "utf-8";
			fileencoding = "utf-8";
			ignorecase = true;
			smartcase = true;
			scrolloff = 8;
			foldcolumn = "1";
			foldlevel = 99;
			foldlevelstart = 99;
			foldenable = true;
			completeopt = [
				"menuone"
				"noselect"
				"noinsert"
			];
		};
		clipboard.register = "unnamedplus";
		keymaps = [
			{
				mode = "n";
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
