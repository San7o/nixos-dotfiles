{ ... }:

{
  # ------------------------- Custom Cache Server -----------------------------
  #
  # Nix provides an official cache server, https://cache.nixos.org,
  # which caches build results for all packages in nixpkgs under commonly
  # used CPU architectures. When you execute Nix build commands locally,
  # if Nix finds a corresponding cache on the server, it directly
  # downloads the cached file, skipping the time-consuming local build
  # process and significantly improving build speed.
  #
  nix.settings = {
    # given the users in this list the right to specify additional substituters via:
    #    1. `nixConfig.substituters` in `flake.nix`
    #    2. command line args `--options substituters http://xxx`
    trusted-users = ["santo"];

    substituters = [
      # cache mirror located in China
      # status: https://mirror.sjtu.edu.cn/
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      # status: https://mirrors.ustc.edu.cn/status/
      # "https://mirrors.ustc.edu.cn/nix-channels/store"

      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      # the default public key of cache.nixos.org, it's built-in, no need to add it here
      # "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
}
