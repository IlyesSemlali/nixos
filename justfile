switch desktop:
  sudo nixos-rebuild switch --impure --flake '.#{{desktop}}'

build desktop:
  sudo nixos-rebuild build --impure --flake '.#{{desktop}}'

boot desktop:
  sudo nixos-rebuild boot --impure --flake '.#{{desktop}}'
  sudo reboot now
