{pkgs, ...}:
let myAliases = {
    		ll = "ls -l";
    		ff = "fastfetch";
    		tx = "cd ~/Documents/Vim/Tex/";
			dwn = "cd ~/Downloads/";
			doc = "cd ~/Documents/";
    		nv = "nvim";
    		".." = "cd ..";
    		cc = "clear";
			ee = "exit";
			# ns = "nix-shell --run fish";
			# dot = "zellij attach dotfiles";
			hmS = "home-manager switch --flake .";
			hmG = "home-manager generations";
			hmR = "home-manager remove-generations";
			nixS = "sudo nixos-rebuild switch --flake .";
			nixG = "nixos-rebuild list-generations";
			nixR = "sudo nix-env -p /nix/var/nix/profiles/system/ --delete-generations";
			garb = "nix-collect-garbage";
			garbd = "nix-collect-garbage -d";
	};
	in
{
	imports = [
		./starship.nix
		./eza.nix
	];
	programs.fish = {
		enable = true;
		package = pkgs.fish;
		interactiveShellInit = ''
			set fish_greeting
		'';
		shellAliases = 	myAliases;
	};
	programs.bash = {
		enable = true;
		enableCompletion = true;
		historyFileSize = 10000;
		historyIgnore = [
			"ls" "cd" ".." "ee" "cc" "ll" "ff"
		];
		shellAliases = myAliases;
	};
	programs.zsh = {
		enable = true;
		autosuggestion = {
			enable = true;
			highlight = "fg=#6f6c5d";
			strategy = [
				"history"
				"completion"
				"match_prev_cmd"
			];
		};
		syntaxHighlighting = {
			enable = true;
		};
		history = {
        	path = "$HOME/.histfile";
        	save = 10000;
        	size = 10000;
    	};
		shellAliases = myAliases;
	};
}
