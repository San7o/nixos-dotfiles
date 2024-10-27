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

  obsidian-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "obsidian-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "epwalsh";
      repo = "obsidian.nvim";
      # git ls-remote https://github.com/epwalsh/obsidian.nvim.git
      rev = "fda8df43ebb1f2694af4e3bb53dd2886b9f9c896";
      sha256 = "rOEPJ0d2yKkS3Fnsd2tZ+V73y81VbPPTfv8Pw53LIfk=";
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
      nvim-tree-lua # Directory tree
      nerdtree # Another Directory tree
      surround-nvim # Shortcut to surround a work with char
      syntastic # Code syntax checking for a lot of languages
      YouCompleteMe # Code completition for most languages
      vim-airline # Bottom bar with some informations
      emmet-vim # Amazing html completition
      telescope-zoxide # Fuzzy finder
      fine-cmdline # Better looking command line
      nvim-colorizer-lua # Show hex colors immediately
      gitsigns-nvim # Hilight text changed from last commit
      copilot-vim # Github's AI assistant
      markdown-preview-nvim # Preview markdown files
      alpha-nvim # Fancy start screen
      obsidian-nvim # Obsidian integration in neovim
      vim-elixir # Elixir support
      html5-vim # HTML5 support
      emmet-vim # Emmet support
      vimtex # Latex live preview
      vim-markdown # Markdown support
    ];

    extraConfig = ''
      set expandtab
      set tabstop=4
      set rnu
      set clipboard=unnamedplus

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      nnoremap <C-Space> <cmd>NvimTreeToggle<cr>

      set conceallevel=1

      let g:vimtex_view_method = 'zathura'
      let g:vimtex_compiler_method = 'latexrun'
    '';

    # Add this to enamble ycm
    # let g:ycm_show_diagnostics_ui = 0

    extraLuaConfig = ''
      require("gitsigns").setup()
      require("nvim-tree").setup()
      require("alpha").setup(require("alpha.themes.dashboard").opts)
      require("colorizer").setup()
      require("obsidian").setup {
          workspaces = {
            {
                name = "my-second-brain",
                path = "~/Documents/ObsidianVault",
            },
          },  
      }
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
