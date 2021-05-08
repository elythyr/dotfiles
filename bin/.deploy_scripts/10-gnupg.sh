if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

section "GnuPG"

title "Installation"
check_for_software gpg1 gnupg
check_for_software gpg2 gnupg2

title "Configuration"
copy_conf_file "$DOTFILES/gnupg/gpg.conf" ~/.gnupg/gpg.conf
