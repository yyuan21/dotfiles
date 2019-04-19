########## ZSH_EMACS_PWD ##########
# allow zsh to output PWD to emacs
if [ -n "$INSIDE_EMACS" ]; then
    chpwd() {
        print -P "\033AnSiTc %d"
    }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi
########## ZSH_EMACS_PWD ##########
