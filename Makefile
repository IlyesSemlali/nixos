UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
TARGET ?= macos
else
TARGET ?= nixos
endif

.PHONY: all apply update clean

all: apply

apply:
ifeq ($(TARGET), macos)
	@export NIXPKGS_ALLOW_UNFREE=1; \
	if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then \
		. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; \
	fi; \
	sudo -E nix run github:LnL7/nix-darwin -- switch --impure --flake .#macos
else
	@export NIXPKGS_ALLOW_UNFREE=1; \
	sudo -E nixos-rebuild switch --flake .#nixos
endif

update:
	nix flake update

clean:
	nix-collect-garbage -d
