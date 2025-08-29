{ pkgs, lib, config, ... }:
{
  options = {
  	brave.enable = 
	  lib.mkEnableOption "enables brave browser";

  };

  config = lib.mkIf config.brave.enable {
    environment.systemPackages = [
      pkgs.brave
    ];
  };
}
