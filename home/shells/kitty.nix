{ config, ... }:

{

  # From the initial i3 config

  home.file.".config/kitty/kitty.conf" = {
    
    # Overwrite the file
    force = true;
    text = ''

# Kitty confif file
confirm_os_window_close 0

# Change font size
font_size 13.0

# Direct URL under the mouse
direct_urls yes

# Colors

# Define a color table
# Cool palette https://coolors.co/palette/6f1d1b-bb9457-432818-99582a-ffe6a7
foreground #EFDECD
background #282828

# Opacity, Be aware that using a value
# less than 1.0 is a (possibly significant)
# performance hit
# background_opacity 0.6
background_opacity 1

# Blur, too much will lead to performance problems
# background_blur 10

# Path to a background image. Must be in PNG format.
background_image none

'';
  };
}
