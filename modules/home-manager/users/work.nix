{ pkgs, inputs, ... }: {
  imports = [ ./common/dot-files.nix ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;


  home.packages = [
    pkgs.spotify
    pkgs.slack
  ];

  home.activation.linkApps = let
    apps = pkgs.buildEnv {
      name = "home-packages";
      paths = [
        pkgs.spotify
        pkgs.slack
      ];
    };
  in {
    after = [ "writeBoundary" ];
    before = [ ];
    data = ''
      rm -rf "$HOME/Applications/Nix Apps"
      mkdir -p "$HOME/Applications/Nix Apps"
      find ${apps}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        ln -s "$src" "$HOME/Applications/Nix Apps/$(basename "$src")"
      done
    '';
  };
}
