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

#set -g status-left "#[fg=green]Session: #S #[fg=yellow]W:#I #[fg=cyan]P:#P"
#set -g status-right "#[fg=cyan]%a %Y-%m-%d %H:%M"

set-environment -g ST_BAR_COLOR_BG "black"

set-environment -g TMUX_STATUS_RIGHT_ARROW1 ""
set-environment -g TMUX_STATUS_RIGHT_ARROW2 ""
set-environment -g TMUX_STATUS_LEFT_ARROW1 ""
set-environment -g TMUX_STATUS_LEFT_ARROW2 ""
set-environment -g TMUX_STATUS_DATE_FMT "%Y-%m-%d"
set-environment -g TMUX_STATUS_TIME_FMT "%I:%M %p"

set-environment -g ARROW_COLOR_CODES "nobold,noitalics,nounderscore"

# Status left
set-environment -g STL_COLOR_BG "blue"
set-environment -g STL_COLOR_FONT_FG "black"
set-environment -g STL_COLOR_FONT "#[fg=${STL_COLOR_FONT_FG},bg=${STL_COLOR_BG},bold]"
set-environment -g STL_COLOR_ARROW_RIGHT "#[fg=${STL_COLOR_BG},bg=${ST_BAR_COLOR_BG},${ARROW_COLOR_CODES}]"
set -g status-left "${STL_COLOR_FONT} #S ${STL_COLOR_ARROW_RIGHT}${TMUX_STATUS_RIGHT_ARROW1}"

# Status right
set-environment -g STR_COLOR_BG_LEFT "brightblack"
set-environment -g STR_COLOR_FONT_FG_LEFT "white"
set-environment -g STR_COLOR_FONT_LEFT "#[fg=${STR_COLOR_FONT_FG_LEFT},bg=${STR_COLOR_BG_LEFT}]"
set-environment -g STR_COLOR_ARROW_LEFT_LEFT "#[fg=${STR_COLOR_BG_LEFT},bg=${ST_BAR_COLOR_BG},${ARROW_COLOR_CODES}]"
set-environment -g STR_COLOR_ARROW_LEFT_RIGHT "#[fg=${STR_COLOR_FONT_FG_LEFT},bg=${STR_COLOR_BG_LEFT},${ARROW_COLOR_CODES}]"

set-environment -g STR_COLOR_BG_RIGHT "cyan"
set-environment -g STR_COLOR_FONT_FG_RIGHT "black"
set-environment -g STR_COLOR_FONT_RIGHT "#[fg=${STR_COLOR_FONT_FG_RIGHT},bg=${STR_COLOR_BG_RIGHT},bold]"
set-environment -g STR_COLOR_ARROW_RIGHT_LEFT "#[fg=${STR_COLOR_BG_RIGHT},bg=${STR_COLOR_BG_LEFT},${ARROW_COLOR_CODES}]"

set -g status-right "${STR_COLOR_ARROW_LEFT_LEFT}${TMUX_STATUS_LEFT_ARROW1}${STR_COLOR_FONT_LEFT} ${TMUX_STATUS_DATE_FMT} ${STR_COLOR_ARROW_LEFT_RIGHT}${TMUX_STATUS_LEFT_ARROW2}${STR_COLOR_FONT_LEFT} ${TMUX_STATUS_TIME_FMT} ${STR_COLOR_ARROW_RIGHT_LEFT}${TMUX_STATUS_LEFT_ARROW1}${STR_COLOR_FONT_RIGHT} #h "

# Window list
set-environment -g WD_COLOR_BG "brightblack"
set-environment -g WD_COLOR_FONT_FG "white"
set-environment -g WD_COLOR_FONT "#[fg=${WD_COLOR_FONT_FG},bg=${WD_COLOR_BG}]"
set-environment -g WD_COLOR_ARROW_LEFT "#[fg=${ST_BAR_COLOR_BG},bg=${WD_COLOR_BG},${ARROW_COLOR_CODES}]"
set-environment -g WD_COLOR_ARROW_MID "#[fg=${WD_COLOR_FONT_FG},bg=${WD_COLOR_BG},${ARROW_COLOR_CODES}]"
set-environment -g WD_COLOR_ARROW_RIGHT "#[fg=${WD_COLOR_BG},bg=${ST_BAR_COLOR_BG},${ARROW_COLOR_CODES}]"

set -g window-status-format "${WD_COLOR_ARROW_LEFT}${TMUX_STATUS_RIGHT_ARROW1} ${WD_COLOR_FONT}#I ${WD_COLOR_ARROW_MID}${TMUX_STATUS_RIGHT_ARROW2} ${WD_COLOR_FONT}#W #F ${WD_COLOR_ARROW_RIGHT}${TMUX_STATUS_RIGHT_ARROW1}"

# Current window
set-environment -g CUR_WD_COLOR_BG "cyan"
set-environment -g CUR_WD_COLOR_FONT_FG "black"
set-environment -g CUR_WD_COLOR_FONT "#[fg=${CUR_WD_COLOR_FONT_FG},bg=${CUR_WD_COLOR_BG}]"
set-environment -g CUR_WD_COLOR_ARROW_LEFT "#[fg=${ST_BAR_COLOR_BG},bg=${CUR_WD_COLOR_BG},${ARROW_COLOR_CODES}]"
set-environment -g CUR_WD_COLOR_ARROW_MID "#[fg=${CUR_WD_COLOR_FONT_FG},bg=${CUR_WD_COLOR_BG},${ARROW_COLOR_CODES}]"
set-environment -g CUR_WD_COLOR_ARROW_RIGHT "#[fg=${CUR_WD_COLOR_BG},bg=${ST_BAR_COLOR_BG},${ARROW_COLOR_CODES}]"

set -g window-status-current-format "${CUR_WD_COLOR_ARROW_LEFT}${TMUX_STATUS_RIGHT_ARROW1} ${CUR_WD_COLOR_FONT}#I ${CUR_WD_COLOR_ARROW_MID}${TMUX_STATUS_RIGHT_ARROW2} ${CUR_WD_COLOR_FONT}#W #F ${CUR_WD_COLOR_ARROW_RIGHT}${TMUX_STATUS_RIGHT_ARROW1}"
set -g window-status-separator ""

