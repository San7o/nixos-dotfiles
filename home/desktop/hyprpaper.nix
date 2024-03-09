{ config, ... }:

{

  home.file.".config/hypr/hyprpaper.conf" = {
    
    # Overwrite the file
    force = true;
    text = ''

preload = ~/.config/nixos/wallpapers/only-grey.png
# if more than one preload is desired then continue to preload other backgrounds
# preload = /path/to/next_image.png
# .. more preloads

# set the default wallpaper(s) seen on initial workspace(s) --depending on the number of monitors used
wallpaper = eDP-1,~/.config/nixos/wallpapers/only-grey.png
# if more than one monitor in use, can load a 2nd image
# wallpaper = monitor2,/path/to/next_image.png
# .. more monitors

#enable splash text rendering over the wallpaper
splash = true

#fully disable ipc, if on it might lead to worse battery life
ipc = off

'';
  };
  
  # To list monitors run
  # hyprctl monitors
  # To set a wallpaper on another monitor, run
  # hyprctl hyprpaper wallpaper "HDMI-A-1,~/.config/nixos/wallpapers/nixos-dark.png"
}
