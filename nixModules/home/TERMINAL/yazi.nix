{pkgs, ...}:
{
	programs.yazi = {
		enable =true;
		package = pkgs.yazi;
		enableFishIntegration = true;
		settings = {
			manager = {
				show_hidden = true;
				sort_by = "modified";
				sort_dir_first = true;
				sort_reverse = true;
			};
		};
		theme =  {
			manager = {
				cwd = { fg = "#61AFEF";};
				hovered = { bg = "#282C34";};
				preview_hovered.underline = true;
				find_keyword = { fg = "#E06C75"; italic = true; underline = true;};
				find_position = { fg = "#E5C07B"; italic = true;};
				marker_copied = { fg = "#ABB2BF"; bg = "#98C379"; };
				marker_cut = { fg = "#ABB2BF"; bg = "#E06C75"; };
				marker_marked = { fg = "#ABB2BF"; bg = "#56B6C2"; };
				marker_selected = { fg = "#ABB2BF"; bg = "#E5C07B"; };
				tab_active = { bg = "#282C34"; fg = "#61AFEF"; }; 
				tab_width = 1;
				count_copied = { fg = "#98C379"; bg = "#282C34"; };
				count_cut = { fg = "#E06C75"; bg = "#282C34"; };
				count_selected = { fg = "#98C379"; bg = "#282C34"; };
				border_symbol = "│";
				border_style = { fg = "#282C34"; };
			};
			status = {
				separator_open = "";
				separator_close = "";
				separator_style = { fg = "#61AFEF"; bg = "#282C34"; };
				mode_normal = { fg = "#282C34"; bg = "#61AFEF"; bold = true; };
				mode_select = { fg = "#282C34"; bg = "#61AFEF"; bold = true; };
				mode_unset = { fg = "#282C34"; bg = "#61AFEF"; bold = true; };
				progress_label = { fg = "#ABB2BF"; bold = true; };
				progress_normal = { fg = "#98C379"; bg = "#282C34"; };
				progress_error = { fg = "#E06C75"; bg = "#282C34"; };
				permissions_t = { fg = "#98C379"; };
				permissions_r = { fg = "#E06C75"; };
				permissions_w = { fg = "#E5C07B"; };
				permissions_x = { fg = "#98C379"; };
				permissions_s = { fg = "#ABB2BF"; };
			};
			select = {
				border = { fg = "#98C379"; };
				active = { fg = "#E5C07B"; bold = true;};
			};
			input = {
				border = { fg = "#98C379";};
				selected.reversed = true;
			};
			completion.border = { fg = "#98C379";};
			tasks = {
				border = {fg = "#98C379";};
				hovered = {fg = "#E5C07B"; underline = true;};
			};
			which = {
				mask = { bg = "#282C34"; };
				cand = { fg = "#98C379"; };
				rest = { fg = "#ABB2BF"; };
				desc = { fg = "#E5C07B"; };
				separator = "  ";
				separator_style = { fg = "#ABB2BF"; }; 
			};
			help = {
				on = {fg = "#98C379";};
				run = {fg = "#E5C07B";};
				hovered = {reversed = true; bold = true;};
				footer = {fg = "#ABB2BF";bg = "#000000";};
			 };
			notify = {
				title_info = {fg = "#98C379";};
				title_warn = {fg = "#E06C75";};
				title_error = {fg = "#E5C07B";};
			};
			filetype = {
				rules = [
					# Images
					{ mime = "image/*"; fg = "#E5C07B"; }# Orange
					# Media
					{ mime = "video/*"; fg = "#E06C75"; }# Red
					{ mime = "audio/*"; fg = "#E06C75"; }# Red
					# Archives
					{ mime = "application/zip"; fg = "#C678DD"; }# Magenta
					{ mime = "application/x-tar"; fg = "#C678DD"; }# Magenta
					{ mime = "application/x-bzip*"; fg = "#C678DD"; }# Magenta
					{ mime = "application/x-bzip2"; fg = "#C678DD"; }# Magenta
					{ mime = "application/x-7z-compressed"; fg = "#C678DD"; }# Magenta
					{ mime = "application/x-rar"; fg = "#C678DD"; }# Magenta
					{ mime = "application/x-xz"; fg = "#C678DD"; }# Magenta
					# Documents
					{ mime = "application/doc"; fg = "#D3D3D3"; }# Green
    				{ mime = "application/pdf"; fg = "#D3D3D3"; }# Green
    				{ mime = "application/rtf"; fg = "#D3D3D3"; }# Green
    				{ mime = "application/vnd.*"; fg = "#D3D3D3"; }# Green
					# Fallback
    				{ name = "*"; fg = "#ABB2BF"; }# Blue
    				{ name = "*/"; fg = "#61AFEF"; }# Blue
				];
			};
		};
	};
}
