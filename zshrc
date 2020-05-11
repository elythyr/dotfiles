# oh-my-zsh configuration
    # If you come from bash you might have to change your $PATH.
    # export PATH=$HOME/bin:/usr/local/bin:$PATH

    # Keep it for backward compatibility until I cleaned that up
    export DOTFILES="$HOME"
    # Path to your oh-my-zsh installation.
    export ZSH="$HOME/.oh-my-zsh"
    export ZSH_CUSTOM="$HOME/.zsh"

    # Set name of the theme to load
    ZSH_THEME="ely"

    # Uncomment the following line to use case-sensitive completion.
    # CASE_SENSITIVE="true"

    # Uncomment the following line to use hyphen-insensitive completion.
    # Case-sensitive completion must be off. _ and - will be interchangeable.
    # HYPHEN_INSENSITIVE="true"

    # Uncomment the following line to disable bi-weekly auto-update checks.
    DISABLE_AUTO_UPDATE="true"

    # Uncomment the following line to disable auto-setting terminal title.
    DISABLE_AUTO_TITLE="true"

    # Uncomment the following line to enable command auto-correction.
    # ENABLE_CORRECTION="true"

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

    # Change the format of the execution time for commands
    TIMER_FORMAT='[%d]'

    # Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
    # much, much faster.
    # DISABLE_UNTRACKED_FILES_DIRTY="true"

    # Which plugins would you like to load?
    # Standard plugins can be found in ~/.oh-my-zsh/plugins/*
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.
    plugins=(
      colored-man-pages
      command-not-found
      zsh-autosuggestions
      zsh-syntax-highlighting
      # Needs to be after zsh-syntax-highlighting otherwise it broke the highlighting
      zsh-vim-mode
      timer
      pass
    )

source $ZSH/oh-my-zsh.sh

# User configuration

    # export MANPATH="/usr/local/man:$MANPATH"

    # You may need to manually set your language environment
    # export LANG=en_US.UTF-8

    # Compilation flags
    # export ARCHFLAGS="-arch x86_64"

    # ssh
    export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

    # Aliases and all other configurationss is stored under ZSH_CUSTOM.*.zsh
    # and will be autoloaded by oh-my-zsh

    # For vim mappings:
    # Commented until I try it
    # stty -ixon

    ## For base16-shell
    ## Uncomment while migrating toward a bare repo
    ## Not sure I want to keep it, I like the idea of having the same theme in
    ## my terminal and vim without too much efforts
    ## But it looks to slow things down quit a bit on old machine
    # BASE16_SHELL="$HOME/.dotfiles/base16/base16-shell"
    # [ -n "$PS1" ] && \
    #     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    #         eval "$("$BASE16_SHELL/profile_helper.sh")"

    export MANPAGER="/bin/sh -c \"col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

    # Always work in a tmux session if tmux is installed
    if which tmux 2>&1 >/dev/null; then
       if [ -z ${TMUX+x} ]; then
        if tmux ls >/dev/null 2>&1; then
           tmux attach; exit
        else
           tmux new -s main; exit
        fi
       fi
    fi
