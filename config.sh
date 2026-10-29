#!/bin/sh
echo "kakoi file?"
read -p "viberi: " answer
case "$answer" in
        configuration|config|conf|c|C|CONFIG|CONFIGURATION)
                SUDO_EDITOR="$(command -v nvim)" sudoedit /etc/nixos/configuration.nix
                ;;
        flake|f|FLAKE|F)
                SUDO_EDITOR="$(command -v nvim)" sudoedit /etc/nixos/flake.nix
                ;;
        home|home-manager|h|H|HOME-MANAGER|HOME)
                SUDO_EDITOR="$(command -v nvim)" sudoedit /etc/nixos/home.nix
                ;;
        hypr|hyprland|HYPR|HYPRLAND)
    SUDO_EDITOR="$(command -v nvim)" sudoedit ~/.config/hypr/hyprland.lua
    ;;
  *)
        echo "debil?"
        ;;
esac
