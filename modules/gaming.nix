{ config, pkgs, ... }:
{
  # dotnet/mono for Vintage Story
  nixpkgs.config.permittedInsecurePackages = [ "dotnet-runtime-7.0.20" "dotnet-sdk-7.0.410" ];
  environment.sessionVariables = { DOTNET_ROOT = "${pkgs.dotnet-sdk_7}/share/dotnet"; };

  environment.systemPackages = with pkgs; [
    heroic
    lutris
    prismlauncher
    wine
  ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
