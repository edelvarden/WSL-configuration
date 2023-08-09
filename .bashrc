
# The `code` function opens the path in Visual Studio Code as a WSL.
# Also add Terminal Shell Integration | https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
function code() {
    local path="$1"

    if [[ -z "$path" ]]; then
        path="$HOME"
    elif [[ "$path" == "." ]]; then
        path=$(pwd)
    fi

    code.exe --locate-shell-integration-path bash --remote wsl+Ubuntu "$path" &
}

# Enable oh-my-posh with json theme
eval "$(oh-my-posh init bash --config ~/powerlevel10k_rainbow.omp.json)"

# Add support for Windows paths for the `cd` command, but paths must be in quotes
function cd() {
    if [[ "$1" =~ ^[A-Za-z]:\\ ]]; then
        wsl.exe --cd "$1"
    else
        pushd "$1" > /dev/null || cd $* 
    fi
}