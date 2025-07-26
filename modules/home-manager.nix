{ pkgs, ... }:

{
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    ansible
    bat
    bottom
    buildah
    dive
    doggo
    earthly
    eza
    fluxcd
    gcc
    gh
    git
    gnumake
    go
    just
    kind
    kubectl
    kubernetes-helm
    lazygit
    ncdu
    neovim
    nerd-fonts.mononoki
    nodejs
    ouch
    opentofu
    podman
    podman-compose
    python3
    ripgrep
    rsync
    tmux
    unzip
    xh
    xclip
    yazi
    yq
  ];

  programs.eza = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.git = {
    enable = true;
    userEmail = "bubylou@pm.me";
    userName = "Nicholas Malcolm";
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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true; 
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "helm" "kubectl" ];
      theme = "robbyrussell";
    };
  };
}
