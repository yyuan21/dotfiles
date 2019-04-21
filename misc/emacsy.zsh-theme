#################### emacsy theme ####################

# A zsh theme designed specifically for emacs

#################### color settings ####################

# prompt-related colors
PROMPT_FIRST_LINE_COLOR=$FG[237]
PROMPT_CWD_COLOR=$FG[068]
PROMPT_VENV_COLOR=$FG[085]
PROMPT_CMD_SIGN=$FG[220]	# color of >>

# git related colors
GIT_PROMPT_SIGN_COLOR=$FG[075]
GIT_BRANCH_NAME_COLOR=$FG[078]
GIT_COUNT_NUM_COLOR=$FG[202]

#################### component fuctions ####################

function prompt_first_line() {
    echo "%{$PROMPT_FIRST_LINE_COLOR%}\
------------------------------ \
%n@%m  \
------------------------------\
%{$reset_color%}"
}

# generate the path text (the path string is collapsed to be shorter)
function _emacsy_collapsed_wd() {
    echo $(pwd | perl -pe '
    	 BEGIN {
	 binmode STDIN,  ":encoding(UTF-8)";
	 binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g')
}

# count the number of commits for the current branch
function _git_get_ahead_count() {
    echo $(command git log 2> /dev/null | grep '^commit' | wc -l | tr -d " ")
}

# prints the commit counts string
function git_ahead_count() {
    is_git_repo="$(git rev-parse --is-inside-work-tree 2> /dev/null)"
    # check if its a git repo
    if [ "$is_git_repo" ]; then
	echo "%{$GIT_PROMPT_SIGN_COLOR%}+%{$GIT_COUNT_NUM_COLOR%}$(_git_get_ahead_count)%{$GIT_PROMPT_SIGN_COLOR%})"
    else
	echo ""
    fi
}

#################### theme settings ####################

if [ $UID -eq 0 ]; then
    NCOLOR="red";
else
    NCOLOR="green";
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$(prompt_first_line)
%{$PROMPT_CWD_COLOR%}$(_emacsy_collapsed_wd) \
$(virtualenv_prompt_info)\
%{$PROMPT_CMD_SIGN%}%(!.#.ᐅ)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPROMPT='$(git_prompt_info)$(git_ahead_count)'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$GIT_PROMPT_SIGN_COLOR%}(%{$GIT_BRANCH_NAME_COLOR%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$GIT_COUNT_NUM_COLOR%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# virtualenv prefix and suffix
ZSH_THEME_VIRTUALENV_PREFIX="%{$PROMPT_VENV_COLOR%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%} "
