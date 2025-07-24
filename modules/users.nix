{ config, lib, modulesPath, pkgs, ... }:

{
  programs.zsh.enable = true;
  time.timeZone = "America/New_York";

  users.users.buby = {
    isNormalUser = true;
    description = "Nicholas Malcolm";
    extraGroups = [ "networkmanager" "podman" "wheel" ];
    packages = with pkgs; [
      neovim
    ];
    shell = pkgs.zsh;
  };
}
