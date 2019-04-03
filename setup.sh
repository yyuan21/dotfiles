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

# home directory
HOME=~

# The dotfiles project folder
DOT_DIR=~/dotfiles

# The folder contains the original dotfiles
DOT_BACKUP=~/dotfiles_backup

# all the project folders we need to setup
DOT_FOLDERS=$(find "$DOT_DIR" ! -path "$DOT_DIR" ! -path "$DOT_DIR/.*" -maxdepth 1 -type d)

#################### back up ####################

# only back up the files that have compatibility issues
# should also have 'unsetup' script to restore all files in the backup folder
# to exactly where they came from

# create folder for holding backup files
echo "Moving old dotfiles to backup folder"
mkdir -p $DOT_BACKUP

for dotpath in $DOT_FOLDERS; do
    dotname=$(basename $dotpath)
    dotfiles=$(find "$HOME" -maxdepth 1 -name "*$dotname*")
    for df in $dotfiles; do
	printf "Moving %s to %s\n" "$df" "$DOT_BACKUP"
	mv $df $DOT_BACKUP
    done
done
echo "...done"

