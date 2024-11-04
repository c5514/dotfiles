{ inputs,pkgs,...}:
let 
	illustrate = pkgs.vimUtils.buildVimPlugin {
		pname = "illustrate";
		version = "2024-08-06";
		src = inputs.illustrate;
	};
in
{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./options.nix
		./plugins/alpha.nix
		./plugins/autopairs.nix
		./plugins/bufferline.nix
		./plugins/cmp.nix
		./plugins/conform.nix
		./plugins/lsp.nix
		./plugins/lualine.nix
		./plugins/luasnip.nix
		./plugins/mini.nix
		./plugins/neotree.nix
		./plugins/noice.nix
		./plugins/obsidian.nix
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
			comment-box.enable = true;
			rainbow-delimiters.enable = true;
			nvim-colorizer.enable = true;
			lsp-lines.enable = true;
			trouble.enable = true;
			lazygit.enable = true;
			yazi.enable = true;
			# tmux-navigator.enable = true;
			zellij.enable = true;
			gitsigns.enable = true;
			markview.enable = true;
		};
		extraPlugins = [ 
			illustrate
		];
		extraConfigLua = ''${builtins.readFile ./plugins/illustrate.lua}'';
	};
}
