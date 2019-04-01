ask_for_yes_or_no() {
    echo -n >&2 "$1 (y/n) "

    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg && echo >&2

    echo $answer
}

prompt_install() {
    answer=$( ask_for_yes_or_no "$1 is not installed. Would you like to install it?" )

    if echo "$answer" | grep -iq "^y" ;then
        # This could def use community support
        if [ -x "$(command -v apt-get)" ]; then
            echo "sudo apt-get install $1 -y"
            echo "$1" | xargs sudo apt-get install -y

        elif [ -x "$(command -v brew)" ]; then
            brew install $1

        elif [ -x "$(command -v pkg)" ]; then
            sudo pkg install $1

        elif [ -x "$(command -v pacman)" ]; then
            sudo pacman -S $1

        else
            echo "I'm not sure what your package manager is! Please install $1 on your own and run this deploy script again. Tests for package managers are in the deploy script you just ran starting at line 13. Feel free to make a pull request at https://github.com/parth/dotfiles :)"
        fi
    fi
}

check_for_software() {
    echo "Checking to see if $1 is installed"
    if ! [ -x "$(command -v $1)" ]; then
        prompt_install "${2:-$1}"
    else
        echo "$1 is installed."
    fi
}

check_default_shell() {
    if [ -z "${SHELL##*zsh*}" ] ;then
        echo "Default shell is zsh."
    else
        answer=$( ask_for_yes_or_no "Default shell is not zsh. Do you want to chsh -s \$(which zsh)?" )

        if echo "$answer" | grep -iq "^y" ;then
            chsh -s $(which zsh)
        else
            echo "Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
        fi
    fi
}

check_install_fzf() {
    fzf_dir="$DOTFILES/fzf"

    echo "Checking to see if fzf is installed"
    if ! [ -x "$(command -v fzf)" ]; then
        answer=$( ask_for_yes_or_no "fzf is not installed. Would you like to install it?" )

        if echo "$answer" | grep -iq "^y" ;then
            if [ -d "$fzf_dir" ]; then
                # $fzf_dir/install --all --no-bash --no-fish --64
                $fzf_dir/install
            else
                echo "Warning: $fzf_dir does not exist, install all submodules first and then deploy."
            fi
        fi
    else
        echo "fzf is installed."
    fi
}

backup_conf_file() {
    if ! ls "$1" >/dev/null 2>&1; then
        return 0
    fi

    echo
    answer=$( ask_for_yes_or_no "Would you like to backup $1 ?" )

    if echo "$answer" | grep -iq "^y" ;then
        mv -i "$1" "$1.previous-dotfiles-deployement"
    else
        echo "\nNot backing up $1."
    fi
}

do_create_conf_file() {
    if ! ls "$( dirname "$2" )" >/dev/null 2>&1; then
        mkdir -p "$( dirname "$2" )"
    fi

    printf "$1" > "$2"

    echo
}

create_conf_file() {
    if ! ls "$2" >/dev/null 2>&1; then
        do_create_conf_file "$1" "$2"

        return 0
    fi

    backup_conf_file $2
    echo

    answer=$( ask_for_yes_or_no "The file '$2' already exists, do you want to overwrite it ?" )
    if echo "$answer" | grep -iq "^y" ;then
        do_create_conf_file "$1" "$2"
    else
        echo "Add the following line to '$2':\n$1\n"
    fi
}
