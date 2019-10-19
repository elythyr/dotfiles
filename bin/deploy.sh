# Greatly inspired from https://github.com/Parth/dotfiles/blob/master/deploy

SCRIPT_DIR="$( cd "$( dirname "$0" )" ; pwd -P )"

. "$SCRIPT_DIR/lib.sh"

for script in $SCRIPT_DIR/.deploy_scripts/*; do
    . "$script"
    echo
done
