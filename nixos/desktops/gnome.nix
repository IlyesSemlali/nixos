{ pkgs, ... }:

{
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sugar-dark";
    };

    xserver.desktopManager.gnome.enable = true;
  };


  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator

    # SDDM Requirements
    libsForQt5.qt5.qtgraphicaleffects
    sddm-sugar-dark
  ] ;

  environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      cheese
      evince
      gnome-characters
  ]);

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
}
