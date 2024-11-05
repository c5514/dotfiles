{
	description = "My NixOS configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		grub2-themes.url = "github:vinceliuice/grub2-themes";
		# sddm-sugar-candy-nix = {
		# 	url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };
		ags.url = "github:Aylur/ags";
		hyprland-contrib = {
			url = "github:hyprwm/contrib";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland = {
			url = "git+https://github.com/hyprwm/hyprland?submodules=1";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hypridle = {
			url = "github:hyprwm/hypridle";
			inputs = {
			hyprlang.follows = "hyprland/hyprlang";
			hyprutils.follows = "hyprland/hyprutils";
			nixpkgs.follows = "hyprland/nixpkgs";
			systems.follows = "hyprland/systems";
			};
		};
		hyprlock = {
			url = "github:hyprwm/hyprlock";
			inputs = {
				hyprlang.follows = "hyprland/hyprlang";
				hyprutils.follows = "hyprland/hyprutils";
				nixpkgs.follows = "hyprland/nixpkgs";
				systems.follows = "hyprland/systems";
			};
		};
		hyprland-plugins = {
			url = "github:hyprwm/hyprland-plugins";
			inputs.hyprland.follows = "hyprland";
		};
		Hyprspace = {
			url = "github:KZDKM/Hyprspace";
			inputs.hyprland.follows = "hyprland";
		};
		matugen = {
			url = "github:Iniox/Matugen";
		};
		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		firefox-gnome-theme = {
			url = "github:rafaelmardojai/firefox-gnome-theme";
			flake = false;
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		illustrate = {
			url = "github:rpapallas/illustrate.nvim";
			flake = false;
		};
		latex_concealer= {
			url = "github:dirichy/latex_concealer.nvim";
			flake = false;
		};
	};

	outputs = { nixpkgs, home-manager,... }@inputs:
	let 
    	system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${system};
		# pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in {
		nixosConfigurations = {
			#Configuration.nix
			nixos = lib.nixosSystem {
        		inherit system;
        		modules = [
					# ./configuration.nix
					./hosts/main/configuration.nix
					inputs.grub2-themes.nixosModules.default
					# inputs.sddm-sugar-candy-nix.nixosModules.default
					# {
    	# 				nixpkgs = {
    	# 					overlays = [inputs.sddm-sugar-candy-nix.overlays.default];
					# 	};
					# }
				];
        		specialArgs = {
					inherit inputs;
        		};
    		};
			#ISO configuration
			iso = lib.nixosSystem {
				modules = [
					./hosts/iso/configuration.nix
				];
				specialArgs = {inherit inputs;};
			};
		};
		homeConfigurations = {
			c5514 = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = {
					inherit inputs;
				};
				modules = [ 
					# ./home.nix
					./hosts/main/home.nix
				];
			};
		};
	};
}
