{ config, pkgs, ... }:

{
  # User accounts and configs
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      ilyes = {
        isNormalUser = true;
        description = "Ilyès Semlali";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
          solaar
          vivaldi
        ];
      };

      system = {
        isNormalUser = true;
        description = "System";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
          audacity
          google-chrome
        ];
      };
    };
  };
}
