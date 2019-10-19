# Greatly inspired from https://github.com/Parth/dotfiles/blob/master/deploy

SCRIPT_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
DOTFILES=$( dirname "$SCRIPT_DIR" )

. "$SCRIPT_DIR/lib.sh"

echo "We're going to do the following:"
echo "1. Check to make sure you have zsh, vim, and tmux installed"
echo "2. We'll help you install them if you don't"
echo "3. We're going to check to see if your default shell is zsh"
echo "4. We'll try to change it if it's not"

answer=$( ask_for_yes_or_no "Let's get started?" )

if echo "$answer" | grep -iq "^y" ;then
    echo
else
    echo "Quitting, nothing was changed."
    exit 0
fi


check_for_software zsh
echo
check_for_software tmux
echo
check_default_shell
echo

create_conf_file "source '$DOTFILES/zsh/zshrc'" ~/.zshrc

create_conf_file "source-file $DOTFILES/tmux/tmux.conf" ~/.tmux.conf

for script in $SCRIPT_DIR/.deploy_scripts/*; do
    . "$script"
    echo
done

# Initialize the theme if there is none already
if ! [ -f ~/.base16_theme ]; then
    base16_tomorrow-night
fi

check_install_fzf

echo
echo "Please log out and log back in for default shell to be initialized."
