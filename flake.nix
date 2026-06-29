{
  description = "My NixOS configuration";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-25.11";
    # home-manager = {
    #   url = "github:nix-community/home-manager/release-25.11";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim.url = "github:c5514/nixvim";
    # ags.url = "github:Aylur/ags/60180a184cfb32b61a1d871c058b31a3b9b0743d";
    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
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
            inputs.nixvim.homeModules.nixvim
          ];
        };
      };
    };
}
