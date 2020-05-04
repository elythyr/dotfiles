# TODO should I move that to .zshrc instead ?
# I guess the idea was to keep .zshrc only to load oh-my-zsh
# but I added up some stuff in it since then and
# I'm not sure the separation still make sense
export COMPOSER_HOME=$HOME/.config/composer
export COMPOSER_BIN=$COMPOSER_HOME/vendor/bin
export EDITOR=nvim

export PICKLE_HOME=$HOME/.config/pickle
export PICKLE_BIN=$PICKLE_HOME/bin

export PATH=${COMPOSER_BIN}:${PICKLE_BIN}:${PATH}:
