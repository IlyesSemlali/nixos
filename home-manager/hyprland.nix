{ config, pkgs, ... }:

let
  username = "ilyes";

in {
  programs.home-manager.enable = true;

  home = {
    stateVersion = "23.05";

    inherit username;
    homeDirectory = "/home/${username}";
  };

  wayland.windowManager.hyprland = {

    enable = true;
    settings = {
      input = {
        kb_layout = "fr";
      };

      "$mod" = "SUPER";
      "$terminal" = "alacritty";

      bind =
        [
          "$mod, RETURN, exec, $terminal"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
