{ config, pkgs, ...}:

{
	
  home.packages = with pkgs; [
      neovim      # The best text editor
  ];


  # Set default editor to neovim
  programs.neovim.defaultEditor = true;

  # Install Lazy
  # TODO
}
