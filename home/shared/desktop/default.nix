{ config, ... }:
{
  imports = [
      # ./i3.nix
      ./hyprpaper.nix   # Wallpaper engine for hyprland
      ./rofi.nix        # rofi configuration
      ./waybar.nix      # waibar configs
  ];

  # Set hyprland config file
  home.file.".config/hypr/hyprland.conf" = {
    # Overwrite the file
    force = true;
    text = builtins.readFile ./hyprland.conf;
  };

  # Set hyprpaper config file
  home.file.".config/hypr/hyprpaper.conf" = {
    
    # Overwrite the file
    force = true;
    text = builtins.readFile ./hyprpaper.conf;
  };
}
