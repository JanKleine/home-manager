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
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."jankleine" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home-jankleine.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      homeConfigurations."ipt" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home-ipt.nix ];
      };
    };
}
