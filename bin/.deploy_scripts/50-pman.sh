if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

section "pman"

check_install_pman() {
    if ! [ -x "$(command -v pman)" ]; then
        answer=$( ask_for_yes_or_no "pman is not installed, would you like to install it?" )

        if echo "$answer" | grep -iq "^y" ;then
            sudo pear install doc.php.net/pman
        fi
    else
        echo "pman is already installed, nothing to do."
    fi
}

title "Installation"
check_install_pman
