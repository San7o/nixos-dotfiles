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

## name: Everforest Dark Hard
## author: Sainnhe Park
## license: MIT
## upstream: https://github.com/ewal/kitty-everforest/blob/master/themes/everforest_dark_hard.conf
## blurb: A green based color scheme designed to be warm and soft

foreground                      #d3c6aa
background                      #272e33
selection_foreground            #9da9a0
selection_background            #464e53

cursor                          #d3c6aa
cursor_text_color               #2e383c

url_color                       #7fbbb3

active_border_color             #a7c080
inactive_border_color           #4f5b58
bell_border_color               #e69875
visual_bell_color               none

wayland_titlebar_color          system
macos_titlebar_color            system

active_tab_background           #272e33
active_tab_foreground           #d3c6aa
inactive_tab_background         #374145
inactive_tab_foreground         #9da9a0
tab_bar_background              #2e383c
tab_bar_margin_color            none

mark1_foreground                #272e33
mark1_background                #7fbbb3
mark2_foreground                #272e33
mark2_background                #d3c6aa
mark3_foreground                #272e33
mark3_background                #d699b6

#: black
color0                          #343f44
color8                          #868d80

#: red
color1                          #e67e80
color9                          #e67e80

#: green
color2                          #a7c080
color10                         #a7c080

#: yellow
color3                          #dbbc7f
color11                         #dbbc7f

#: blue
color4                          #7fbbb3
color12                         #7fbbb3

#: magenta
color5                          #d699b6
color13                         #d699b6

#: cyan
color6                          #83c092
color14                         #83c092

#: white
color7                          #859289
color15                         #9da9a0

# -------------------------------------

'';
  };
}
