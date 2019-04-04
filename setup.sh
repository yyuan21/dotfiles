#!/usr/bin/env bash

#################### General Info ####################

# This script sets up all the dotfiles
# all the work done here should be idempotent
# libraries and frameworks are not saved in this repo. Instead
# they are checked and installed via this script.

# 1. all the original dotfiles should be backed up
# 2. remove old symbolic links
# 3. link all the config dotfiles again to the home directory

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

#################### back up ####################

# only back up the files that have compatibility issues
# should also have 'unsetup' script to restore all files in the backup folder
# to exactly where they came from

# create folder for holding backup files
printf "${YELLOW}Moving old dotfiles to backup folder...${NORMAL}\n"
mkdir -p $DOT_BACKUP

for dotpath in $DOT_FOLDERS; do
    dotname=$(basename $dotpath)
    printf "${BOLD}%s:${NORMAL}\n" "$dotname"
    dotfiles=$(find "$HOME" ! -path "$OMZ_DIR" -maxdepth 1 -name "*$dotname*")
    for df in $dotfiles; do
	printf "Moving ${GREEN}%s${NORMAL} to ${GREEN}%s${NORMAL}\n" "$df" "$DOT_BACKUP"
	mv $df $DOT_BACKUP
    done
done
printf "${YELLOW}...done${NORMAL}\n"

#################### dependencies detection ####################

if ! command -v zsh > /dev/null 2>&1; then
    printf "${RED}Zsh is not installed!${NORMAL}\n"
    exit 1
fi

if [ ! -d "$OMZ_DIR" ]; then
    printf "${RED}Oh-my-zsh is not installed${NORMAL}\n"
    exit 1
fi

