{pkgs,lib,config, ...}:
{
	programs.nixvim = {
		plugins.luasnip = {
			enable = true;
			settings = {
				enable_autosnippets = true;
				store_selection_keys = "<Tab>";
				history = true;
				updateevents = "TextChanged,TextChangedI";
			};
			fromVscode = [
				{
					lazyLoad = true;
					paths = "${pkgs.vimPlugins.friendly-snippets}";
				}
			];
			fromLua = [
				{	paths = "~/.dotfiles/nixModules/home/EDITOR/nixvim/snippets";	}
			];
		};
		keymaps = lib.mkIf config.programs.nixvim.plugins.luasnip.enable [
			{
				mode = ["s" "i"] ;
				key = "<C-e>";
				action = "<Plug>luasnip-next-choice";
				options = {
					silent = true;
				};
			}
			{
				mode = ["s" "i"] ;
				key = "<C-t>";
				action = "<cmd>lua _G.dynamic_node_external_update(1)<Cr>";
				options = {
					noremap = true;
				};
			}
			{
				mode = ["s" "i"] ;
				key = "<C-g>";
				action = "<cmd>lua _G.dynamic_node_external_update(2)<Cr>";
				options = {
					noremap = true;
				};
			}
		];
	};
}
