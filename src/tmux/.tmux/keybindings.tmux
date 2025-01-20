# Set the prefix to C-a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# Bind 'prefix r' to reloading conf settings
bind r source-file ~/.tmux.conf \; display "Configuration loaded"

# Split panes with | and -
bind | split-window -h
bind - split-window -v

# Pane navigation using hjkl
bind -r h select-pane -L  # move left
bind -r j select-pane -D  # move down
bind -r k select-pane -U  # move up
bind -r l select-pane -R  # move right

# Resize panes using HJKL
bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2
