{pkgs,...}:

{
	programs.hyprlock = {
		enable = true;
		settings = {
			general = {
    			disable_loading_bar = true;
    			hide_cursor = false;
    			no_fade_in = true;
    		};
			background = {
    			monitor = "";
    			path = "~/nixwall.png";
			};
			input-field = [{
    			monitor = "";
    			size = "200, 50";
    			outline_thickness = 3;
    			dots_size = 0.33;
				dots_spacing = 0.15;
    			dots_center = true;
    			dots_rounding = -1;
    			outer_color = "rgb(151515)";
    			inner_color = "rgb(CFCFCF)";
    			font_color = "rgb(10, 10, 10)";
    			fade_on_empty = true;
    			fade_timeout = 1000;
    			placeholder_text = ''<i>Input Password...</i>''; 
    			hide_input = false;
    			rounding = -1;
    			check_color = "rgb(204, 136, 34)";
    			fail_color = "rgb(204, 34, 34)";
    			fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
    			fail_transition = 200;
    			capslock_color = -1;
    			numlock_color = -1;
    			bothlock_color = -1;
    			invert_numlock = false;
    			swap_font_color = false;
    			position = "0, -20";
    			halign = "center";
    			valign = "center";
			}];
			label = [
			{
    			monitor = "";
    			#clock
    			text = "cmd[update:1000] echo '$TIME'";
    			color = "rgba(200, 200, 200, 1.0)";
    			font_size = 80;
    			font_family = "Font Awesome";
    			position = "100, 125";
    			halign = "left";
    			valign = "bottom";
    			shadow_passes = 5;
    			shadow_size = 10;
			}
			{
				monitor = "";
				text = " ";
				shadow_passes = 1;
				shadow_boost = "0.5";
    			color = "rgba(200, 200, 200, 1.0)";
				font_size = 21;
				font_family = "Font Awesome";
				position = "0, 65";
				halign = "center";
				valign = "bottom";
			}
			{
				monitor = "";
				text = "locked";
				shadow_passes = 1;
				shadow_boost = "0.5";
    			color = "rgba(200, 200, 200, 1.0)";
				font_size = 14;
				font_family = "Font Awesome";
				position = "0, 45";
				halign = "center";
				valign = "bottom";
			}
			{
    			monitor = "";
    			text = "$USER";
    			color = "rgba(200, 200, 200, 1.0)";
    			font_size = 35;
    			font_family = "Font Awesome";
    			position = "110, 250";
    			halign = "left";
    			valign = "bottom";
    			shadow_passes = 5;
    			shadow_size = 10;
			}];
		};
	};
}
