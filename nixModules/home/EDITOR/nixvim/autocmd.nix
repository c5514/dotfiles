{
	programs.nixvim.autoCmd = [
		{
			event = ["FileType"];
			pattern = [
				"tex"
				"latex"
				"markdown"
			];
			command = "setlocal spell spelllang=es,en";
		}
		{
			event = "TextYankPost";
			pattern = "*";
			command = "lua vim.highlight.on_yank{timeout=500}";
		}
	];
}
