if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

check_install_fzf() {
    fzf_dir="$DOTFILES/fzf"

    if ! [ -x "$(command -v fzf)" ]; then
        answer=$( ask_for_yes_or_no "fzf is not installed, would you like to install it?" )

        if echo "$answer" | grep -iq "^y" ;then
            # $fzf_dir/install --all --no-bash --no-fish --64
            $fzf_dir/install
        fi
    else
        echo "fzf is already installed."
    fi
}

section "Fzf"

title "Installation"
check_install_fzf
