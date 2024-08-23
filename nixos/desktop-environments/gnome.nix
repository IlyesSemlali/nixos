{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      cheese # webcam tool
      evince # document viewer
      gnome.gnome-characters
  ]);
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };
}
