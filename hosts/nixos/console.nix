{ pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt"; # or "spinfinity", "fade-in", "spinner", "tribar", etc.
    };


    # Quiet boot
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=false"
      "vga=current"
      "rd.udev.log_level=3"
    ];
  };

  services.kmscon = {
    enable = true;
    fonts = [ { name = "SauceCodePro Nerd Font Mono"; package = pkgs.nerd-fonts.sauce-code-pro; } ];
    useXkbConfig = true;
    extraOptions = "--term xterm-256color";
    hwRender = true;
  };

  # Disable VT1
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

}
