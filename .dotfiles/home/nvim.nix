
{pkgs, ...}: {
	programs.neovim = 
	let 
		toLua = str: "lua << EOF\n${str}\nEOF\n";
		toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
	in
	{
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		extraLuaConfig = ''${builtins.readFile ./nvim/options.lua}'';
		plugins = 
		let
	 	nvim-treesitter-with-plugins = pkgs.vimPlugins.nvim-treesitter.withPlugins (treesitter-plugins:
	 	with treesitter-plugins; [
			bash
			c 
			cpp
			json
			lua 
			nix 
			python
			rasi
			toml
			vim
			zig
		]);
		in 
		with pkgs.vimPlugins; [
			nvim-treesitter-with-plugins
			nui-nvim
			nvim-web-devicons
			plenary-nvim
			{
				plugin = nvim-lspconfig;
				config = toLuaFile ./nvim/configs/lsp.lua;
			}
			{
				plugin = nvim-treesitter-context;
				config = toLuaFile ./nvim/configs/treesitterContext.lua;
			}
			{
				plugin = nvim-autopairs;
				config = toLua "require(\"nvim-autopairs\").setup()";
			}
			{
				plugin = indent-blankline-nvim;
				config = toLua "require(\"ibl\").setup()";
			}
			{
				plugin = dashboard-nvim;
				config = toLuaFile ./nvim/configs/dashboard.lua;
			}
			{
				plugin = bufferline-nvim;
				config = toLua "require(\"bufferline\").setup{}";
			}
			{
				plugin = nvim-cmp;
				config = toLuaFile ./nvim/configs/cmp.lua;
			}
			cmp-nvim-lsp
			cmp_luasnip
			cmp-buffer
			cmp-path
			{
				plugin = vimtex;
				config = toLuaFile ./nvim/configs/vimtex.lua;
			}
			{
				plugin = comment-nvim;
				config = toLua "require(\"Comment\").setup()";
			}
			{
				plugin = lualine-nvim;
				config = toLuaFile ./nvim/configs/lualine.lua;
			}
			{
				plugin = todo-comments-nvim;
				config = toLuaFile ./nvim/configs/todoComments.lua;
			}
			{
				plugin = onedark-nvim;
				config = toLuaFile ./nvim/configs/onedark.lua;
			}
			{
				plugin = telescope-nvim;
				config = toLuaFile ./nvim/configs/telescope.lua;
			}
			which-key-nvim
			{
				plugin = neo-tree-nvim;
				config = toLuaFile ./nvim/configs/neotree.lua;
			}
			friendly-snippets
			{
				plugin = luasnip;
				config = toLuaFile ./nvim/configs/luasnip.lua;
			}
		];
		extraPackages = with pkgs; [
			# LSP 
			lua-language-server
			nixd
			texlab
			pyright
			# Tools 
			cmake
			fzf
			gcc
			gnumake
		];
	};
}
