{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # SDDM Requirements
    libsForQt5.qt5.qtgraphicaleffects
    sddm-sugar-dark

    pavucontrol
    solaar
    vivaldi
    vlc
  ];

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sugar-dark";
    };
  };
}
