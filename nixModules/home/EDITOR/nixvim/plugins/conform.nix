{pkgs,...}:
{
	programs.nixvim.plugins.conform-nvim = {
		enable = true;
		settings = {
			format_on_save = {
				lspFallback = true;
				timeoutMs = 500;
			};
			notify_on_error = true;
			formatters_by_ft = {
				css = [
					[
						"prettierd"
						"prettier"
					]
				];
				html = [
					[
						"prettierd"
						"prettier"
					]
				];
				lua = ["stylua"];
				python = ["black"];
				typescript = [
					[
						"prettierd"
						"prettier"
					]
				];
				typescriptreact = [
					[
						"prettierd"
						"prettier"
					]
				];
				nix = ["nixfmt"];
				markdown = [
					[
						"prettierd"
						"prettier"
					]
				];
				latex = ["latexindent"];
			};
		};
	};
}
