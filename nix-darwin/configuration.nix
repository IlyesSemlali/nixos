{ self, ... }:

{
  system = {
    # Required to prevent backward incompatible changes in default settings
    stateVersion = 5;

    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;
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
}
