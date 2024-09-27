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
