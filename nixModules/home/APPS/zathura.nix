{pkgs, ...}:
{
  programs.zathura = {
    enable = true;
	package = pkgs.zathura;
    options = {
    	adjust-open = "best-fit";
    	pages-per-row = "1";
		zoom-min = "10";
    	font = "FontAwesome 15";

    	default-bg = "rgba(0,0,0,0.4)";
		default-fg = "#F7F7F6";

		statusbar-fg = "#B0B0B0";
		statusbar-bg = "#202020";
		inputbar-bg = "#151515";
		inputbar-fg = "#FFFFFF";
		notification-error-bg = "#AC4142";
		notification-error-fg = "#151515";
		notification-warning-bg = "#AC4142";
		notification-warning-fg = "#151515";
		completion-highlight-fg = "rgba(15,10,222,0.2)";
		completion-highlight-bg = "rgba(255,255,224,0)";
		highlight-active-color = "rgba(144,238,144,0.5)";
		highlight-color = "rgba(255,255,50,0.5)";
		highlight-fg = "rgba(243,54,54,0.7)";
		completion-bg = "#303030";
		completion-fg = "#E0E0E0";
		notification-bg = "rgba(255,255,224,0)";
		notification-fg = "transparent";

		recolor = "true";
		recolor-lightcolor = "rgba(0,0,0,0.9)";
		recolor-darkcolor = "#E0E0E0";
		recolor-reverse-video = "true";
		recolor-keephue = "true";

		selection-notification = true;
    	selection-clipboard = "clipboard";

    	scroll-page-aware = "true";
    	scroll-full-overlap = "0.01";
    	scroll-step = "100";
		render-loading = "false";
    };
  };
}
