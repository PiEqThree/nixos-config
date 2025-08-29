{ config, lib, pkgs, ... }:
{
  options = {
	gnome.enable = 
	  lib.mkEnableOption "enables gnome as the desktop env";
	gnomeMinimal.enable = 
	  lib.mkEnableOption "enables a minimal gnome desktop env";
  };

  config = lib.mkMerge [
	(lib.mkIf (config.gnome.enable) {
        	services.xserver.enable = true;
		services.displayManager.gdm.enable = true;
		services.desktopManager.gnome.enable = true;	
	})
	(lib.mkIf (config.gnomeMinimal.enable) {
		services.xserver.enable = true;
		services.displayManager.gdm.enable = true;
		services.desktopManager.gnome.enable = true;	

		services.gnome.core-apps.enable = false;
		services.gnome.core-developer-tools.enable = false;
		services.gnome.games.enable = false;
		environment.systemPackages = with pkgs; [ gnome-console ];
		environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
	})
	];
}
