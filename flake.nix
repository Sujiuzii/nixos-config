{
  description = "A flake for daily use based on configuration of Crabtux";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nur, home-manager, ... }@inputs: 
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages = import ./pkgs pkgs;
      overlays = import ./overlays { inherit inputs pkgs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        lenovo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = 
            [
              ./hosts/lenovo
              nur.modules.nixos.default
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.suhui = import ./hosts/lenovo/home.nix;
                home-manager.extraSpecialArgs = { inherit inputs outputs; };
              }
            ];
        };
      };

      homeConfigurations = {
        ustcnet-3660 = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit nixpkgs outputs system; };
          modules = [
            ./hosts/ustcnet-3660/home.nix
          ];
        };
      };

    };
}

