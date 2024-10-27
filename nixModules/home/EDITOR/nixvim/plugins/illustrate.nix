{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>is";
			action = "function() require('illustrate').create_and_open_svg() end";
			options.desc = "Create and open a new SVG file with provided name and set write permissions";
			options.silent = true;
		}
		{
			mode = "n";
			key = "<leader>ia";
			action = "function() require('illustrate').create_and_open_ai() end";
			options.desc = "Create and open a new Adobe Illustrator file with provided name";
			options.silent = true;
		}
		{
			mode = "n";
			key = "<leader>io";
			action = "function() require('illustrate').open_under_cursor() end";
			options.desc = "Open file under cursor or file within environment under cursor";
			options.silent = true;
		}
		{
			mode = "n";
			key = "<leader>if";
			action = "function() require('illustrate.finder').search_and_open() end";
			options.desc = "Search and open illustrations in default app";
			options.silent = true;
		}
		{
			mode = "n";
			key = "<leader>ic";
			action = "function() require('illustrate.finder').search_create_copy_and_open() end";
			options.desc = "Search existing file, copy it with a new name and open it in default app";
			options.silent = true;
		}
	];
}
