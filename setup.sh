#!/usr/bin/env bash

#################### General Info ####################

# This script sets up all the dotfiles
# all the work done here should be idempotent

#################### global settings ####################

source ./config/config.bash
source ./config/active.bash

#################### make symbolic links for dotfiles ####################

printf "${YELLOW}Making symbolic links for dot files...${NORMAL}\n"
for project in "${ACTIVE_LIST[@]}"; do
    printf "${BOLD}$project:${NORMAL}\n"
    project_path="$DOT_DIR/$project"
    dotfiles=$(find $project_path -maxdepth 1 ! -path $project_path -name ".*")
    for df in $dotfiles; do
	symbname=~/$(basename $df)
	ln -s $df $symbname
	printf "Symlink created: ${GREEN}%s${NORMAL} -> ${GREEN}%s${NORMAL}\n" "$symbname" "$df"
    done
done
printf "${YELLOW}...done${NORMAL}\n"

