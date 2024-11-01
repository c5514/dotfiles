{pkgs, ...}:
{
	programs.tmux = {
		enable = true;
		clock24 = true;
		disableConfirmationPrompt = true;
		keyMode = "vi";
		mouse = true;
		terminal = "screen-256color";
		shell = "${pkgs.fish}/bin/fish";
		plugins = with pkgs.tmuxPlugins; [
			vim-tmux-navigator
			yank
		];
		extraConfig = ''
			bind v copy-mode
			bind-key -T copy-mode-vi v send-keys -X begin-selection
			bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
			bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
			bind-key b set-option status
			bind '"' split-window -v -c "#{pane_current_path}"
			bind % split-window -h -c "#{pane_current_path}"

			set-option -g status-right-length 100
			set-option -g @indicator_color "yellow"
			set-option -g @window_color "magenta"
			set-option -g @main_accent "blue"
			set-option -g pane-active-border fg=black
			set-option -g pane-border-style fg=black
			set-option -g window-status-separator ""
		'';
	};
}
