{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, catppuccin, disko, home-manager, ... }: {
    nixosConfigurations.stealth16ai = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./stealth16ai.nix
        catppuccin.nixosModules.catppuccin
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager

        {
          home-manager.backupFileExtension = "backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.buby = {
            imports = [
              ./modules/home-manager.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
      ];
    };
  };
}
