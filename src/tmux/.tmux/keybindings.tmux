# Set the prefix to C-a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# Bind 'prefix r' to reloading conf settings
bind r source-file ~/.tmux.conf \; display "Configuration loaded"

# Split panes with | and -
bind | split-window -h
bind - split-window -v
