{ pkgs, ... }:


{
  programs.neovim.enable = true;

  # Set default editor to neovim
  # - apparently this deas not work
  programs.neovim.defaultEditor = true;
  home.sessionVariables.EDITOR = "nvim";

  # Install plugins
  # Search for them here
  # https://search.nixos.org/packages?from=0&size=50&sort=relevance&type=packages&query=vimPlugins
  # https://github.com/m15a/nixpkgs-vim-extra-plugins
  # https://github.com/NixNeovim/NixNeovimPlugins

  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-tree-lua
    vim-startify
    nerdtree
  ];


}
