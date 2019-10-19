if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

# I'm not sure my NeoVim configuration is sill working with vim 8 anymore
# I'll assume not and not even bother installing it for now

NVIMDIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
NVIMRC="$NVIMDIR/init.vim"

check_for_nvim_repository() {
    echo "Checking to see if neovim repository is in you system"

    if ! grep -rq neovim /etc/apt/; then
        answer=$( ask_for_yes_or_no "The repository for neovim is not on your system, add it ?" )

        if echo "$answer" | grep -iq "^y"; then
            echo "sudo apt-add-repository ppa:neovim-ppa/stable"
            sudo apt-add-repository ppa:neovim-ppa/stable -y
            sudo apt-get update
        fi
    else
        echo "The repository is already in your system"
    fi
}

prompt_install_python_module() {
    answer=$( ask_for_yes_or_no "$1 module is not installed. Would you like to install it?" )

    if echo "$answer" | grep -iq "^y" ;then
        echo "sudo -H pip${2:-} install --upgrade $1"
        sudo -H pip${2:-} install --upgrade $1
    fi
}

check_for_python_module() {
    echo "Checking to see if the python module $1 is installed"

    if ! pip${2:-} show -qqq "$1"; then
        prompt_install_python_module $1 ${2:-}
    else
        echo "$1 is installed."
    fi
}

check_for_nvim_repository
echo

check_for_software nvim neovim
echo

check_for_software pip "python-dev python-pip"
echo

check_for_software pip3 "python3-dev python3-pip"
echo

check_for_python_module neovim
echo

check_for_python_module neovim 3
echo

create_conf_file "source $DOTFILES/vim/vimrc" "$NVIMRC"
