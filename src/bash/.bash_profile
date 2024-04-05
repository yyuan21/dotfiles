# .bash_profile: executed for login shell.
# .bashrc: executed for interactive non-login shell.
# On OS X, terminals runs a login shell everytime even though the user is
# already logged in.

# Source the settings.
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
