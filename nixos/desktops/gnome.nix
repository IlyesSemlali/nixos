{ pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
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
