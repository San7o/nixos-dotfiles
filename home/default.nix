{ config, pkgs, ... }:

{

  home.username = "santo";
  home.homeDirectory = "/home/santo";

  imports = [
    ./dev           # Programs for developement
    ./programs      # Various applications
    ./shells        # Config for some shells
    ./desktop       # Config for desktop / window managers
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #  "Xcursor.size" = 16;
  #  "Xft.dpi" = 172;
  #};


  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
    # home-manager   # It should be installed from the flakes

    # Applications
    firefox
    zoom-us
    discord

    # Developement
    git
    ltrace       # debug programs
    strace       # debug programs

    # Utilities / Misc
    ranger       # Visual file manager
    glow         # markdown previewer in terminal
    bat          # Better cat
    tldr         # Simpler man
    zip
    gnutar
    neofetch     # ofc
    ripgrep      # the cooler grep

    # System administration
    powertop     # see power statistics on intel-based laptops
                 # run a calibration with "powertop --calibrate"
		 # It will take 5-10 minutes
		 # then let It run for an hour and get power
		 # estimation figures
    tree         # list files and folder in a tree structure
    btop         # System monitor
    
    # Networking
    wget
    curl

    # Wayland specific
    waybar        # Simple bar, configured with json and css
    dunst         # Notification manager
    libnotify     # Dependency of dunst
    rofi-wayland  # Wailand compatible rofi

  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  # programs.home-manager.enable = true;

}
