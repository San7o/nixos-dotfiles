# upgrading

This guide will go through how to update nixos.

first, get the current version of nixpkgs with
```bash
sudo nix-channel --list
```

To add a new channel, run this:
```bash
sudo nix-channel --add https://channels.nixos.org/nixos-24.05 nixos 
```

Update flake:
```bash
nix flake update
```

And rebuild:
```bash
sudo nixos-rebuild switch --flake .#santo@desktop --impure --upgrade
```
