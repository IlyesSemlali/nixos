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
    python3
    ripgrep
    starship
    tmux
    tree
    unzip
    ventoy
    vim
    zoxide
    zsh
  ];
}
