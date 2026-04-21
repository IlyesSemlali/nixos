{ pkgs, ... }:{

  home.packages = with pkgs; [
    bat
    cargo
    coreutils
    delta
    eza
    fzf
    gcc
    git
    htop
    jdk
    just
    ncdu
    neovim
    nodejs
    pre-commit
    python3
    ripgrep
    rsync
    starship
    tmux
    tree
    unzip
    zoxide
  ];

}
