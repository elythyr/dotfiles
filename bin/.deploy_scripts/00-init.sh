if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

initialize_submodules() {
    if [ -d "${DOTFILES}/vim/pack" ]; then
        echo "The submodules are already initialized."

        return 0
    fi

    echo "Initialization of the submodules..."
    $(cd "$DOTFILES"; git submodule update --init --recursive)
}

section "Submodules"

title "Initialization"
initialize_submodules
