{ config, lib, pkgs, inputs, ... }:

{                                                                                            imports =                                                                                    [
      ./hardware-configuration.nix
      ./disko-config.nix
    ];
  # boot loader
  boot.loader.limine.enable = true;
  # kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # hostname
  networking.hostName = "existere";
  # network
  networking.networkmanager.enable = true;
  # time                                                                                     time.timeZone = "Europe/Moscow";                                                           # printer
  services.printing.enable = true;
  # sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  # user
  users.users.adam = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
  # programs
  environment.systemPackages = with pkgs; [                                                    neovim                                                                                     wget
    git
    ghostty
    fuzzel
    fastfetch
    waybar
    spotify
    throne
    steam
    cava
    obsidian
    discord
    telegram-desktop
    curl
    sbctl
    caelestia-shell
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    lutris
    librewolf
    vscode
    adwaita-icon-theme
    hyfetch
    chromium

  ];
  # version
  system.stateVersion = "26.05";
  # wm
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  # unfree
  nixpkgs.config.allowUnfree = true;
  # nvidia
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = false;
    package =
  config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "595.99.02";
    sha256_64bit = "sha256-6HR3lYv3YwcFSTJL1a1slI66btIQ5EAFs+/4SUD24ew=";
    sha256_aarch64 = "sha256-CCqHZTN2KNOZ4yZp2rDcuRJp9pHfRw47k4m4dWnS/2w=";
    openSha256 = "sha256-T36x/jx8yQ8l3LFp1rZIrTfcSwbGy8YSAvXOUSptpb4=";
    settingsSha256 = "sha256-GYCcnxfKPrTCrsmd25sMyzfC5cqJQJx0c31haooyTYM=";
    persistencedSha256 = "sha256-VyKtF/HdHPQrHHK6opSO69M72LmnGZtauuchj9uuje8=";
    };
  };
  # flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #display-manager
  services.xserver.displayManager.lightdm = {
    enable = true;
  };
  services.xserver.enable = true;
  #home-manager
  home-manager.users.adam = import ./home.nix;
  #throne
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
  #steam
  programs.steam.enable = true;
  #zsh
  programs.zsh.enable = true;
  users.users.adam.shell = pkgs.zsh;
  #cursor
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "20";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "20";
  };

}
