alias l='ls -C'
alias la='ll -A'
alias ll='ls --color=auto -lh'
alias ls='ls --color=auto'
alias lt='ll -tr'

alias gepr='grep'
alias gper='grep'
alias gpre='grep'

alias v='nvim'

alias m='make'

alias php-xedbug='XDEBUG_CONFIG="idekey=xdebug" php'

alias dc='docker-compose'
alias dcd='dc down'
alias dce='dc exec'
alias dcr='dc run'
alias dcu='dc up -d'
alias dk='docker'
alias dm='docker-machine'
alias dmleave='eval $(docker-machine env -u)'

alias sf='bin/console'

alias pgrep='grep --exclude-dir=vendor --exclude-dir=.git/ --exclude-dir=var/ --exclude-dir=node_modules/'
alias prsync='rsync --delete -Cav --exclude=var/ --exclude=vendor/ --exclude=node_modules/'

alias g='git'
alias gb='git branch'
alias gf='git fetch'
alias gfa='git fetch --all'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gck='git ck'
alias gtb='git checkout -tb'
alias gd='git df'
alias gds='git dfs'
alias gdt='git difftool -w --no-prompt'
alias gdts='git difftool -w --staged --no-prompt'
alias gl="git l"
alias gla="git la"
alias gls='git ls-files'
alias gmt='git mt --no-prompt'
alias gp='git pull'
alias gpr='git pr'
alias gr='git rebase'
alias gri='git rebase -i'
alias gs='git st'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash push' # Alias for the old git stash save, so that gsp is git stash pop
alias gpu='git publish'

alias c='composer'
alias cc='composer check'
alias composers='composer'
alias cs='composer cs'
alias csf='composer cs-fix'
alias ct='composer test'

alias most_used_commands="history | awk '{a[\$2]++}END{for(i in a){print a[i] \"s \" i}}' | sort -rn | head -20"
