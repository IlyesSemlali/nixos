{ pkgs, ... }: {
  imports = [
    ../features/shell.nix
    ../features/dotfiles.nix
  ];

  home.stateVersion = "25.11";
  home.username = "ilyes";
  home.homeDirectory = "/home/ilyes";
}
