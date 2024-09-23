{pkgs, ...}:
let starshipCmd = "${pkgs.starship}/bin/starship";
in
{
	programs.fish = {
		enable = true;
		package = pkgs.fish;
		interactiveShellInit = ''
			set fish_greeting
			eval "$(${starshipCmd} init fish)"
		'';
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
