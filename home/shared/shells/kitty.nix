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


# kitten themes

# Darkside theme
background #212324
foreground #b9b9b9
cursor #bbbbbb
selection_background #2f3333
color0 #000000
color8 #000000
color1 #e8331c
color9 #df5a4f
color2 #68c156
color10 #76b768
color3 #f1d32b
color11 #eed64a
color4 #1c98e8
color12 #387bd2
color5 #8e69c8
color13 #957bbd
color6 #1c98e8
color14 #3d96e2
color7 #b9b9b9
color15 #b9b9b9
selection_foreground #212324

'';
  };
}
