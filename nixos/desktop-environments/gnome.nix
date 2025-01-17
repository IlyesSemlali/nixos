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

  environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      cheese
      evince
      gnome.gnome-characters
  ]);

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
