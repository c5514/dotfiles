{
  description = "My first flake";

  inputs = {
	nixpkgs.url = "nixpkgs/nixos-unstable";
	home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
	grub2-themes.url = "github:vinceliuice/grub2-themes";
	sddm-sugar-candy-nix = {
		url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	ags.url = "github:Aylur/ags";
	hyprland-contrib = {
		url = "github:hyprwm/contrib";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	hyprland = {
		url = "git+https://github.com/hyprwm/hyprland?submodules=1";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	hyprland-plugins = {
		url = "github:hyprwm/hyprland-plugins";
		inputs.hyprland.follows = "hyprland";
	};
	Hyprspace = {
		url = "github:KZDKM/Hyprspace";
		inputs.hyprland.follows = "hyprland";
	};
	# nixvim = {
	# 	url = "github:nix-community/nixvim";
	# 	inputs.nixpkgs.follows = "nixpkgs";
	# };
  };

  outputs = { self, nixpkgs, home-manager, grub2-themes, ags, sddm-sugar-candy-nix, hyprland-contrib, hyprland, hyprland-plugins, Hyprspace,... }:
    let 
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      # pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
			./configuration.nix
			grub2-themes.nixosModules.default
			sddm-sugar-candy-nix.nixosModules.default
			{
        		nixpkgs = {
          		overlays = [sddm-sugar-candy-nix.overlays.default];
        		};
      		}
		];
        specialArgs = {
		  inherit grub2-themes;
        };
      };
    };
    homeConfigurations = {
      c5514 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
		extraSpecialArgs = {
			inherit ags;
			inherit hyprland-contrib;
			inherit hyprland-plugins;
			inherit hyprland;
			inherit Hyprspace;
		};
        modules = [ 
			./home.nix
		];
      };
    };
  };
}
