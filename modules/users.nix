{ config, lib, modulesPath, pkgs, ... }:

{
  time.timeZone = "America/New_York";

  users.users.buby = {
    isNormalUser = true;
    description = "Nicholas Malcolm";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      neovim
    ];
  };
}
