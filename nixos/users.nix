{ config, pkgs, ... }:

{
  # User accounts and configs
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      ilyes = {
        isNormalUser = true;
        description = "Ilyès Semlali";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
          alacritty
          bat
          cargo
          delta
          eza
          fzf
          jdk
          neovim
          nodejs
          pre-commit
          python3Full
          ripgrep
          solaar
          starship
          tmux
          vim
          vivaldi
          vlc
          zoxide
        ];
      };

      system = {
        isNormalUser = true;
        description = "System";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
          alacritty
          audacity
          bat
          cargo
          delta
          eza
          fzf
          google-chrome
          jdk
          neovim
          nodejs
          pre-commit
          python3Full
          ripgrep
          solaar
          starship
          tmux
          vim
          vlc
          zoxide
        ];
      };
    };
  };
}
