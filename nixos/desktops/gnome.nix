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

  # Create an extra desktop entry for Gnome, it needs to be sourced
  # in the Desktop Manager to show up in available sessions
  environment.etc."wayland-sessions/gnome.desktop".text = ''
    [Desktop Entry]
    Name=GNOME
    Comment=GNOME on Wayland
    Exec=gnome-session
    TryExec=gnome-session
    Type=Application
    DesktopNames=GNOME
    X-GDM-SessionRegisters=true
  '';
}
