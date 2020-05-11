# That's the right place to put environment variables
# They will be loaded in every cases and therefore always available

# Locale
export LANG="fr_FR.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

# Config files
export ZSHRC="$HOME/.zshrc"
export VIMRC="$HOME/.config/nvim/init.vim"
export TMUXRC="$HOME/.tmux.conf"

# Paths
export COMPOSER_HOME="$HOME/.config/composer"
export COMPOSER_BIN="$COMPOSER_HOME/vendor/bin"

# Defautl programs
export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="qutebrowser"

# This prevent to add the same path multiple time. Overtherwise each time a new
# zsh is started the paths added here would be duplicated.
typeset -U PATH
export PATH="$PATH:$HOME/.local/bin:$COMPOSER_BIN"
