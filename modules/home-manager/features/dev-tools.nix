{ pkgs, ... }: {

  home.packages = with pkgs; [
    cargo
    go
    libiconv
    neovim
    nodejs
    pre-commit
    rustc

    # Manually Installed LSPs
    jinja-lsp
  ];
}
