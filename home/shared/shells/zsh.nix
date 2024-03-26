{ pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        history.size = 1000;
        history.path = "$HOME/.hisfile";
        # autosuggestion.enable = true;
        
        initExtra = ''
             unsetopt BEEP
        '';


        oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
            theme = "agnoster";
        };
    };

}
