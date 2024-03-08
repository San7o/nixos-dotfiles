{ config, ... }:

{
  imports = [
    ./bash.nix
    ./alacritty.nix
    ./kitty.nix
  ];
}
