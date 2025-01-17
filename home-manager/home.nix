{ config, pkgs, ... }:

let
  username = "ilyes";

in {
  programs.home-manager.enable = true;

  home = {
    stateVersion = "23.05";

    inherit username;
    homeDirectory = "/home/${username}";
  };
}

