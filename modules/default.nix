{ config, pkgs, lib, ... }:

{

  imports = [
    # Enable FSH environment whrough the fsh command
    # You can guild a fhs shell with nix-shell fhs.nix
    # ./fhs.nix

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
      # Put all system packages here
      # home-manager
      feh        # to set background
  ];



  # Obsidian needs electron, wich is considered insecure
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];


}
