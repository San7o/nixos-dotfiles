# nixos-config

My NixOS configuration files

NixOs is a fully reproducible operating system based on the Nix package manager. A good guide on NixOs can be found [here](https://nixos-and-flakes.thiscute.world/introduction/).

## Use my config files

Clone my repo, then add `.secrets/` directory with the following file

`.secrets/github-access-token`
```
https://username:token@github.com
```
Make sure there is no new line in the file (`0x0a`)


Build the system with with
```bash
sudo nixos-rebuild switch --flake . --impure
```
impure lets you read gihub credentials from .secrets

I personally don't place my config in `/etc/nixos/` but I have this repo on my home inside `.config/nixos`

## Structure

```
├── configuration.nix        # The main configuration file for system
├── fhs.nix                  # Run nix-shell with this file for a FHS compatible shell
├── flake.lock               
├── flake.nix                # I use flake
├── home                     # Home configuration
│   ├── default.nix          # Configuration for user "santo"
│   ├── desktop              # Configurations for desktop managers
│   │   ├── default.nix      
│   │   ├── hyprland.nix     # I'm currently using hyprland
│   │   ├── hyprpaper.nix    # wallpaper manager for hyprland
│   │   └── i3.nix           # I have also some old configs for i3
│   ├── dev                  # Configurations for developer applications
│   │   ├── default.nix
│   │   ├── git.nix          # Git config, saves the acces token
│   │   └── neovim.nix
│   ├── programs             # Configs for misc applications
│   │   ├── default.nix
│   │   └── obsidian.nix
│   └── shells               # Config for shells
│       ├── alacritty.nix 
│       ├── bash.nix
│       ├── default.nix
│       ├── kitty.nix        # I currently use kitty
│       └── shell.nix
├── hosts                    # Different hardware configuration for different hardware
│   └── hp-laptop            # My main laptop
│       ├── default.nix
│       └── hardware-configuration.nix
├── misc                     # Notes I took
│   └── powertop.md          # How to use powertop
├── modules                  # system level modules
│   ├── cache-server.nix     # Enable a custom cache server
│   ├── default.nix          # List of the modules
│   ├── memory-optimization.nix  # Some optimizations
│   ├── nvidia.nix           # nvidia drivers
│   └── users.nix            # list of the users in the machine
├── README.md
└── wallpapers               # wallpapers folder
    ├── free-as-in-freedom.jpeg
    ├── nixos-dark.png
    └── nixos-light.png


```

# nix-shell

For developement consistency, NixOS uses (enforces...) the use of nix-shell (or `nix develop` for flake configuration). You can create and enter into developement environment it with the command `nix-shell`. You can provide the packages with `-p` or use a configuration file like so:
`modules/shell/shell.nix`
```nix
{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    libgcc
    # cargo
    # rustc
  ];
}
```
See `modules/shell/shell.nix` for more information.

Example usage
```bash
nix-shell -p gcc
nix-shell /path/to/shell/configuration.nix
nix develop nixpkgs#gcc
```
With `nix develop` you mantain in scope all your user programs

## Run a FHS shell
```bash
nix-shell modules/fhs.nix
```


## Run Appimage
```bash
nix-shell -p appimage-run
[nix-shell]$ appimage-run <your-appimage>
```

## Upgrade the system
```bash
nix flake update
```

## Remove Garbage
Remove system versions and packages no longer used by new generations by 15 days
```bash
sudo nix-collect-garbage --delete-older-than 15d
```
## Create a new module

Create a file such as `main-user.nix`
Then add It into the `configuration.nix` file
```nix
imports = [
	./hardware-configuration.nix
	./main-user.nix
]
```

In `main-user.nix`
```nix
{ whatever, ... }:

{
   # Config here
}
```

### Default
If you call a file `default.nix`, you can access It just bu importing It's folder


# Finding options and functions

```bash
nix search nixpkgs <searchterm>
```

# Rerources
## Videos
https://www.youtube.com/watch?v=CwfKlX3rA6E

https://www.youtube.com/watch?v=a67Sv4Mbxmc

https://www.youtube.com/watch?v=1ED9b7ERTzI

## Sites
https://search.nixos.org/options?channel=23.11&from=0&size=50&sort=relevance&type=packages&query=git

https://search.nixos.org/packages?channel=23.11&show=git&from=0&size=50&sort=relevance&type=packages&query=git
