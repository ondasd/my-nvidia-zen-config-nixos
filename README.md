конфигурация NixOS. home ~/.config/home-manager 


DISKO:
1. Загрузитесь с NixOS Live USB
2. Откройте терминал и выполните:

nix run github:nix-community/disko -- --mode disko /path/to/disko-config.nix

vim ~/disko-config.nix

nix run github:nix-community/disko -- --mode disko ~/disko-config.nix
