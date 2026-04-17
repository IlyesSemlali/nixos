{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ./common/dot-files.nix
    ./features/shell.nix
  ];

  home.stateVersion = "25.11";
  home.username = "ilyes";

  # OS Detection for paths
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/ilyes" else "/home/ilyes";

  home.packages = with pkgs; [
    spotify
    whatsapp-for-mac
    delta
    htop
    neovim
    pre-commit
    tmux
    dockutil
    openssh
    git
  ];

  # Re-added the macOS-specific Dock and App link logic so you don't lose it!
  home.activation = lib.optionalAttrs pkgs.stdenv.isDarwin {
    linkApps = lib.hm.dag.entryAfter ["writeBoundary"] ''
      rm -rf "$HOME/Applications/Nix Apps"
      mkdir -p "$HOME/Applications/Nix Apps"

      APPS_PATH=${pkgs.buildEnv {
        name = "personal-apps";
        paths = [ pkgs.spotify pkgs.whatsapp-for-mac ];
      }}

      find "$APPS_PATH/Applications" -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        ln -s "$src" "$HOME/Applications/Nix Apps/$(basename "$src")"
      done
    '';

    setupDock = lib.hm.dag.entryAfter ["linkApps"] ''
      DOCKUTIL=${pkgs.dockutil}/bin/dockutil
      $DOCKUTIL --no-restart --remove all "$HOME"
      $DOCKUTIL --no-restart --add "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app" "$HOME"
      $DOCKUTIL --no-restart --add "/Applications/Adobe Lightroom.app" "$HOME"
      $DOCKUTIL --no-restart --add "${pkgs.spotify}/Applications/Spotify.app" "$HOME"
      $DOCKUTIL --no-restart --add "${pkgs.whatsapp-for-mac}/Applications/WhatsApp.app" "$HOME"
      $DOCKUTIL --no-restart --add "/System/Applications/Messages.app" "$HOME"
      $DOCKUTIL --no-restart --add "/System/Applications/Phone.app" "$HOME"
      $DOCKUTIL --no-restart --add "/System/Applications/System Settings.app" "$HOME"
      killall cfprefsd && killall Dock || true
    '';
  };
}
