{ ... }:

let
  username = "ilyes";

in {
  programs.home-manager.enable = true;

  home = {
    stateVersion = "23.05";

    inherit username;
    homeDirectory = "/home/${username}";
  };

  imports = [
    ./common/tiling-window-manager.nix
    ./window-managers/hyprland.nix
  ];

}
