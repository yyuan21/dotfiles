#!/usr/bin/env bash 

########## allow zsh to output PWD to emacs ##########
# the string to check if the code snippet has already
# been injected into .zshrc
GREP_STR="# ZSH_EMACS_PWD"

# zshrc file path
ZSHRC_PATH=~/.zshrc

# the comment of the snippet
EMACS_PWD_CMT="# allow zsh to output PWD to emacs"

# the code snippet that allows zsh to output PWD
EMACS_PWD_CODE='if [ -n "$INSIDE_EMACS" ]; then
    chpwd() {
        print -P "\032/$(pwd)"
    }
fi'

if ! grep -q "$GREP_STR" "$ZSHRC_PATH"; then
    # if the code snippnet is not found, inject it
    echo "Configuring zshrc to output PWD to emacs"
    echo "" >> $ZSHRC_PATH
    echo "$GREP_STR" >> $ZSHRC_PATH
    echo "$EMACS_PWD_CMT" >> $ZSHRC_PATH
    echo "$EMACS_PWD_CODE" >> $ZSHRC_PATH
    echo "" >> $ZSHRC_PATH
    echo "Done"
else
    # the code snippet exists
    echo "zshrc already contains the required code"
fi
