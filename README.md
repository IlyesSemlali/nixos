# NixOS maintenance

## Rebuilding

```bash
sudo nixos-rebuild switch --impure --flake '.#xps13' --upgrade
```

## Upgrading

1. Change the channel in nixos/configuration.nix
1. Update the flake.lock
1. Update the system

```bash
nix flake update
sudo nixos-rebuild switch --impure --flake '.#xps13' --upgrade
```
