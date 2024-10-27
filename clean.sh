#! /bin/sh

# Use this script to clean up the nix store and update the nix channels

nix-channel --update
sudo nix-channel --update
sudo rm /nix/var/nix/gcroots/auto/*
nix-collect-garbage -d
sudo nix-collect-garbage -d
sudo nix-store --optimize
