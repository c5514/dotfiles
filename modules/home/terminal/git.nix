{pkgs,...}:
{
	programs = {
		gh.enable = true;
		lazygit.enable = true;
		git = {
			enable = true;
			userName = "c5514";
			userEmail = "c5514@c5514.com";
			extraConfig = {
				init.defaultBranch = "main";
				core.editor = "nvim";
				github.user = "c5514";
			};
		};
		ssh = {
			enable = true;
			addKeysToAgent = "yes";
		};
	};
	services.ssh-agent.enable = true;
}
