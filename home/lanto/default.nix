{ config, pkgs, ... }:

{

  home.username = "lanto";
  home.homeDirectory = "/home/lanto";

  imports = [
    ../shared       # Shared configs
    ./dev           # dev configs
  ];

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
       # Lanto is gonna be a very light user 
       # With only the necessary programs he needs
       cura # TODO remove
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
