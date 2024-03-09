{ config, ... }:
{
  imports = [
      # ./i3.nix
      ./hyprland.nix
      ./hyprpaper.nix   # Wallpaper engine for hyprland
      ./rofi.nix        # rofi configuration
      ./waybar.nix      # waibar configs
  ];
}
