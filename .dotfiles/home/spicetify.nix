{pkgs,lib, spicetify-nix, ...}:
let 
	spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
	imports = [ spicetify-nix.homeManagerModules.default ];
	programs.spicetify = {
		enable = true;
		theme = spicePkgs.themes.dribbblish;
		colorScheme = "lunar";
		enabledExtensions = with spicePkgs.extensions; [
			adblock
			hidePodcasts
			shuffle
		];
	};
}
