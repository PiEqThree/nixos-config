{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };

    disko = {
       url = "github:nix-community/disko";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, disko, home-manager, nixpkgs, ... }@inputs: {
    nixosConfigurations.kelbi = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/kelbi/configuration.nix
	inputs.disko.nixosModules.disko
	inputs.home-manager.nixosModules.default
      ];
    };

  };
}
