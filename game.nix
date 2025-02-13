{ config, pkgs, ... }:
{
  # dotnet/mono for Vintage Story
  nixpkgs.config.permittedInsecurePackages = [ "dotnet-sdk-7.0.410" ];
  environment.sessionVariables = { DOTNET_ROOT = "${pkgs.dotnet-sdk_7}/share/dotnet"; };

  environment.systemPackages = with pkgs; [
    coolercontrol.coolercontrol-gui
    heroic
    lutris
    (retroarch.override {
      cores = with libretro; [
        gambatte
        mame
        melonds
        mgba
        mupen64plus
        quicknes
        snes9x
        swanstation
      ];
    })
    prismlauncher
    wine
  ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
