# Load private settings if we have one.
if [ -f $HOME/.bashrc.private ]; then
    source $HOME/.bashrc.private
fi

# Turn off bell.
bind 'set bell-style none'
