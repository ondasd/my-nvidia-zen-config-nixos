#!/bin/sh

cd /etc/nixos
sudo nixos-rebuild switch --flake
cd ..
