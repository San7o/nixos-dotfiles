# --------------------------- configuration.nix ----------------------------- #
#
# The main configuration file of NixOs
#
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ lib, config, pkgs, ... }:

let

  # Needed for hyprland
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland-flake = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;

in
{

  # --------------------------- Set-up the system -------------------------- #


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # I don't know if I need this or not
  # boot.kernelModules = [ "fuse" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Rome";


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };


  # ------------------------- DESKTOP ENVIRONMENT ------------------------- #

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "it";
    xkbVariant = "";
    autorun = false;
    displayManager.startx.enable = true;
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
    # services.xserver.lightdm.enable = lib.mkForce false;
    
  };


  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Enable KDE Plasma
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Enable Pantheon Desktop
  # services.xserver.desktopManager.pantheon.enable = true;

  # Enable MATE Desktop
  # services.xserver.desktopManager.mate.enable = true;

  # Enable Cinnamon Desktop
  # services.xserver.desktopManager.cinnamon.enable = true;

  # Enable Deepin Desktop
  # services.xserver.desktopManager.deepin.enable = true;

  # Enable sway
  # programs.sway.enable = true;

  # Enable i3
  /*
    services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        # dmenu        # application launcher most people use
        rofi           # alternative to dmenu
     	i3status       # gives you the default i3 status bar
        i3lock         # default i3 screen locker
        i3blocks       # if you are planning on using i3blocks over i3status
     ];

    };
    };
  */


  # Enable hyperland
  # First you can enable the cache server so that you don't have to compile the source again
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland, a compatibility layer over wayland for apps that don't supìport wayland yet
    xwayland.enable = true;
    # package = hyprland-flake.packages.${pkgs.system}.hyprland;
  };



  # Display Manager ----------
  # Enable Greetd
  /*
    services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
      };
      default_session = initial_session;
    };
    };
  */

  # Enable sddm for wayland
  #services.xserver.displayManager.sddm = {
  #  enable = true;
  #  wayland.enable = true;
  #};
  # -----------------------



  # Configure console keymap
  console.keyMap = "it2";


  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;



  # FLAKES -------------------------------------------------------------- #
  #
  # Enable the flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
