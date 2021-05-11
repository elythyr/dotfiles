if ! type 'prompt_install' >/dev/null 2>&1; then
    THIS_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"
    . "$THIS_DIR/../lib.sh"
fi

section "Alacritty"

title "Installation"

title "Repository" 2
check_for_repository "aslatter/ppa"

title "Alacritty" 2
check_for_software alacritty

title "Configuration"
symlink_conf_file "alacritty/alacritty.yml"
