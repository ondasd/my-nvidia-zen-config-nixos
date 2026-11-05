#!/bin/sh

echo "flake/default :"
read -p answer
case "$answer" in 
   default|def|d|D|DEF|DEFAULT)
      sudo nixos-rebuild switch
      ;;
   flake|fla|f|F|FLA|FLAKE)
      cd /etc/nixos
      sudo nixos-rebuild switch --flake
      cd ..
      ;;
   *)
      echo "try again"
      ;;
esac
