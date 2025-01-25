{ config, pkgs, ... }:
{
  home-manager.users.buby = { pkgs, ... }: {
    home.username = "buby";
    home.homeDirectory = "/home/buby";
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
      act
      ansible
      bat
      bottom
      dig
      doctl
      eza
      fluxcd
      gcc
      gh
      gnumake
      go
      helmfile
      httpie
      jq
      kind
      kubectl
      kubernetes-helm
      kubeseal
      lazygit
      lf
      ncdu
      neovim
      (nerdfonts.override { fonts = [ "Mononoki"]; })
      nodejs
      opentofu
      poetry
      python3
      ripgrep
      rsync
      tmux
      unrar-free
      unzip
      xclip
    ];
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true; 
      initExtra = ''
        export BWS_ACCESS_TOKEN=$(cat /etc/nixos/secret.txt)
        export DEEPSEEK_API_KEY=$(bws secret get 99c8e59c-2cc6-4c85-8cbd-b26c0154596c | jq -r .value)
        export GITHUB_TOKEN=$(gh auth token)
        export OPENAI_API_KEY=$(bws secret get dd7e1193-b1bc-4ab5-a58e-b26100ed26ab | jq -r .value)
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "docker" "docker-compose" "doctl" "git" "helm" "httpie" "kubectl" ];
        theme = "robbyrussell";
      };
    };
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
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
      enableZshIntegration = true;
      settings = {
        battery = {
          full_symbol = "🔋 ";
          charging_symbol = "⚡️ ";
          discharging_symbol = "💀 ";
          display = {
            threshold = 100;
            style = "bold red";
          };
        };
        kubernetes = {
          disabled = false;
          format = "on [⛵ $context ](dimmed green)";
        };
      };
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
