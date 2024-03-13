{ pkgs, ... }:


{
	
  home.packages = with pkgs; [
      neovim      # The best text editor
  ];


  # Set default editor to neovim
  programs.neovim.defaultEditor = true;

  home.file.".local/share/nvim/site/autoload/plug.vim" = {
	force = true;
	text = builtins.readFile ./plug.vim;
  };



  home.file.".config/nvim/init.lua" = {
	force = true;
	text = ''

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Neovim Tree
Plug('nvim-tree/nvim-tree.lua')

vim.call('plug#end')

	'';
  };

}
