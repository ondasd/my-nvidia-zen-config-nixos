{ config, pkgs, inputs, ... }:

{
  # inform
  home.username = "adam";
  home.homeDirectory = "/home/adam";

  # version
  home.stateVersion = "26.05";
  # environment.
 # home.packages = [

 # ];
  home.file = {
  };
  #

  # home-manager install
  programs.home-manager.enable = true;
  # zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      zapret = "./zapret.sh";                                                                    switch = "./switch.sh";                                                                    config = "./which-config.sh";
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "gentoo";
    };
  };
  #cursor
  home.pointerCursor = {
   enable = true;
   gtk.enable = true;
   x11.enable = true;                                                                         package = pkgs.bibata-cursors;                                                             name = "Bibata-CUrsors";
   size = 20;
};
  #lazyvim
  programs.lazyvim.enable = true;
  #terminal
   programs.ghostty = {
    enable = true;

    settings = {                                                                                 font-family = "JetBrainsMono Nerd Font";                                                   font-size = 12;
      window-padding-x = 5;
      window-padding-y = 5;
      background-opacity = 0.60;
      shell-integration = "zsh";
    };
  };

}
