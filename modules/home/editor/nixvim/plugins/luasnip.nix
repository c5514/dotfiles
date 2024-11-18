{pkgs,lib,config, ...}:
{
	xdg.configFile."snippets".source = ../snippets;
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
					exclude = [ "tex" ];
					paths = "${pkgs.vimPlugins.friendly-snippets}";
				}
			];
			fromLua = [
				{	paths = "~/.config/snippets";	}
			];
		};
		keymaps = lib.mkIf config.programs.nixvim.plugins.luasnip.enable [
			{
				mode = ["s" "i"] ;
				key = "<C-l>";
				action = "<Plug>luasnip-next-choice";
				options = {
					silent = true;
				};
			}
			{
				mode = ["s" "i"] ;
				key = "<C-f>";
				action = "<cmd>lua _G.dynamic_node_external_update(1)<Cr>";
				options = {
					noremap = true;
				};
			}
			{
				mode = ["s" "i"] ;
				key = "<C-d>";
				action = "<cmd>lua _G.dynamic_node_external_update(2)<Cr>";
				options = {
					noremap = true;
				};
			}
		];
	};
}
