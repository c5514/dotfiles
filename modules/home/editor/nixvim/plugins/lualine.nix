{pkgs,...}:
{
	programs.nixvim.plugins.lualine = {
		enable = true;
		settings.disabled_filetypes = {
			statusline = [
				"alpha"
			];
		};
	};
}
