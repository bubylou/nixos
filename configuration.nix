{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [
      <catppuccin/modules/nixos>
      <home-manager/nixos>
      ./game.nix
      ./hardware-configuration.nix
      ./home.nix
      ./yubikey-gpg.nix
    ];

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      device = "/dev/nvme0n1";
    };
  };

  networking.hostName = "gaming-pc";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.ollama = {
    enable = true;
    acceleration = "cuda";
    loadModels = [
      "deepseek-r1:7b"
      "deepseek-r1:8b"
    ];
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    gnome-characters
  ]);

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.buby = {
    isNormalUser = true;
    description = "Nicholas Malcolm";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  services.tailscale.enable = true;

  catppuccin = {
    enable = true;
    accent = "mocha";
  };

  fileSystems."/mnt/share" = {
    device = "nas01.bubylou.com:/srv/share";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  
  environment.systemPackages = with pkgs; [
    alacritty
    anydesk
    brave
    bws
    (catppuccin-gtk.override {
      accents = [ "blue" ];
      size = "compact";
      tweaks = [ "rimless"];
      variant = "mocha";
    })
    discord
    easyeffects
    firefox
    gimp
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.syncthing-indicator
    gnomeExtensions.tailscale-status
    mpv
    neovim
    obsidian
    onlyoffice-bin
    qmk
    qmk-udev-rules
    signal-desktop
    sublime-music
    syncthing
  ];

  services = {
      syncthing = {
          enable = true;
          user = "buby";
          dataDir = "/home/buby/Sync";
          configDir = "/home/buby/.config/syncthing";
      };
  };

  system.stateVersion = "24.05";
}
