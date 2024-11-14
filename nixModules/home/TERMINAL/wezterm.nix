{inputs, pkgs, ...}:
{
	home.sessionVariables.TERMINAL = "wezterm";
	programs.wezterm = {
		enable = true;
		package = inputs.wezterm.packages.${pkgs.system}.default;
		enableBashIntegration = true;
		enableZshIntegration = true;
	};
}
