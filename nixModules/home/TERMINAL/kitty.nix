{pkgs, ...}:
{
	home.sessionVariables.TERMINAL = "kitty";
	programs.kitty = {
		enable = true;
		package = pkgs.kitty;
		font.name = "JetBrainsMono";
		font.size = 13;
		themeFile = "Dark_Pastel";
		shellIntegration.enableFishIntegration = true;
		settings = {
			background = "#000000";
			background_opacity = "0.95";
			padding_width = 15;
			padding_height = 15;
			copy_on_select = "yes";
			allow_bold = "yes";
			allow_italic = "yes";
			scrollback_lines = 2000;
			scrollback_pager-history_size = 0; 
			wheel_scroll_multiplier = "5.0";
			touch_scroll_multiplier = "5.0";
			url_color = "#4287f5";
			url_style = "curly";
			open_url_modifiers =  "none";
			open_url_with = "default";
			url_prefixes = "http https file ftp git";
		};
	};
}
