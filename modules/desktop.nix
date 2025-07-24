{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "buby";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    gnome-characters
  ]);

  environment.systemPackages = with pkgs; [
    brave
    discord
    firefox
    foliate
    ghostty
    gimp
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.syncthing-indicator
    gnomeExtensions.tailscale-status
    mpv
    obsidian
    onlyoffice-bin
    qmk
    qmk-udev-rules
    signal-desktop
    sublime-music
    vim
  ];
}
