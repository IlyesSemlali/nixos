{ pkgs, ... }: {

  home.packages = with pkgs; [
    neovim
    pre-commit
  ];
}
