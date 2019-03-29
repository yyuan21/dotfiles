#!/usr/bin/env bash

# the folder that contains the code snippets
MISC_FOLDER=~/.emacs.d/misc/

# zsh related file and folders
ZSHRC=~/.zshrc
OMZ_DIR=~/.oh-my-zsh/
OMZ_THEME_DIR=$OMZ_DIR/themes/

# the theme file configured for the zsh
THEME_FILE=emacsy.zsh
THEME_FILE_DEST=emacsy.zsh-theme

########## setup zsh theme for emacs ##########

# check ~/.zshrc
if [ ! -f "$ZSHRC" ]; then
    echo "zshrc not found!"
    exit 1
fi

# oh my zsh / themes not installed
if [ ! -d "$OMZ_DIR" ] || [ ! -d "$OMZ_THEME_DIR" ]; then
    echo "Make sure oh-my-zsh is correctly installed!"
    exit 1
fi

# copy the theme to the oh-my-zsh themes folder
THEME_PATH="$MISC_FOLDER/$THEME_FILE"
cp "$THEME_PATH" "$OMZ_THEME_DIR/$THEME_FILE_DEST"

# check if we successfully copied the theme file
if [ -f "$OMZ_THEME_DIR/$THEME_FILE_DEST" ]; then
    echo "emacsy zsh theme installed!"
fi

# set the theme in zshrc to "emacsy"
sed -i.origin 's/ZSH_THEME=\".*\"/ZSH_THEME=\"emacsy\"/' "$ZSHRC"

########## allow zsh to output PWD to emacs ##########
ZSH_EMACS_PWD_CODE=~/.emacs.d/misc/emacs-pwd.zsh

# the string to check if the code snippet has already
# been injected into .zshrc
GREP_STR="# ZSH_EMACS_PWD"

if ! grep -q "$GREP_STR" "$ZSHRC"; then
    # if the code snippnet is not found, inject it
    echo "Configuring zshrc to output PWD to emacs"
    echo "" >> "$ZSHRC"
    cat "$ZSH_EMACS_PWD_CODE" >> "$ZSHRC"
    echo "" >> "$ZSHRC"
else
    # the code snippet exists
    echo "zshrc already contains the required code"
fi
