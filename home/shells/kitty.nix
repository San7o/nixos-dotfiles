{ config, ... }:

{

  # From the initial i3 config

  home.file.".config/kitty/kitty.conf" = {
    
    # Overwrite the file
    force = true;
    text = ''

# Kitty confif file
confirm_os_window_close 0

'';
  };
}
