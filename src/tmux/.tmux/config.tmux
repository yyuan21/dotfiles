# Issue keystrokes without delay
set -s escape-time 1

# Mouse settings
set -g mouse off

# Default terminal mode
set -g default-terminal "screen-256color"

# Refresh interval, default is 15 secs
set -g status-interval 5

# Enable activity alert. This highlights the window name in the status line when
# there's activity in that window.
setw -g monitor-activity on
set -g visual-activity on

# Enable emacs mode
setw -g mode-keys emacs
