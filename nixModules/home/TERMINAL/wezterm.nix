{pkgs,...}:
{
	home.sessionVariables.TERMINAL = "wezterm";
	programs.wezterm = {
		enable = true;
		package = pkgs.wezterm;
		enableBashIntegration = true;
		enableZshIntegration = true;
	};
}
