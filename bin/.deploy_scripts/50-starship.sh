if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

install_starship() {
    echo "Fetching last version of ${GRAY}Starship${STOP}..."

    URL=`curl -s https://api.github.com/repos/starship/starship/releases/latest | grep 'browser_download_url.*starship.*gnu\.tar\.gz' | cut -d: -f2,3 | tr -d \"\ `
    DEST_FILE="/tmp/starship/$(basename "$URL")"
    DEST_DIR="$(dirname "$DEST_FILE")"

    echo "Downloading ${GRAY}Starship${STOP}:"
    mkdir -p "$DEST_DIR"
    wget -q --show-progress --progress=bar:force -P "$DEST_DIR" "$URL"
    $(cd "$DEST_DIR"; tar xvf "$DEST_FILE")

    echo "Installing ${GRAY}Starship${STOP}:"
    sudo cp "$DEST_DIR/starship" "/usr/local/bin"

    echo "${GRAY}Starship${STOP} is now installed."
    rm -fr "$DEST_DIR"
}

check_install_starship() {
    if ! [ -x "$(command -v starship)" ]; then
        answer=$( ask_for_yes_or_no "${GRAY}Starship${STOP} is not installed, would you like to install it?" )

        if echo "$answer" | grep -iq "^y" ;then
            install_starship
        fi
    else
        echo "${GRAY}Starship${STOP} is already installed, nothing to do."
    fi
}

check_install_powerline_fonts() {
    FONT_FILE="/usr/share/fonts/opentype/PowerlineSymbols.otf"

    if ! [ -f "$FONT_FILE" ]; then
        prompt_install fonts-powerline
    else
        echo "${GRAY}Powerline Fonts${STOP} are already installed."
    fi
}

configure_starship() {
    if grep 'eval "$(starship init zsh)"' "$HOME/.zshrc" >/dev/null 2>&1; then
        echo "${GRAY}Starship is already configured.${STOP}"

        return 0
    fi

    echo 'eval "$(starship init zsh)"' | tee --append "$HOME/.zshrc" >/dev/null

    echo "${GRAY}Starship is now configured, execute the following command to take the changes into account:${STOP}"
    echo -n ${BLUE}
    echo '. ~/.zshrc'
    echo -n ${STOP}
}

section "Starship"

title "Installation"

title "Powerline Font" 2
check_install_powerline_fonts

title "Starship" 2
check_install_starship

title "Configuration" 2
configure_starship
