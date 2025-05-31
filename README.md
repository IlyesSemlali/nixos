# Ilyès's NixOS installation

I have no idea what I'm doing here, just poking around to see what might work.


## Goal

Have a centralised config for all Linux deployments:
- Docker images (without any desktop environments)
- NixOS installs (one per desktop environment)
- Server (can serve as a base for the SelfHosting project)
- MacOS HomeManager config

## Proposed Structure

A Nix Flake, that will install NixOS (if needed), and use HomeManager to configure both Linux and MacOS home directories.

## Current Structure

A "NixOS" flake, that will handle NixOS install and a HomeManager config.


<!--TODO: Make sure the upgrade command works and write the just targets accordingly
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
-->
