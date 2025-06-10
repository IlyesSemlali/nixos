{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    solaar
    vivaldi
    vlc
  ];
}
