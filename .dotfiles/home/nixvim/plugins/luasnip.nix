{pkgs, ...}:
{
	programs.nixvim.plugins.luasnip = {
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
			{	paths = "~/.dotfiles/home/nvim/snippets";	}
		];
	};
}
