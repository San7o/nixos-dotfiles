{ config, pkgs, lib, ... }:

let
  pkgs-unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  imports = [

    # Enable memory optimization
    ./memory-optimization.nix

    # Set up users
    ./users.nix

    # Setup a custom community cache server
    # ./cache-server.nix

    # Nvidia configuration
    # ./nvidia.nix

    # Setup network manager configs for unitn-x and eduroam
    # ./network-manager.nix
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
    home-manager

    # Applications
    firefox
    zoom-us
    discord
    telegram-desktop
    obsidian
    texstudio         # LaTeX editor
    texlive.combined.scheme-full
    freecad           # 3D Modeling
    vlc               # Media player
    obs-studio        # Screen recording
    blender           # 3D modeling

    # Developement
    git
    ltrace            # debug programs
    strace            # debug programs
    python3
    zsh-autosuggestions
    zsh-syntax-highlighting
    nodejs_21         # Needed for copilot
    haskellPackages.kmonad # Keyboard tweaker
    ansible_2_14      # Automation tool
    tig               # Git interface
    tmux              # Terminal multiplexer
    # pkgs-unstable.ollama-cuda  # Local LLM
    direnv            # Environment variable manager
    # many python packages need libc
    zlib
    libGL
    glib
    android-studio    # Android development
    valgrind          # Memory leak detector

    # Utilities / Misc
    ranger            # Visual file manager
    zip
    unzip
    gnutar
    neofetch          # ofc
    ripgrep           # the cooler grep
    xfce.thunar       # file manager
    thunderbird       # popular mail client
    # feh             # to set background
    tree              # list files and folder in a tree structure
    brightnessctl     # manage brightness
    gnome.cheese      # webcam
    cowsay            # For fun
    sshpass           # For ssh automation
    ledger            # Accounting tool 
    unrar             # Extract .rar files
    zotero            # Reference manager
    inkscape          # Vector graphics editor
    raven-reader      # RSS reader

    # Virtualisation
    docker
    docker-compose
    qemu
 
    # Networking
    wget
    curl
    wireshark
    qbittorrent       # Torrent client
    samba             # File sharing
    socat             # Multipurpose relay
    
    # Wayland specific
    waybar            # Simple bar, configured with json and css
    dunst             # Notification manager
    libnotify         # Dependency of dunst
    rofi-wayland      # Wailand compatible rofi
    rofi-power-menu   # Rofi but for power menu
    grim              # Take screenshot
    slurp             # Select a region
    wl-clipboard      # Save on clipboard from terminal
    kitty             # Wayland terminal 
    hyprpaper         # wallpaper engine for hyprland
    wl-gammactl       # anage screen gamma and contrast
    greetd.wlgreet    # display / login manager

    # Visual
    cava              # Music Visualizer

  ];

  # Virtualbox
  users.extraGroups.vboxusers.members = [ "santo" ];
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # Obsidian needs electron, which is considered insecure
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Open Tablet Driver
  hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
  };

  boot.kernelModules = [ "uinput" ];

  # Enable epmd for erlang
  services.epmd.enable = true;

}
