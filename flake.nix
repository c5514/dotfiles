{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    ags.url = "github:Aylur/ags/60180a184cfb32b61a1d871c058b31a3b9b0743d";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    nixvim.url = "github:c5514/nixvim";
    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        # Configuration.nix
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/main/configuration.nix
            inputs.grub2-themes.nixosModules.default
            # {
            #   nix.settings = {
            #     substituters = [ "https://cosmic.cachix.org" ];
            #     trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            #   };
            # }
            # inputs.nixos-cosmic.nixosModules.default
          ];
          specialArgs = {
            inherit inputs;
          };
        };
      };
      homeConfigurations = {
        # Home manager
        c5514 = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/main/home.nix
          ];
        };
      };
    };
}
