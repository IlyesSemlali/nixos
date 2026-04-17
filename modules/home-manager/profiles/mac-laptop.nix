{ pkgs, ... }: {
  imports = [
    ../features/macos.nix
    ../features/shell.nix
    ../features/dotfiles.nix
    ../features/dev-tools.nix
  ];

  home.stateVersion = "25.11";
  home.username = "ilyes";
  home.homeDirectory = "/Users/ilyes";
}
