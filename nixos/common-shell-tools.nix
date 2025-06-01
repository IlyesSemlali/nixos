{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    bash
    bat
    cargo
    delta
    eza
    fzf
    gcc
    git
    jdk
    just
    neovim
    nodejs
    pciutils
    pre-commit
    python3Full
    ripgrep
    starship
    tmux
    tree
    unzip
    vim
    zoxide
    zsh
  ];
}
