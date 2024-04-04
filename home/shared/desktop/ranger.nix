{ config, ... }:

{

  # From the initial i3 config

  home.file.".config/ranger/rc.conf" = {
    
    # Overwrite the file
    force = true;
    text = ''
set preview_images true
set preview_images_method kitty
set show hidden true
  '';
  };
}
