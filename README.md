# Ilyès's NixOS installation

I have no idea what I'm doing here, just poking around to see what might work.


## Goal

Have a centralized config for all machines deployments:
- Docker images (without any desktop environments)
- NixOS installs (one per desktop environment)
- Server (can serve as a base for the SelfHosting project)
- macOS HomeManager config

## Proposed Structure

A Nix Flake, that will install NixOS (if needed), and use HomeManager to configure both Linux and MacOS home directories.

One single Nix Flake to control every flavor of OS that I need to deploy and configure.

- `home-manager/`: to control any home directory
- `nixos/`: to install NixOS machines
- `nix-darwin/`: to configure macOS

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

## Configuring a fresh macOS installation

### Prerequisites

1. Run the initial macOS setup
1. Install git (launch a terminal, then run the git command, and install the X-Code extensions)

### Install Nix

Allow the experimental features:

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Install nix:

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

### Run flake

On the first run use this command, as darwin-rebuild isn't yet available:

```bash
sudo nix run --extra-experimental-features "nix-command flakes" nix-darwin/master#darwin-rebuild -- switch --flake ./#macos
```

Then simply use this command:

```bash
darwin-rebuild -- switch --flake ./#macos
```
