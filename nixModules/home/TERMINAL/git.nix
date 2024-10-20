{pkgs,...}:
{
	programs.gh.enable = true;
	programs.lazygit.enable = true;
	programs.git = {
		enable = true;
		userName = "c5514";
		userEmail = "c5514@c5514.com";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};
}
