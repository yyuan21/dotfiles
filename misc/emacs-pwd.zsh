########## ZSH_EMACS_PWD ##########
# allow zsh to output PWD to emacs
if [ -n "$INSIDE_EMACS" ]; then
    chpwd() {
        print -P "\032/$(pwd)"
    }
fi
########## ZSH_EMACS_PWD ##########
