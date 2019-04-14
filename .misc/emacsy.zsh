# emacsy theme

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# collapsed path (like fish)
function _emacsy_collapsed_wd() {
    echo $(pwd | perl -pe '
    	 BEGIN {
	 binmode STDIN,  ":encoding(UTF-8)";
	 binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g')
}

# get the number of commits
function _git_get_ahead_count() {
    echo $(command git log 2> /dev/null | grep '^commit' | wc -l | tr -d " ")
}

# prints the commit counts string
function git_ahead_count() {
    is_git_repo="$(git rev-parse --is-inside-work-tree 2> /dev/null)"
    # check if its a git repo
    if [ "$is_git_repo" ]; then
	echo "$FG[075]+$my_orange$(_git_get_ahead_count)$FG[075])"
    else
	echo ""
    fi
}

if [ $UID -eq 0 ]; then
    NCOLOR="red";
else
    NCOLOR="green";
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$FG[032]$(_emacsy_collapsed_wd)\
$(git_prompt_info)$(git_ahead_count) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
    RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}%'
else
    RPROMPT='$my_gray%n@%m%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
