{
	description = "My NixOS configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		grub2-themes.url = "github:vinceliuice/grub2-themes";
		# ags.url = "github:Aylur/ags";
		# hyprland-contrib = {
		# 	url = "github:hyprwm/contrib";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };
		# hyprland = {
		# 	url = "git+https://github.com/hyprwm/hyprland?submodules=1";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };
		# hyprland-plugins = {
		# 	url = "github:hyprwm/hyprland-plugins";
		# 	inputs.hyprland.follows = "hyprland";
		# };
		# Hyprspace = {
		# 	url = "github:KZDKM/Hyprspace";
		# 	inputs.hyprland.follows = "hyprland";
		# };
		# matugen = {
		# 	url = "github:Iniox/Matugen";
		# };
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
		wezterm = {
			url = "github:wez/wezterm/main?dir=nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager,... }@inputs:
	let 
    	system = "x86_64-linux";
		lib = nixpkgs.lib;
		pkgs = nixpkgs.legacyPackages.${system};
		# overlays = [
		# 	(final: prev: {
		# 		zjstatus = inputs.zjstatus.packages.${prev.system}.default;
		# 	})
		# ];
		# pkgs = import nixpkgs {
		# 	inherit system;
		# 	overlays = overlays;
		# };
		# pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in {
		nixosConfigurations = {
			#Configuration.nix
			nixos = lib.nixosSystem {
        		inherit system;
        		modules = [
					./hosts/main/configuration.nix
					# ./hosts/stable/configuration.nix
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
					./hosts/main/home.nix
					# ./hosts/stable/home.nix
				];
			};
		};
	};
}
