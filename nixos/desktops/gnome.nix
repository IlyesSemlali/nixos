{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    desktopManager.gnome.enable = true;
  };


  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator # Gnome
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
