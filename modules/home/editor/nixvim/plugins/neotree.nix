{pkgs,...}:
{
	programs.nixvim = {
		keymaps = [
			{
				mode = "n";
				key = "<leader>e";
				action = ":Neotree action=focus reveal toggle<CR>";
				options.silent = true;
			}
		];
		plugins.neo-tree = {
			enable = true;
			filesystem.filteredItems.visible = true;
		};
	};
}
