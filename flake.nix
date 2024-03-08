{
  
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {

    # System configuration
    #
    nixosConfigurations = {
      # Your hostname
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Set home-manager for the user santo
            home-manager.users.santo = import ./home;
            
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }

        ];
      };

    };
/*
      # home-manager
      #
      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager <command> --flake .#username@hostname'
      homeConfigurations = {
        "santo@nixos" =
            home-manager.lib.homeManagerConfiguration {
              pkgs = nixpkgs.legacyPackages."x86_64-linux";
              modules = [ ./home-manager ];
            };
        };
*/
  };
}
