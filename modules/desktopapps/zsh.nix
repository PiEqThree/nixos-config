{ pkgs, lib, config, ... }:
{
  options = {
  	zsh.enable = 
	  lib.mkEnableOption "enables zshell";

  };

  config = lib.mkIf config.zsh.enable {
    environment.systemPackages = [
      pkgs.zsh
    ];
    programs.zsh.enable = true;
    users.users.pi.shell = pkgs.zsh;
  };
}
