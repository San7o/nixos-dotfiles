{ pkgs, ... }:

{
  users.users.santo = {
    isNormalUser = true;
    description = "santo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Define packages here
    ];
  };

  # light-santo
  users.users.lanto = {
    isNormalUser = true;
    description = "light-santo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Define packages here
    ];
  };

}
