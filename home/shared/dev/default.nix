{ config, pkgs, ... }:

{
   imports = [
      ./git.nix
      ./neovim.nix
   ];
}
