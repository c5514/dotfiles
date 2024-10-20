{pkgs,...}:
{
	programs.zellij = {
		enable = true;
		enableFishIntegration = true;
		settings = {
			theme = "one-half-dark";
			status-bar.enabled = false;
		};
	};
}
