{ pkgs, ... }:


{
  programs.neovim = { 

    enable = true;
    defaultEditor = true;

    # Install plugins
    # Search for them here
    # https://search.nixos.org/packages?from=0&size=50&sort=relevance&type=packages&query=vimPlugins
    # https://github.com/m15a/nixpkgs-vim-extra-plugins
    # https://github.com/NixNeovim/NixNeovimPlugins
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      vim-startify
      nerdtree

      syntastic       # Code syntax checking for a lot of languages
      YouCompleteMe   # Code completition for most languages
      vim-airline     # Bottom bar with some informations
      emmet-vim       # Amazing html completition
      telescope-zoxide  # Fuzzy finder
    ];

    extraConfig = ''
      set expandtab
      set tabstop=4
      set rnu
    '';

  };
}
