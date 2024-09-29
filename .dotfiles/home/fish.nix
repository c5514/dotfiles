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
    		cc = "clear";
			ee = "exit";
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
