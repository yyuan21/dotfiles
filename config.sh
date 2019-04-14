#################### variables ####################

# color codes setup
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

# home directory
HOME=~

# The dotfiles project folder
DOT_DIR=~/dotfiles

# The folder contains the original dotfiles
DOT_BACKUP=~/dotfiles_backup

# all the project folders we need to setup
DOT_FOLDERS=$(find "$DOT_DIR" ! -path "$DOT_DIR" ! -path "$DOT_DIR/.*" -maxdepth 1 -type d)

# oh-my-zsh folder
OMZ_DIR=~/.oh-my-zsh

# temp file folder
TEMP_FOLDER=~/dotfiles/.temp

# temp files for holding created symblinks
SYMB_FILES=~/dotfiles/.temp/created_symblinks.txt
