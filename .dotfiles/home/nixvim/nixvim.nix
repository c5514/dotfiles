{ inputs,config,lib,...}:
{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./options.nix
		./plugins/bufferline.nix
		./plugins/cmp.nix
		./plugins/dashboard.nix
		./plugins/lsp.nix
		./plugins/lualine.nix
		./plugins/luasnip.nix
		./plugins/neotree.nix
		./plugins/telescope.nix
		./plugins/todoComents.nix
		./plugins/treesitter.nix
		./plugins/vimtex.nix
	];
	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		colorschemes.onedark = {
			enable = true;
			settings = {
				style = "warmer";
    			transparent = true;
			};
		};
		plugins = {
			web-devicons.enable = true;
			which-key.enable = true;
			indent-blankline.enable = true;
			comment.enable = true;
			nvim-autopairs.enable = true;
			comment-box.enable = true;
			rainbow-delimiters.enable = true;
			nvim-colorizer.enable = true;
			noice.enable = true;
		};
	};
}
