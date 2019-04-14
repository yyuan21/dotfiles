#!/usr/bin/env bash

#################### General Info ####################

# This script sets up all the dotfiles
# all the work done here should be idempotent
# libraries and frameworks are not saved in this repo. Instead
# they are checked and installed via this script.

# 1. all the original dotfiles should be backed up
# 2. remove old symbolic links
# 3. link all the config dotfiles again to the home directory

#################### include variables ####################

source config.sh

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
    dotfiles=$(find "$HOME" -maxdepth 1 ! -path "$OMZ_DIR" -name "*$dotname*")
    for df in $dotfiles; do
	printf "Moving ${GREEN}%s${NORMAL} to ${GREEN}%s${NORMAL}\n" "$df" "$DOT_BACKUP"
	mv $df $DOT_BACKUP
    done
done
printf "${YELLOW}...done${NORMAL}\n\n"

#################### dependencies detection ####################

if ! command -v zsh > /dev/null 2>&1; then
    printf "${RED}Zsh is not installed!${NORMAL}\n"
    exit 1
fi

if [ ! -d $OMZ_DIR ]; then
    printf "${RED}Oh-my-zsh is not installed${NORMAL}\n"
    exit 1
fi

#################### make symbolic links for dotfiles ####################

# create temp folder for holding temp files
mkdir -p $TEMP_FOLDER

# write all created symbolic links to a temp files
touch $SYMB_FILES

printf "${YELLOW}Making symbolic links for dot files...${NORMAL}\n"
for dotpath in $DOT_FOLDERS; do
    dotname=$(basename $dotpath)
    printf "${BOLD}%s:${NORMAL}\n" "$dotname"
    dotfiles=$(find $dotpath -maxdepth 1 ! -path $dotpath -name ".*")
    for df in $dotfiles; do
	symbname=~/$(basename $df)
	printf "Creating symbolic link: ${GREEN}%s${NORMAL}\n" "$symbname"
	ln -s $df $symbname
	echo $symbname >> $SYMB_FILES
    done
done
printf "${YELLOW}...done${NORMAL}\n"

echo ""

#################### other setup ####################

if [ -f $MISC_ZSH_THEME ]; then
    printf "${YELLOW}Setting up zsh theme (oh-my-zsh)${NORMAL}\n"
    cp $MISC_ZSH_THEME_SRC $MISC_ZSH_THEME_TAR
    printf "${YELLOW}...done${NORMAL}\n"
fi
