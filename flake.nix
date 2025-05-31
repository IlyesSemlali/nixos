{
  description = "NixOS for laptops";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager,  ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {

      nixosConfigurations = {

        gnome = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./nixos/configuration.nix
            ./desktops/gnome.nix
            home-manager.nixosModules.home-manager {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                users.ilyes = ./home-manager/gnome.nix;
              };
            }
          ];
        };

        hyprland = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./nixos/configuration.nix
            ./desktops/hyprland.nix
            home-manager.nixosModules.home-manager {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                users.ilyes = ./home-manager/hyprland.nix;
              };
            }
          ];
        };

      };
    };
}

