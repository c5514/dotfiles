{pkgs,...}:
{
	home.sessionVariables.TERMINAL = "wezterm";
	programs.wezterm = {
		enable = true;
		enableBashIntegration = true;
		enableFishIntegration = true;
		enableZshIntegration = true;
	};
}
