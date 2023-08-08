
# The `code` function opens the path in Visual Studio Code as a WSL.
function code() {
    local path="$1"

    if [[ -z "$path" ]]; then
        path="$HOME"
    elif [[ "$path" == "." ]]; then
        path=$(pwd)
    fi

    code.exe --remote wsl+Ubuntu "$path" &
}

# Enable oh-my-posh with json theme
eval "$(oh-my-posh init bash --config ~/powerlevel10k_rainbow.omp.json)"