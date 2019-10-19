if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

check_default_shell() {
    if [ -z "${SHELL##*zsh*}" ] ;then
        echo "Zsh is already the default shell."

        return 0
    fi

    answer=$( ask_for_yes_or_no "Default shell is not Zsh, do you want to make it your default shell?" )

    if echo "$answer" | grep -iq "^y" ;then
        chsh -s $(which zsh)

        echo "Zsh is now your default shell, logout and log back in to apply this modification."
    else
        echo "Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
    fi
}

section "Z shell"

title "Installation"
check_for_software zsh

title "Configuration"
create_conf_file "source '$DOTFILES/zsh/zshrc'" ~/.zshrc

title "Define as default"
check_default_shell
