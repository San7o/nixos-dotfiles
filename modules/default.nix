{ config, pkgs, lib, ... }:

{

  imports = [

    # Enable memory optimization
    ./memory-optimization.nix

    # Set up users
    ./users.nix

    # Setup a custom community cache server
    # ./cache-server.nix

    # Nvidia configuration
    ./nvidia.nix
  ];

  # PACKAGES ------------------------------------------------

  # List packages installed in system profile, common to all users.
  # To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     
    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # Applications
    firefox
    zoom-us
    discord
    telegram-desktop
    obsidian

    # Developement
    git
    ltrace        # debug programs
    strace        # debug programs
    python3

    # Utilities / Misc
    ranger        # Visual file manager
    glow          # markdown previewer in terminal
    bat           # Better cat
    tldr          # Simpler man
    zip
    gnutar
    neofetch      # ofc
    ripgrep       # the cooler grep
    xfce.thunar   # file manager
    thunderbird   # popular mail client
    feh           # to set background

    # System administration
    powertop      # see power statistics on intel-based laptops
                  # run a calibration with "powertop --calibrate"
		  # It will take 5-10 minutes
		  # then let It run for an hour and get power
		  # estimation figures
    tree          # list files and folder in a tree structure
    btop          # System monitor
    ncdu          # Analyze disk usage
    brightnessctl # Brightness manager

    # Virtualisation
    docker
    docker-compose

 
    # Networking
    wget
    curl
    wireshark

    # Wayland specific
    waybar        # Simple bar, configured with json and css
    dunst         # Notification manager
    libnotify     # Dependency of dunst
    rofi-wayland  # Wailand compatible rofi
    grim          # Take screenshot
    slurp         # Select a region
    wl-clipboard  # Save on clipboard from terminal
    kitty         # Wayland terminal 
    hyprpaper     # wallpaper engine for hyprland
 
    # Visual
    nerdfonts

  ];

  # Enable docker
  virtualisation.docker.enable = true;

  # Obsidian needs electron, wich is considered insecure
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


}
