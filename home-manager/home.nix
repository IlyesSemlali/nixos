{ config, pkgs, ... }:

{
  home.username = "flake-test";
  home.homeDirectory = "/home/flake-test";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}

