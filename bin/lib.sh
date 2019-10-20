DOTFILES="$(dirname $( cd "$( dirname "$0" )" ; pwd -P ))"

BOLD="\e[1m"
STOP="\e[0m"
BLUE="\e[34m"
GREEN="\e[32m"
GRAY="\e[90m"
RED="\e[31m"
YELLOW="\e[33m"

section() {
    text="$1"

    echo -n $BOLD
    echo -n $YELLOW
    echo "$text"
    echo "$text" | sed 's/./=/g'
    echo -n $STOP
}

title() {
    text="$1"
    level=${2:-1}

    if [ "$level" -eq 1 ]; then
        echo $GREEN
    elif [ "$level" -eq 2 ]; then
        echo $BLUE
    fi

    echo "$text"

    if [ "$level" -eq 1 ]; then
        echo "$text" | sed 's/./-/g'
    fi

    echo -n $STOP
}

ask_for_yes_or_no() {
    echo -n >&2 "$1 (y/n) "

    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg && echo >&2

    echo $answer
}

prompt_install() {
    answer=$( ask_for_yes_or_no "${GRAY}$1${STOP} is not installed. Would you like to install it?" )

    if echo "$answer" | grep -iq "^y" ;then
        # This could def use community support
        if [ -x "$(command -v apt-get)" ]; then
            echo "$1" | xargs sudo apt-get install -y
        elif [ -x "$(command -v brew)" ]; then
            brew install $1
        elif [ -x "$(command -v pkg)" ]; then
            sudo pkg install $1
        elif [ -x "$(command -v pacman)" ]; then
            sudo pacman -S $1
        else
            echo "${RED}${BOLD}Package manager not recognized!${STOP}"
            exit 1
        fi

        echo "${GRAY}$1${STOP} was properly installed."
    fi
}

check_for_software() {
    if ! [ -x "$(command -v $1)" ]; then
        prompt_install "${2:-$1}"
    else
        echo "${GRAY}$1${STOP} is already installed."
    fi
}

backup_conf_file() {
    if ! ls "$1" >/dev/null 2>&1; then
        return 0
    fi

    echo
    answer=$( ask_for_yes_or_no "Would you like to backup it first?" )

    if echo "$answer" | grep -iq "^y" ;then
        backup=$(mktemp "$1.XXXX")
        mv "$1" "$backup"

        echo "Backed up as $GRAY$backup$STOP"
    else
        echo "Not backed up."
    fi
}

do_create_conf_file() {
    if ! ls "$( dirname "$2" )" >/dev/null 2>&1; then
        mkdir -p "$( dirname "$2" )"
    fi

    echo "$1" > "$2"

    echo "File $GRAY$2$STOP created."
}

create_conf_file() {
    if ! ls "$2" >/dev/null 2>&1; then
        do_create_conf_file "$1" "$2"

        return 0
    fi

    answer=$( ask_for_yes_or_no "The file $GRAY$2$STOP already exists, do you want to overwrite it ?" )
    if ! echo "$answer" | grep -iq "^y" ;then
        echo "Add the following content to $GRAY$2$STOP:"
        echo -n $BLUE
        echo "$1"
        echo -n $STOP

        return 0
    fi

    backup_conf_file "$2"
    do_create_conf_file "$1" "$2"
}
