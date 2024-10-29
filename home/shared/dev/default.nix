{ config, pkgs, ... }:

{
  imports = [
    ./neovim.nix
  ];

  home.packages = [
   (import ./emacs.nix { inherit pkgs; })
  ];

  home.file.".emacs.d/init.el" = {
    # Overwrite the file
    force = true;
    text = builtins.readFile ./init.el;
  };

  home.file.".xinitrc" = {
    # Overwrite the file
    force = true;
    text = builtins.readFile ./xinitrc;
  };
}
