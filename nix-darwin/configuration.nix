{ self, pkgs, config, ... }:

{
  system = {
    # Required to prevent backward incompatible changes in default settings
    stateVersion = 5;

    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Properly alias (link) installed applications
    # so macOS can find them anywhere:
    activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
          '';
  };

  nix = {
    enable = true;
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  programs = {
    zsh.enable = true;  # This is to load nix env in zshrc
  };

  system = {
    primaryUser = "ilyes";
  };

  system.defaults = {
    dock.persistent-apps = [
      {app = "/System/Applications/Launchpad.app/";}
      {app = "${pkgs.alacritty}/Applications/Alacritty.app/";}
    ];
  };
}
