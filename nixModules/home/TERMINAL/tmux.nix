{pkgs, ...}:
{
	programs.tmux = {
		enable = true;
		plugins = with pkgs.tmuxPlugins; [
			vim-tmux-navigator
			resurrect
			yank
			tokyo-night-tmux
    	];
		clock24 = true;
		mouse = true;
		baseIndex = 1;
		escapeTime = 0;
		keyMode = "vi";
		prefix = "C-Space";
		shell = "${pkgs.fish}/bin/fish";
		terminal = "screen-256color";
		disableConfirmationPrompt = true;
		extraConfig = ''
    		bind v copy-mode
    		bind-key -T copy-mode-vi v send-keys -X begin-selection
    		bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    		bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    		bind-key b set-option status
    		bind '"' split-window -v -c "#{pane_current_path}"
    		bind % split-window -h -c "#{pane_current_path}"
			set-option -g status-position top
			set -g pane-border-style fg=colour8
			set -g pane-active-border-style fg=colour229
		'';
	};
}
