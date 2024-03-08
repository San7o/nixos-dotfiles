{ config, pkgs, ...}:
{

  # Enable opengl
  hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
  };

  # Load nvidia driver for xorg and wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
      # Required
      modesetting.enable = true;

      # Nvidia power management, still experimental and unstable
      powerManagement.enable = false;
      # Turns off GPU when not used
      powerManagement.finegrained = false;

      # Access the nvidia settings menu via nvidia-settings
      nvidiaSettings = true;
  };
}
