# 'ilyes-hypr' user home-manager config for NixOS & generic linux
{ pkgs, unstable, ... }:
let
  username = "ilyes-hypr";
in
{
  imports = [
    ./nvim
    ./rofi
    ./git
    ./vim
    ./hypr
    ./gtk.nix
    ./cursor.nix
    ./zsh.nix
    ./tmux.nix
    ./dunst.nix
    ./btop.nix
    ./gh.nix
    ./bash.nix
    ../../.config
  ];

  programs.home-manager.enable = true;

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "23.05";

    packages = with pkgs; [
      # ↓ ricing
      i3lock

      # ↓ cli & tui
      direnv
      bat
      exa
      wakatime
      btop
      neofetch
      speedtest-cli
      wget
      unstable.banana-vera
      lazygit

      # ↓ softwares
      obsidian
      spotify
      unstable.vscode
      jetbrains.clion
      jetbrains.pycharm-professional
      jetbrains.webstorm
      feh
      thunderbird-bin
      vlc
      aseprite

      # ↓ games
      prismlauncher
      heroic

      # ↓ fonts
      jetbrains-mono
      nerdfonts
    ];

    file = {
      "assets".source = ../../assets;
    };
  };

  services = {
    flameshot = {
      enable = true;
      settings.General = {
        savePath = "/home/${username}/Downloads";
        showStartupLaunchMessage = false;
      };
    };

    screen-locker = {
      enable = true;
      lockCmd = "${pkgs.i3lock}/bin/i3lock -c 000000 -fe";
      inactiveInterval = 60;
    };
  };
}
