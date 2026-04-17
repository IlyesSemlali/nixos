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
    neovim
    nodejs
    pre-commit
    python3
    ripgrep
    starship
    tmux
    tree
    unzip
    zoxide
  ];

}
