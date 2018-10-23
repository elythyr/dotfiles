# up
function up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# Edit and rerun
function edit_and_run() {
    BUFFER="fc"
    zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run

# Enter
function enter_line() {
    zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
    BUFFER="sudo "$BUFFER
    zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo
