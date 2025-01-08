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
    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true; 
      oh-my-zsh = {
        enable = true;
        plugins = [ "docker" "docker-compose" "doctl" "git" "helm" "httpie" "kubectl" ];
        theme = "robbyrussell";
      };
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
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
