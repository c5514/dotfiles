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
	};
}
