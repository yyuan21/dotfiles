#!/usr/bin/env bash 

ZSHRC_PATH=~/.zshrc

EMACS_PWD_CMT="# allow zsh to output PWD to emacs"

EMACS_PWD_CODE='if [ -n "$INSIDE_EMACS" ]; then
    chpwd() {
        print -P "\032/$(pwd)"
    }
fi'

echo "" >> $ZSHRC_PATH
echo "$EMACS_PWD_CMT" >> $ZSHRC_PATH
echo "$EMACS_PWD_CODE" >> $ZSHRC_PATH
echo "" >> $ZSHRC_PATH
