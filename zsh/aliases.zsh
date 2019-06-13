alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias la='ll -A'
alias lt='ll -tr'
alias l='ls -C'

alias gepr='grep'
alias gper='grep'
alias gpre='grep'

alias v='nvim'

alias php-xedbug='XDEBUG_CONFIG="idekey=xdebug" php'

alias dk='docker'
alias dc='docker-compose'
alias dcu='dc up -d'
alias dcd='dc down'
alias dcr='dc run'
alias dce='dc exec'
alias dm='docker-machine'
alias dmleave='eval $(docker-machine env -u)'

alias sf='bin/console'

alias prsync='rsync --delete -Cav --exclude=var/ --exclude=vendor/ --exclude=node_modules/'
alias pgrep='grep --exclude-dir=vendor --exclude-dir=.git/ --exclude-dir=var/ --exclude-dir=node_modules/'

alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gs='git status -sb'
alias gp='git pull'
alias gpr='git pull -r'
alias gr='git rebase'
alias gri='git rebase -i'
alias grb='git rebase -i $(git merge-base master HEAD)'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias gl='git ll'
alias gla='git lola'
alias gss='git stash push' # Alias for the old git stash save, so that gsp is git stash pop
alias gsp='git stash pop'
alias gsl='git stash list'
alias gck='git checkout'

alias c='composer'
alias ct='composer test'
alias cs='composer cs'
alias csf='composer cs-fix'
alias cc='composer check'
alias composers='composer'

alias most_used_commands="history | awk '{a[\$2]++}END{for(i in a){print a[i] \"s \" i}}' | sort -rn | head -20"
