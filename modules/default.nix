{ config, pkgs, lib, ... }:

{

  imports = [
    # Enable FSH environment whrough the fsh command
    ./fhs.nix

    # Enable memory optimization
    ./memory-optimization.nix

    # Set up users
    ./users.nix

    # Setup a custom community cache server
    # ./cache-server.nix
  ];

  # PACKAGES ------------------------------------------------

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Applications
    firefox

    # Developement
    git
    ltrace
    strace

    # Text Editor
    neovim       # The best text editor
    
    # Utilities / Misc
    ranger       # Visual file manager
    btop         # System monitor
    bat          # Better cat
    tldr         # Simpler man
    zip
    gnutar
    neofetch

    # Networking
    wget
    curl

  ];

  # Obsidian needs electron, wich is considered insecure
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];


}
