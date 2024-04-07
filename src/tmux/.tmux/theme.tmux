# Mostly taken from 'Nord' theme.

# Set the base indices for windows and panes to 1 (default is 0)
set -g base-index 1
setw -g pane-base-index 1

# Status line
set -g status-style bg=black,fg=white
set -g status-justify left

# Colors for panes
setw -g pane-border-style bg=default,fg=brightblack
setw -g pane-active-border-style bg=default,fg=blue
set -g display-panes-colour black
set -g display-panes-active-colour brightblack

# Command / message line
set -g message-style bg=brightblack,fg=cyan
set -g message-command-style bg=brightblack,fg=cyan

# Status line
# #H        Hostname of local host
# #h        Hostname of local host without the domain name
# #F        Current window flag
# #I        Current window index
# #P        Current pane index
# #S        Current session name
# #T        Current window title
# #W        Current window name
# ##        A literal #
# #(shell-command)    First line of the shell command's output
# #[attributes]       Color or attribute change

%hidden RIGHT_ARROW1=""
%hidden RIGHT_ARROW2=""
%hidden LEFT_ARROW1=""
%hidden LEFT_ARROW2=""

%hidden DATE_FMT="%Y-%m-%d"
%hidden TIME_FMT="%I:%M %p"

# Status bar background color.
%hidden STATUS_BAR_BG="black"

# Status bar left: left most section (session name).
%hidden STATUS_LEFTMOST_BG="blue"                   # BG color
%hidden STATUS_LEFTMOST_FONT_FG="black"             # Font color

# Status bar right: left side sections (date, time, etc.).
%hidden STATUS_RIGHT_LEFT_SECS_BG="brightblack"     # BG color
%hidden STATUS_RIGHT_LEFT_SECS_FONT_FG="white"      # Font color

# Status bar right: right most section (hostname).
%hidden STATUS_RIGHTMOST_BG="cyan"                  # BG color
%hidden STATUS_RIGHTMOST_FONT_FG="black"            # Font color

# Windows list: inactive
%hidden WINDOW_INACTIVE_BG="brightblack"            # BG color
%hidden WINDOW_INACTIVE_FONT_FG="white"             # Font color

# Windows list: active
%hidden WINDOW_ACTIVE_BG="cyan"                     # BG color
%hidden WINDOW_ACTIVE_FONT_FG="black"               # Font color

%hidden ARROW_COLOR_CODES="nobold,noitalics,nounderscore"

# Status left (session name)
%hidden STATUS_LEFTMOST_FONT="#[fg=${STATUS_LEFTMOST_FONT_FG},bg=${STATUS_LEFTMOST_BG},bold]"
%hidden STATUS_LEFTMOST_ARROW_RIGHT="#[fg=${STATUS_LEFTMOST_BG},bg=${STATUS_BAR_BG},${ARROW_COLOR_CODES}]"
set -g status-left "${STATUS_LEFTMOST_FONT} #S ${STATUS_LEFTMOST_ARROW_RIGHT}${RIGHT_ARROW1}"

# Status right
%hidden STATUS_RIGHT_LEFT_SECS_FONT="#[fg=${STATUS_RIGHT_LEFT_SECS_FONT_FG},bg=${STATUS_RIGHT_LEFT_SECS_BG}]"
%hidden STATUS_RIGHT_LEFT_SECS_ARROW_LEFT="#[fg=${STATUS_RIGHT_LEFT_SECS_BG},bg=${STATUS_BAR_BG},${ARROW_COLOR_CODES}]"
%hidden STATUS_RIGHT_LEFT_SECS_ARROW_RIGHT="#[fg=${STATUS_RIGHT_LEFT_SECS_FONT_FG},bg=${STATUS_RIGHT_LEFT_SECS_BG},${ARROW_COLOR_CODES}]"

%hidden STATUS_RIGHTMOST_FONT="#[fg=${STATUS_RIGHTMOST_FONT_FG},bg=${STATUS_RIGHTMOST_BG},bold]"
%hidden STATUS_RIGHTMOST_ARROW_LEFT="#[fg=${STATUS_RIGHTMOST_BG},bg=${STATUS_RIGHT_LEFT_SECS_BG},${ARROW_COLOR_CODES}]"

set -g status-right "${STATUS_RIGHT_LEFT_SECS_ARROW_LEFT}${LEFT_ARROW1}${STATUS_RIGHT_LEFT_SECS_FONT} ${DATE_FMT} ${STATUS_RIGHT_LEFT_SECS_ARROW_RIGHT}${LEFT_ARROW2}${STATUS_RIGHT_LEFT_SECS_FONT} ${TIME_FMT} ${STATUS_RIGHTMOST_ARROW_LEFT}${LEFT_ARROW1}${STATUS_RIGHTMOST_FONT} #h "

# Window list
%hidden WINDOW_INACTIVE_FONT="#[fg=${WINDOW_INACTIVE_FONT_FG},bg=${WINDOW_INACTIVE_BG}]"
%hidden WINDOW_INACTIVE_ARROW_LEFT="#[fg=${STATUS_BAR_BG},bg=${WINDOW_INACTIVE_BG},${ARROW_COLOR_CODES}]"
%hidden WINDOW_INACTIVE_ARROW_MID="#[fg=${WINDOW_INACTIVE_FONT_FG},bg=${WINDOW_INACTIVE_BG},${ARROW_COLOR_CODES}]"
%hidden WINDOW_INACTIVE_ARROW_RIGHT="#[fg=${WINDOW_INACTIVE_BG},bg=${STATUS_BAR_BG},${ARROW_COLOR_CODES}]"

set -g window-status-format "${WINDOW_INACTIVE_ARROW_LEFT}${RIGHT_ARROW1} ${WINDOW_INACTIVE_FONT}#I ${WINDOW_INACTIVE_ARROW_MID}${RIGHT_ARROW2} ${WINDOW_INACTIVE_FONT}#W #F ${WINDOW_INACTIVE_ARROW_RIGHT}${RIGHT_ARROW1}"

# Current window
%hidden WINDOW_ACTIVE_FONT="#[fg=${WINDOW_ACTIVE_FONT_FG},bg=${WINDOW_ACTIVE_BG}]"
%hidden WINDOW_ACTIVE_ARROW_LEFT="#[fg=${STATUS_BAR_BG},bg=${WINDOW_ACTIVE_BG},${ARROW_COLOR_CODES}]"
%hidden WINDOW_ACTIVE_ARROW_MID="#[fg=${WINDOW_ACTIVE_FONT_FG},bg=${WINDOW_ACTIVE_BG},${ARROW_COLOR_CODES}]"
%hidden WINDOW_ACTIVE_ARROW_RIGHT="#[fg=${WINDOW_ACTIVE_BG},bg=${STATUS_BAR_BG},${ARROW_COLOR_CODES}]"

set -g window-status-current-format "${WINDOW_ACTIVE_ARROW_LEFT}${RIGHT_ARROW1} ${WINDOW_ACTIVE_FONT}#I ${WINDOW_ACTIVE_ARROW_MID}${RIGHT_ARROW2} ${WINDOW_ACTIVE_FONT}#W #F ${WINDOW_ACTIVE_ARROW_RIGHT}${RIGHT_ARROW1}"
set -g window-status-separator ""

