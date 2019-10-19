if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

section "Tmux"

title "Installation"
check_for_software tmux

title "Configuration"
create_conf_file "source-file $DOTFILES/tmux/tmux.conf" ~/.tmux.conf
