# Load from main source.

function load_if_exists() {
    local TOLOAD=$1
    if [[ -f "$TOLOAD" ]]; then
        source "$TOLOAD"
    fi
}

# Load main configuration.
load_if_exists "$HOME/.bash/main.bash"

# Load Rust cargo env.
load_if_exists "$HOME/.cargo/env"
