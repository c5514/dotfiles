{pkgs, ...}:
{
	programs.fish = {
		enable = true;
		package = pkgs.fish;
		shellAliases = {
    		ll = "ls -l";
    		ff = "fastfetch";
    		tex = "cd ~/Documents/Vim/Tex/";
			dwn = "cd ~/Downloads/";
			doc = "cd ~/Documents/";
    		nv = "nvim";
    		".." = "cd ..";
    		c = "clear";
		};
	};
}
