#! /run/current-system/sw/bin/sh

if [[ $# != 1  ]] then
	echo -e "Usage: build.sh <build_profie>\n"
	echo "Currently supported users:"
	echo " - \"santo@acer\" "
	echo " - \"lanto@hp\" "
	exit
fi

sudo nixos-rebuild test --flake .#$1 --impure
