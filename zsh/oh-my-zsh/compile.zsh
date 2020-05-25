_custom_compile() {
    local compiled_file="${1}.zwc"

    if [[ -s "$1" && (! -s "$compiled_file" || "$1" -nt "$compiled_file") ]]; then
        zcompile "$1"
    fi
}

# Do this in the background
{
    # Compile the completion dump
    # After installing a new plugin providing completion you might need to delete
    # $ZSH_COMPDUMP file so that it will be updated next time zsh starts
    _custom_compile "${ZSH_COMPDUMP:-${ZDOTDIR:-$HOME}/.zcompdump}"

    # Compile my "real" zshrc
    _custom_compile "${HOME}/.zsh/interactive"
} &!

unset -f _custom_compile
