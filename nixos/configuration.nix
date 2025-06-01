# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./locale.nix
      ./nixos.nix
      ./users.nix
    ];

  # Grub.
  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    device = "/dev/nvme0n1";
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };


  # Intel Graphics
  boot.kernelParams = [ "i915.force_probe=1926" ];
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware = {
    cpu.intel.updateMicrocode = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      # Hardware acceleration
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        libvdpau-va-gl
      ];
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
}
