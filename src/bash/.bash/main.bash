# Load private settings if we have one.
if [ -f $HOME/.bashrc.private ]; then
    source $HOME/.bashrc.private
fi

# Publish our location.
export MY_BASH_DOT_BASE="$PWD"

# Turn off bell.
bind 'set bell-style none'

# Load lib functions
source "${MY_BASH_DOT_BASE}/lib/scm.bash"

# Load theme.
source "${MY_BASH_DOT_BASE}/theme.bash"
