{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs;
      [
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = "set -g @catppuccin_flavour 'mocha'";
        }
        tmuxPlugins.yank                # Copy to system clipboard
        tmuxPlugins.better-mouse-mode   # Mouse support
      ];
    extraConfig = ''
    # Set colors
    set -g default-terminal "screen-256color"

    set -g status-bg "#282c34"
    set -g status-fg grey

    # Enable mouse support
    set -g mouse on

    # Start windows and panes at 1, not 0
    set -g base-index 1
    set -g pane-base-index 1
    set-window-option -g pane-base-index 1
    set-option -g renumber-windows on

    # Use Alt-arrow keys without prefix key to switch panes
    bind -n M-Left select-pane -L
    bind -n M-Right select-pane -R
    bind -n M-Up select-pane -U
    bind -n M-Down select-pane -D

    # When splitting, use current path
    bind '"' split-window -v -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}
