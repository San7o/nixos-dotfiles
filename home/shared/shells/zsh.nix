{ pkgs, ... }:

{
    
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        history.size = 1000;
        history.path = "$HOME/.hisfile";

        # Plugins
        enableAutosuggestions = true;
        syntaxHighlighting.enable = true;

        initExtra = ''
             unsetopt BEEP
             setopt hist_ignore_all_dups

             alias sn="shutdown now"
             alias launchpad-app="/home/santo/Documents/launchpad-app-launcher/out &"
        '';


        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "direnv" ];
            theme = "agnoster";
        };
    };

}
