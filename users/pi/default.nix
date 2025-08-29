{ pkgs, inputs, ... }:
{
  imports = [
	inputs.home-manager.nixosModules.default
  ];
  users.users.pi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
 
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "pi" = import ./home.nix;
    };
  };

}
