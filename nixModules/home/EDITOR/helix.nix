{pkgs,...}:
{
	programs.helix = {
		enable = true;
		package  = pkgs.evil-helix;
		settings = {
			theme = "onedark";
			editor = {
				line-number = "relative";
				lsp.display-messages = true;
			};
		};
	};
}
