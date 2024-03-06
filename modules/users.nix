{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.santo = {
    isNormalUser = true;
    description = "santo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      python3

    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
