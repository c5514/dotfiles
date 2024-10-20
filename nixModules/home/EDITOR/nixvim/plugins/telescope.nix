{pkgs,...}:
{
	programs.nixvim.plugins.telescope = {
		enable = true;
		extensions = {
    		file-browser.enable = true;
    		ui-select.enable = true;
    		frecency.enable = true;
    		fzf-native.enable = true;
			media-files.enable = true;
		};
		settings = {
			defaults = {
				# path_display = "smart";#Not sure if syntax is correct
				mappings = {
					i = {
						"<C-k>" = {
							__raw = "require('telescope.actions').move_selection_previous";
						};
						"<C-j>" = {
							__raw = "require('telescope.actions').move_selection_next";
						};
						"<C-q>" = {
							__raw = "require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist";
						};
					};
				};
			};
		};
		keymaps = {
			"<C-p>" = {
				action = "git_files";
				options = {
					desc = "Telescope Git Files";
				};
			};
			"<leader>ff" = {
				action = "find_files";
				options = {
					desc = "Telescope Find Files";
				};
			};
			"<leader>fr" = {
				action = "oldfiles";
				options = {
					desc = "Telescope Recent Files";
				};
			};
			"<leader>fs" = {
				action = "live_grep";
				options = {
					desc = "Telescope Find string in cwd";
				};
			};
			"<leader>fc" = {
				action = "grep_string";
				options = {
					desc = "Telescope Find string under cursor";
				};
			};
		};
	};
}
