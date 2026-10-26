{ config, pkgs, ... }:

{
  # inform
  home.username = "adam";
  home.homeDirectory = "/home/adam";

  # version
  home.stateVersion = "26.05";
  # environment.
  home.packages = [

  ];
  home.file = {
  };
  # Home Manager can also manage your environment variables through
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # home-manager install
  programs.home-manager.enable = true;
  # zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      zapret = "cd zapret-discord-youtube-linux && ./service.sh";
      update = "sudo nixos-rebuild switch";
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "gentoo";
    };
  };
}
