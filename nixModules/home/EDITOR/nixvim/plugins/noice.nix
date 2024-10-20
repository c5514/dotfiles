{pkgs,...}:
{
	programs.nixvim.plugins = {
		noice = {
			enable = true;
			notify.enabled = false;
			lsp = {
				message.enabled = false;
				progress = {
					enabled = true;
					view = "mini";
				};
			};
		};
		notify = {
			enable = true;
			backgroundColour = "#000000";
		};
	};
}
