{ pkgs, lib, ... }:

let
  fine-cmdline = pkgs.vimUtils.buildVimPlugin {
    name = "fine-cmdline";
    src = pkgs.fetchFromGitHub {
      owner = "VonHeikemen";
      repo = "fine-cmdline.nvim";
      # git ls-remote https://github.com/VonHeikemen/fine-cmdline.nvim.git main
      rev = "dd676584145d62b30d7e8dbdd011796a8f0a065f";
      # Use this to get sha256
      # sha256 = pkgs.lib.fakeSha256;
      sha256 = "w9wwjClkOWk3wCgEiZIFLZRJ/gAfX38x2LnVRaelKD8=";
    };
  };

in
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
      nvim-tree-lua         # Directory tree
      vim-startify          # Fancy start screen
      nerdtree              # Another Directory tree
      surround-nvim         # Shortcut to surround a work with char
      syntastic             # Code syntax checking for a lot of languages
      YouCompleteMe         # Code completition for most languages
      vim-airline           # Bottom bar with some informations
      emmet-vim             # Amazing html completition
      telescope-zoxide      # Fuzzy finder
      fine-cmdline          # Better looking command line
      nvim-colorizer-lua    # Show hex colors immediately
      gitsigns-nvim         # Hilight text changed from last commit
    ];

    extraConfig = ''
      set expandtab
      set tabstop=4
      set rnu

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      nnoremap <C-Space> <cmd>NvimTreeToggle<cr>


    '';
    
    # Add this to enamble ycm
    # let g:ycm_show_diagnostics_ui = 0

    extraLuaConfig = ''
      require("gitsigns").setup()
      require("nvim-tree").setup()
    '';
  };


  # YCM Settings for C/C++
  home.file.".ycm_extra_conf.py" = {
    
      # Overwrite the file
      force = true;
      text = ''

   def Settings(**kwargs):
    return {
        'flags': ['-Wall' ],
    }   

      '';
    };


}
