{ config, pkgs, ... }:

{
  # PACKAGES ------------------------------------------------

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Applications
    firefox

    # Developement
    git

    # Utilities / Misc
    neovim       # The best text editor
    ranger       # Visual file manager
    btop         # System monitor
    bat          # Better cat
    tldr         # Simpler man
    zip
    gnutar
    neofetch

  ];

  # Obsidian needs electron, wich is considered insecure
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];


}
