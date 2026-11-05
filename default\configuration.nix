{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
      ./disko.nix 
    ];

  # Bootloader.
  boot.loader.limine.enable = true;
  # Hostname
  networking.hostName = "nixos";
  # Networking
  networking.networkmanager.enable = true;
  # Time
  time.timeZone = "Europe/Moscow";
  # User
  users.users.alice = {
   isNormalUser = true;
   description = "Alice";
   extraGroups = [ "networkmanager" "wheel" ];
   packages = with pkgs; [
      thunderbird
    ];
 };
  # Firefox
  programs.firefox.enable = true;
  # Package
  environment.systemPackages = with pkgs; [
   vim
   wget
   git
  ];
  
}
