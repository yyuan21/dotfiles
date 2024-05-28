# Load from main source.

function load_if_exists() {
    local PATH=$1
    if [ -f $PATH ]; then
        source "$PATH"
    fi
}

# Load main configuration.
load_if_exists "$HOME/.bash/main.bash"

# Load Rust cargo env.
load_if_exists "$HOME/.cargo/env"
