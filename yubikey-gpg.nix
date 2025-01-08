{ config, lib, pkgs, ... }:

{
  programs.ssh.startAgent = false;
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-gnome3
    yubikey-personalization
  ];

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  hardware.gpgSmartcards.enable = true;
}
