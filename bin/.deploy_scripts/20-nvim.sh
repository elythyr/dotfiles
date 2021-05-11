if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

# I'm not sure if my NeoVim configuration is sill working with vim 8 anymore
# I'll assume not and not even bother installing it for now

NVIMDIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
NVIMRC="$NVIMDIR/init.vim"

check_for_nvim_repository() {
    if ! grep -rq neovim /etc/apt/; then
        answer=$( ask_for_yes_or_no "The repository for neovim is not on your system, add it?" )

        if echo "$answer" | grep -iq "^y"; then
            answer=$( ask_for_yes_or_no "Do you want to use the latest version (unstable) ?" )
            if echo "$answer" | grep -iq "^y"; then
                sudo apt-add-repository ppa:neovim-ppa/unstable -y
            else
                sudo apt-add-repository ppa:neovim-ppa/stable -y
            fi

            sudo apt-get update

            echo "The repository was properly added."
        fi
    else
        echo "The repository is already in your system."
    fi
}

prompt_install_python_module() {
    answer=$( ask_for_yes_or_no "The module is not installed, would you like to install it?" )

    if echo "$answer" | grep -iq "^y" ;then
        python${2:-} -m pip install --user --upgrade neovim

        echo "The module was properly installed."
    fi
}

check_for_python_module() {
    if ! pip${2:-} show -qqq "$1"; then
        prompt_install_python_module $1 ${2:-}
    else
        echo "The module is already installed."
    fi
}

section "Neovim"

title "Installation"

title "Repository" 2
check_for_nvim_repository

title "Neovim" 2
check_for_software nvim neovim

title "PIP" 2
check_for_software pip "python-dev python-pip"

title "PIP3" 2
check_for_software pip3 "python3-dev python3-pip"

title "Python module" 2
check_for_python_module neovim 2

title "Python3 module" 2
check_for_python_module neovim 3

title "Configuration"
create_conf_file "source $DOTFILES/vim/vimrc" "$NVIMRC"
