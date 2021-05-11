if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi


section "bat"

title "Installation"
check_for_software bat

title "Configuration"

# On Ubuntu `bat` command is `batcat` because of a potential conflict
# Since I never had the conflict I don't bother checking and I create
# a symlink `bat` if it does not already exists
if ! [ -x "$(command -v bat)" ]; then
    ln -s "$(which batcat)" "$HOME/.local/bin/bat"

    echo "Alias ${GREEN}bat${STOP} created for ${BLUE}batcat${STOP}."
fi

symlink_conf_file "bat/config"
