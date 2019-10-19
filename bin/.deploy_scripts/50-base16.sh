if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

init_base16() {
    # To configure base16 without having to start a new shell
    BASE16_SHELL="$HOME/.dotfiles/base16/base16-shell"
    [ -n "$PS1" ] && \
        [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

    if ! [ -f ~/.base16_theme ]; then
        base16_tomorrow-night
    fi
}

section "Base16"

title "Initialization"
init_base16
