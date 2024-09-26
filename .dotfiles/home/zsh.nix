{pkgs, ...}: {
	programs.zsh = {
		enable = true;
		autosuggestion = {
			enable = true;
			highlight = "fg=#6f6c5d";
		};
		history = {
        	path = "$HOME/.histfile";
        	save = 10000;
        	size = 10000;
    	};
		shellAliases = {
    		ll = "ls -l";
    		ff = "fastfetch";
    		tex = "cd ~/Documents/Vim/Tex/";
    		nv = "nvim";
    		".." = "cd ..";
    		c = "clear";
		};
	};
}
