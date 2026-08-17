{ ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    keyMode = "vi";
    customPaneNavigationAndResize = true; # prefix + hjkl selects, HJKL resizes
    baseIndex = 1;
    escapeTime = 10; # default 500 makes <Esc> feel laggy in neovim
    historyLimit = 50000;
    mouse = false; # keyboard only, on purpose
    focusEvents = true; # let neovim see focus gained/lost (off by default on darwin)
    clock24 = true;
    terminal = "tmux-256color";

    extraConfig = ''
      # true color passthrough; ghostty reports TERM=xterm-ghostty
      set -as terminal-features ",xterm-ghostty:RGB"
      set -as terminal-features ",xterm-256color:RGB"
      set -g set-clipboard on

      set -g renumber-windows on
      set -g display-time 4000 # default 750ms is too quick to read

      # splits and new windows inherit the current directory
      bind -N "Split the pane into two, left and right" | split-window -h -c "#{pane_current_path}"
      bind -N "Split the pane into two, top and bottom" - split-window -v -c "#{pane_current_path}"
      bind -N "Create a new window" c new-window -c "#{pane_current_path}"
      unbind '"'
      unbind %

      bind -N "Reload tmux.conf" r source-file ~/.config/tmux/tmux.conf \; \
        display-message "tmux.conf reloaded"

      # C-hjkl moves across neovim splits and tmux panes alike. the upstream
      # vim-tmux-navigator tmux plugin is not used: it detects vim by grepping
      # `ps -o state=`, whose state column is space-padded on macOS, so its
      # `^[^TXZ ]+` anchor never matches and every key would jump panes. match
      # on tmux's own pane_current_command instead, which needs no subprocess.
      bind -n C-h if-shell -F '#{m/ri:^(g?\.?(view|l?n?vim?x?)(diff)?(-wrapped)?|fzf)$,#{pane_current_command}}' 'send-keys C-h' 'select-pane -L'
      bind -n C-j if-shell -F '#{m/ri:^(g?\.?(view|l?n?vim?x?)(diff)?(-wrapped)?|fzf)$,#{pane_current_command}}' 'send-keys C-j' 'select-pane -D'
      bind -n C-k if-shell -F '#{m/ri:^(g?\.?(view|l?n?vim?x?)(diff)?(-wrapped)?|fzf)$,#{pane_current_command}}' 'send-keys C-k' 'select-pane -U'
      bind -n C-l if-shell -F '#{m/ri:^(g?\.?(view|l?n?vim?x?)(diff)?(-wrapped)?|fzf)$,#{pane_current_command}}' 'send-keys C-l' 'select-pane -R'
      bind -n 'C-\' if-shell -F '#{m/ri:^(g?\.?(view|l?n?vim?x?)(diff)?(-wrapped)?|fzf)$,#{pane_current_command}}' 'send-keys C-\' 'select-pane -l'

      # let the same keys escape a pane that is in copy mode
      bind -T copy-mode-vi C-h select-pane -L
      bind -T copy-mode-vi C-j select-pane -D
      bind -T copy-mode-vi C-k select-pane -U
      bind -T copy-mode-vi C-l select-pane -R

      # vi-style visual selection in copy mode
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"

      # status bar: rose-pine (main), matching the neovim colorscheme.
      # positioned at the top so it does not stack against lualine.
      set -g status-position top
      set -g status-interval 5
      set -g status-justify left
      set -g status-style "bg=#191724,fg=#908caa"

      set -g status-left-length 40
      set -g status-left "#[fg=#191724,bg=#9ccfd8,bold] #S #[fg=#9ccfd8,bg=#191724] "
      set -g status-right-length 40
      set -g status-right "#[fg=#6e6a86]%Y-%m-%d #[fg=#908caa]%H:%M "

      setw -g window-status-separator ""
      setw -g window-status-format "#[fg=#6e6a86] #I:#W "
      setw -g window-status-current-format "#[fg=#e0def4,bold] #I:#W "

      set -g pane-border-style "fg=#26233a"
      set -g pane-active-border-style "fg=#31748f"
      set -g message-style "bg=#26233a,fg=#e0def4"
      set -g message-command-style "bg=#26233a,fg=#e0def4"
      set -g mode-style "bg=#403d52,fg=#e0def4"
      set -g clock-mode-colour "#9ccfd8"
    '';
  };
}
