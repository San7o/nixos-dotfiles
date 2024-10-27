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
font_size 11.0

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

# Dark One Nuanced by ariasuni, https://store.kde.org/p/1225908
# Imported from KDE .colorscheme format by thematdev, https://thematdev.org
# For migrating your schemes from Konsole format see 
# https://git.thematdev.org/thematdev/konsole-scheme-migration


# importing Background
background #282c34
# importing BackgroundFaint
# importing BackgroundIntense
# importing Color0
color0 #3f4451
# importing Color0Faint
color16 #282c34
# importing Color0Intense
color8 #4f5666
# importing Color1
color1 #e06c75
# importing Color1Faint
color17 #c25d66
# importing Color1Intense
color9 #ff7b86
# importing Color2
color2 #98c379
# importing Color2Faint
color18 #82a566
# importing Color2Intense
color10 #b1e18b
# importing Color3
color3 #d19a66
# importing Color3Faint
color19 #b38257
# importing Color3Intense
color11 #efb074
# importing Color4
color4 #61afef
# importing Color4Faint
color20 #5499d1
# importing Color4Intense
color12 #67cdff
# importing Color5
color5 #c678dd
# importing Color5Faint
color21 #a966bd
# importing Color5Intense
color13 #e48bff
# importing Color6
color6 #56b6c2
# importing Color6Faint
color22 #44919a
# importing Color6Intense
color14 #63d4e0
# importing Color7
color7 #e6e6e6
# importing Color7Faint
color23 #c8c8c8
# importing Color7Intense
color15 #ffffff
# importing Foreground
foreground #abb2bf
# importing ForegroundFaint
# importing ForegroundIntense
# importing General


'';
  };
}
