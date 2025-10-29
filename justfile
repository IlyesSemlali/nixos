switch:
  sudo nixos-rebuild switch --impure --flake '.#nixos'

build:
  sudo nixos-rebuild build --impure --flake '.#nixos'

boot:
  sudo nixos-rebuild boot --impure --flake '.#nixos'
  sudo reboot now

upgrade:
  nix flake update
  sudo nixos-rebuild switch --impure --flake '.#nixos' --upgrade
