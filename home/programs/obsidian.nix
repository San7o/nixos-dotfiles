# -------------------Obsidian.md !!! ------------------------

{ config, pkgs, nixpkgs, ... }:

{
  # Install obsidian
  home.packages = with pkgs; [
    obsidian
  ];
}
