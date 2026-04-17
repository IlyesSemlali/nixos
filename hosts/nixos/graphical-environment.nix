{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # SDDM Requirements
    libsForQt5.qt5.qtgraphicaleffects
    sddm-sugar-dark

    brightnessctl
    dunst
    libnotify
    pamixer
    pavucontrol
    solaar
    spotify
    vivaldi
    vlc

  ];

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sugar-dark";
      settings = {
        Wayland = {
          SessionDir = "/run/current-system/sw/share/wayland-sessions/,/etc/wayland-sessions/";
        };
      };
    };
  };
}
