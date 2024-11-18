{pkgs,...}:
{
	programs.nixvim.plugins = {
		treesitter = {
			enable = true;
			settings = {
				highlight = {
					enable = true;
					disable = ["latex"];
				};
				indent.enable = true;
			};
			grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
				bash
				c 
				cpp
				json
				lua 
				markdown
				markdown-inline
				nix 
				latex
				python
				rasi
				toml
				vim
				zig
				html
			];
		};
		treesitter-context.enable = true;
	};
}
