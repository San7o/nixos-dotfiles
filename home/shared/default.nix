{ pkgs, ... }:

{
  imports = [
    ./desktop
    ./dev
    ./shells
  ];

  home.packages = with pkgs; [
    nerdfonts
  ];

}
