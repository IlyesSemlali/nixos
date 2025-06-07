{
  description = "NixOS for laptops";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, darwin, ... }:
    let
      nixos_target = "xps13";
    in
    {
      packages = flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          default = pkgs.hello;
        }
      );

      nixosConfigurations = {

        hyprland = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (./nixos/. + "/targets/${nixos_target}.nix")
            ./nixos/configuration.nix
            ./nixos/common-shell-tools.nix
            ./nixos/common-desktop-applications.nix
            ./nixos/desktops/hyprland.nix

            home-manager.nixosModules.home-manager {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                users.ilyes = ./home-manager/hyprland.nix;
              };
            }
          ];
        };

        gnome = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (./nixos/. + "/targets/${nixos_target}.nix")
            ./nixos/configuration.nix
            ./nixos/common-shell-tools.nix
            ./nixos/common-desktop-applications.nix
            ./nixos/desktops/gnome.nix

            home-manager.nixosModules.home-manager {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                users.ilyes = ./home-manager/gnome.nix;
              };
            }
          ];
        };

      };

      darwinConfigurations = {

        macos = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit self; };
          modules = [
            nix-darwin/configuration.nix
          ];
        };

      };
    };
}

