{ config, ... }:

{
  imports = [
    ./bash.nix
    ./alacritty.nix
    ./kitty.nix
    ./zsh.nix
    ./tmux.nix
  ];
}
