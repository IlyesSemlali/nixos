{ config, pkgs, ... }:

{
  console.keyMap = "fr";
  time.timeZone = "Europe/Paris";

  services.xserver = {
    xkb = {
      layout = "fr";
      variant = "";
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "fr_FR.UTF-8/UTF-8"
    ];
  };
}
