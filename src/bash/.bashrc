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

# LLVM settings
if [[ -d "/opt/homebrew/opt/llvm" ]]; then
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
    export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"
fi
