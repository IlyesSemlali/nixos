# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [
      ./console.nix
      ./locale.nix
      ./nixos.nix
      ./users.nix
      ./security.nix
      ./desktops/gnome.nix
      ./desktops/hyprland.nix
    ];

  boot = {
    loader.grub = {
      enable = true;
      useOSProber = true;
    };
  };

  networking = {
    networkmanager.enable = true;
  };

  hardware = {
    bluetooth = {
      powerOnBoot = true;
    };
  };

  services = {
    # Enable CUPS
    printing.enable = true;

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Use Pipewire
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  programs.zsh.enable = true;

  # Used both in graphical env and KMSConsole
  fonts.packages = with pkgs; [
      nerd-fonts.sauce-code-pro
  ];

}
