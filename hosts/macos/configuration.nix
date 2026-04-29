{ pkgs, ... }: {
  system.stateVersion = 5;
  system.primaryUser = "ilyes";
  nix.enable = false;

  users.users.ilyes = {
    name = "ilyes";
    home = "/Users/ilyes";
  };

  users.users.zenika = {
    name = "Zenika";
    home = "/Users/zenika";
  };

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  environment.systemPackages = [
    pkgs.spotify
  ];

  fonts.packages = with pkgs; [
      nerd-fonts.sauce-code-pro
  ];

  system.defaults = {
    dock = {
      autohide = true;
      tilesize = 48;
      largesize = 60;
      show-recents = true;
      mru-spaces = false;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
    };

    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      AppleIconAppearanceTheme = "RegularDark";

      # 15 is the UI minimum (225ms). 10 is the "pro" minimum (150ms).
      InitialKeyRepeat = 15;

      # 2 is the UI minimum (30ms). 1 is the absolute minimum (15ms).
      KeyRepeat = 2;
    };
  };

  system.activationScripts.applications.text = ''
    echo "Syncing Nix Apps to /Applications..." >&2
    rm -rf "/Applications/Nix Apps"
    mkdir -p "/Applications/Nix Apps"
    find ${pkgs.buildEnv { name = "system-applications"; paths = [ pkgs.spotify ]; }}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    while read -r src; do
      ln -s "$src" "/Applications/Nix Apps/$(basename "$src")"
    done
  '';

}
