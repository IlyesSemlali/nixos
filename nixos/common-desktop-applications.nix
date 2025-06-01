{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
      nerd-fonts.sauce-code-pro
  ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    solaar
    vivaldi
    vlc
  ];
}
