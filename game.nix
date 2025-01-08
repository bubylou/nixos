{ config, pkgs, ... }:
{
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

  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };

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
