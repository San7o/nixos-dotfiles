{ config, ... }:

{

  # From the initial i3 config

  home.file.".config/kitty/kitty.conf" = {
    
    # Overwrite the file
    force = true;
    text = ''

# Kitty confif file
confirm_os_window_close 0

# Set zsh as default shell
shell zsh

# Set margin
window_padding_width 20

# Fonts
font_family      Liberation Mono
bold_font        auto
italic_font      auto
bold_italic_font auto


# Change font size
font_size 12.0

# Direct URL under the mouse
direct_urls yes

# Opacity, Be aware that using a value
# less than 1.0 is a (possibly significant)
# performance hit
# background_opacity 0.6
background_opacity 1

# Blur, too much will lead to performance problems
# background_blur 10

# Path to a background image. Must be in PNG format.
background_image none

# Set nvim as default editor
editor nvim

# kitten themes -------------------------

# Alucard

background #222330
foreground #cef3ff
cursor #ffffff
selection_background #44475a
color0 #000000
color8 #545454
color1 #ff5555
color9 #ff5454
color2 #fa0074
color10 #50fa7b
color3 #7f0a1f
color11 #f0fa8b
color4 #3282ff
color12 #1200f8
color5 #1b3cff
color13 #ff78c5
color6 #0037fc
color14 #8ae9fc
color7 #bbbbbb
color15 #ffffff
selection_foreground #222330

# Galaxy
background            #1c2836
foreground            #ffffff
cursor                #bbbbbb
selection_background  #b4d5ff
color0                #000000
color8                #545454
color1                #f9555f
color9                #fa8b8e
color2                #20af89
color10               #34bb99
color3                #fdf029
color11               #ffff55
color4                #589cf5
color12               #589cf5
color5                #934d95
color13               #e75598
color6                #1e9ee6
color14               #3978bb
color7                #bbbbbb
color15               #ffffff
selection_foreground #1c2836

'';
  };
}
