{pkgs,...}:
{
	programs.nixvim.plugins.mini = {
		enable = true;
		modules = {
			indentscope = {};
			cursorword = {};
			comment = {};
			notify = {};
			surround.mappings = {
				add = "gsa";
				delete = "gsd";
				find = "gsf";
				find_left = "gsF";
				hightlight = "gsh";
				replace = "gsr";
				update_n_lines = "gsn";
			};
		};
	};
}
