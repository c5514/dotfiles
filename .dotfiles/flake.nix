{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
	grub2-themes.url = "github:vinceliuice/grub2-themes";
	ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, grub2-themes, ags, ... }:
    let 
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
			./configuration.nix
			grub2-themes.nixosModules.default
		];
        specialArgs = {
          inherit pkgs-unstable;
		  inherit grub2-themes;
        };
      };
    };
    homeConfigurations = {
      c5514 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
		extraSpecialArgs = { inherit ags; };
        modules = [ ./home.nix ];
      };
    };
  };
}
