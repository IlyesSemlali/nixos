{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprlock
  ];

  systemd.user.services.dunst = {
    enable = true;
    description = "Dunst Notification Daemon";
    documentation = ["man:dunst(1)"];
    wantedBy = [ "default.target" ];

    unitConfig = {
      PartOf = "graphical-session.target";
    };

    serviceConfig = {
      ExecStart = "${pkgs.dunst}/bin/dunst";
      Type = "dbus";
      BusName = "org.freedesktop.Notifications";
      Slice = "session.slice";
    };
  };
}
