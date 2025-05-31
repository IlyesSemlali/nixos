{ config, pkgs, ... }:

{
  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = with pkgs; [
    kitty # required for the default Hyprland config
  ] ;
}
