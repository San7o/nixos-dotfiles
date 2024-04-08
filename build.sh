#! /run/current-system/sw/bin/sh

if [[ $# != 2  ]] then
	echo -e "Usage: build.sh <system|home> <build_profie>\n"
	echo "Currently supported users:"
	echo " - \"santo@acer\" "
	echo " - \"santo@desktop\" "
	echo " - \"lanto@hp\" "
	exit
fi

if [[ $1 == "home" ]]; then
	home-manager switch --flake .#$2 --impure
    cowsay "Everything is fine"
	exit

fi
if [[ $1 == "system" ]]; then

	sudo nixos-rebuild switch --flake .#$2 --impure
    cowsay "Everything is fine"
	exit
fi

echo "Wrong arguments"
