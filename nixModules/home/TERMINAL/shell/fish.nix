{pkgs, ...}:
{
	programs.fish = {
		enable = true;
		package = pkgs.fish;
		interactiveShellInit = ''
			set fish_greeting
		'';
		shellAliases = {
    		ll = "ls -l";
    		ff = "fastfetch";
    		tex = "cd ~/Documents/Vim/Tex/";
			dwn = "cd ~/Downloads/";
			doc = "cd ~/Documents/";
    		nv = "nvim";
    		".." = "cd ..";
    		cc = "clear";
			ee = "exit";
			ns = "nix-shell --run fish";
			hmS = "home-manager switch --flake .";
			hmG = "home-manager generations";
			hmR = "home-manager remove-generations";
			nixS = "sudo nixos-rebuild switch --flake .";
			nixG = "nixos-rebuild list-generations";
			nixR = "sudo nix-env -p /nix/var/nix/profiles/system/ --delete-generations";
			garb = "nix-collect-garbage";
		};
	};
}
