{ config, pkgs, ... }:
{
  home-manager.backupFileExtension = "uwu";
  home-manager.users.buby = { pkgs, ... }: {
    home.username = "buby";
    home.homeDirectory = "/home/buby";
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
      act
      ansible
      apko
      bat
      bazel
      bottom
      buildah
      carapace
      dig
      dive
      doctl
      earthly
      eza
      fluxcd
      gcc
      gh
      gnumake
      go
      go-task
      helmfile
      httpie
      just
      kind
      kubectl
      kubernetes-helm
      kubeseal
      lazygit
      lf
      mage
      ncdu
      neovim
      (nerdfonts.override { fonts = [ "Mononoki"]; })
      nodejs
      opentofu
      podman
      podman-compose
      poetry
      python3
      ripgrep
      rsync
      tmux
      unrar-free
      unzip
      xclip
      yq
      zsh
    ];
    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
    programs.ghostty = {
      enable = true;
    };
    programs.nushell = {
      enable = true;
      envFile = {
        text = ''
          let BWS_ACCESS_TOKEN = "$(cat /etc/nixos/secret.txt)"
          let DEEPSEEK_API_KEY = "$(bws secret get 99c8e59c-2cc6-4c85-8cbd-b26c0154596c | yq -r .value)"
          let GITHUB_TOKEN = "$(gh auth token)"
          let OPENAI_API_KEY = "$(bws secret get dd7e1193-b1bc-4ab5-a58e-b26100ed26ab | yq -r .value)"
        '';
      };
      configFile = {
        text = ''
          $env.config.buffer_editor = "nvim";
          $env.config.show_banner = false;
          $env.config.completions.external.enable = true
        '';
      };
    };
    programs.eza = {
      enable = true;
      enableNushellIntegration = true;
    };
    programs.git = {
      enable = true;
      userEmail = "bubylou@pm.me";
      userName = "Nicholas Malcolm";
    };
    programs.go = {
      enable = true;
      goPath = "go";
    };
    programs.starship = {
      enable = true;
      enableNushellIntegration = true;
      settings = {
        kubernetes = {
          disabled = false;
          format = "on [⛵ $context ](dimmed green)";
        };
      };
    };
    programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
