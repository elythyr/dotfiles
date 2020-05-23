# Load shortcuts to use git with fzf

function source_file_if_exist() {
    [ -f "$1" ] && source $1
}

fzf_path="/usr/share/fzf"
if [ -d $fzf_path ]; then
elif [ -d "$DOTFILES/fzf/shell" ]; then
    fzf_path="$DOTFILES/fzf/shell"
    # Avoid duplication when re-sourcing
    typeset -U PATH
    export PATH="$PATH:$DOTFILES/fzf/bin"
fi

source_file_if_exist "$fzf_path/completion.zsh"
source_file_if_exist "$fzf_path/key-bindings.zsh"
source_file_if_exist "$DOTFILES/fzf-git/functions.sh"
source_file_if_exist "$DOTFILES/fzf-git/key-binding.zsh"

unset fzf_path
unset -f source_file_if_exist
