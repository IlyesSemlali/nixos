{ config, pkgs, ... }:

{
  # Disable password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Use ZSH as default shell
  users.defaultUserShell = pkgs.zsh;

  # User accounts and configs
  users.users.ilyes = {
    isNormalUser = true;
    description = "Ilyès Semlali";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      solaar
      vivaldi
    ];
  };

  users.users.system = {
    isNormalUser = true;
    description = "System";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      audacity
      google-chrome
    ];
  };

  users.users.ilyes-hypr = {
    isNormalUser = true;
    description = "Ilyes Semlali (hyprland)";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
