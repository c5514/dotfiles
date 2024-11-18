{pkgs,...}:
{
	programs.zellij = {
		enable = true;
		enableFishIntegration = true;
		settings = {
			theme = "one-half-dark";
			simplified_ui = true;
			pane_frames = false;
			ui.pane_frames.hide_session_name = true;
		};
	};
	xdg.configFile."zellij/layouts/default.kdl".text = ''
		layout {
			pane size=1 borderless=true {
				plugin location="compact-bar"
			}
			pane
		}
	'';
}
