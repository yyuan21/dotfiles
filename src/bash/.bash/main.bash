# Load private settings if we have one.
load_if_exists "$HOME/.bashrc.private"

# Publish our location.
export MY_BASH_DOT_BASE="$HOME/.bash"

# Turn off bell.
bind 'set bell-style none'

# Load lib functions
source "${MY_BASH_DOT_BASE}/lib/scm.bash"

# Load theme.
source "${MY_BASH_DOT_BASE}/theme.bash"

# Load aliases.
source "${MY_BASH_DOT_BASE}/aliases.bash"
