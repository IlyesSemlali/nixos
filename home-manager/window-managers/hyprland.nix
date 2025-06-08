{ ... }:

{
  # HyprLand Config
  wayland.windowManager.hyprland = {

    enable = true;
    settings = {
      input = {
        kb_layout = "fr";
      };

      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$browser" = "vivaldi";
      bind =
        [
          "$mod, RETURN, exec, $terminal"
          "$mod, SPACE, exec, $browser"

          # Volume control
          ",XF86AudioRaiseVolume,exec,pamixer -i 5 && notify-send 'Volume' \"$(pamixer --get-volume)%\""
          ",XF86AudioLowerVolume,exec,pamixer -d 5 && notify-send 'Volume' \"$(pamixer --get-volume)%\""
          ",XF86AudioMute,exec,pamixer -t && notify-send 'Muted'"

          # Brightness control
          ",XF86MonBrightnessUp,exec,brightnessctl set +10% && notify-send 'Brightness' \"$(brightnessctl | awk -F'[(|%]' '/Current/ {print $2}')%\""
          ",XF86MonBrightnessDown,exec,brightnessctl set 10%- && notify-send 'Brightness' \"$(brightnessctl | awk -F'[(|%]' '/Current/ {print $2}')%\""
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
