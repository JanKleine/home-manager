{
  description = "Home Manager configuration of jans ipt account";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      systems = [
        "aarch64-darwin"
      ];

      # helper to generate pkgs for all systems
      forAllSystems = nixpkgs.lib.genAttrs systems;

      # pkgs for each system
      pkgsFor = forAllSystems (system: nixpkgs.legacyPackages.${system});
    in {
      homeConfigurations."jankleine" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor.aarch64-darwin;

        modules = [ ./home-jankleine.nix ];
      };
      homeConfigurations."ipt" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor.aarch64-darwin;

        modules = [ ./home-ipt.nix ];
      };
    };
}
