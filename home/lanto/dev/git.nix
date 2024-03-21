{ config, pkgs, ...}:

let
        # Get input from file .secret/github-access-token
	# Make sure It has no new line at the end
  	github-access-token = builtins.readFile "/home/lanto/.config/nixos/.secret/github-access-token";
in
{
  # Setup .get-credentials file with the input from file .secret/github-access-token
  home.file.".git-credentials".text = ''
https://San7o:${github-access-token}@github.com
  '';
  
  # .gitconfig configration
  home.file.".gitconfig".text = ''
    [user]
        name = San7o
        email = santigio2003@gmail.com

    [credential]
 	helper = store
  '';
}
