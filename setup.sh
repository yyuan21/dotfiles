#!/usr/bin/env bash

MISC_FOLDER=~/.emacs.d/misc/

ZSHRC=~/.zshrc
OMZ_DIR=~/.oh-my-zsh/
OMZ_THEME_DIR=$OMZ_DIR/themes/

THEME_FILE=emacsy.zsh-theme

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

THEME_PATH="$MISC_FOLDER/$THEME_FILE"
cp "$THEME_PATH" "$OMZ_THEME_DIR"

if [ -f "$OMZ_THEME_DIR/$THEME_FILE" ]; then
    # check if we successfully copied the theme file
    echo "emacsy zsh theme installed!"
fi

# set the theme in zshrc to "emacsy"
sed -i.origin 's/ZSH_THEME=\".*\"/ZSH_THEME=\"emacsy\"/' "$ZSHRC"

########## allow zsh to output PWD to emacs ##########
# the string to check if the code snippet has already
# been injected into .zshrc
GREP_STR="# ZSH_EMACS_PWD"

# the comment of the snippet
EMACS_PWD_CMT="# allow zsh to output PWD to emacs"

# the code snippet that allows zsh to output PWD
EMACS_PWD_CODE='if [ -n "$INSIDE_EMACS" ]; then
    chpwd() {
        print -P "\032/$(pwd)"
    }
fi'

if ! grep -q "$GREP_STR" "$ZSHRC"; then
    # if the code snippnet is not found, inject it
    echo "Configuring zshrc to output PWD to emacs"
    echo "" >> "$ZSHRC"
    echo "$GREP_STR" >> "$ZSHRC"
    echo "$EMACS_PWD_CMT" >> "$ZSHRC"
    echo "$EMACS_PWD_CODE" >> "$ZSHRC"
    echo "" >> "$ZSHRC"
    echo "Done"
else
    # the code snippet exists
    echo "zshrc already contains the required code"
fi
