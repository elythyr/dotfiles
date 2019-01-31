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

alias dc='docker-compose '
alias dcu='dc up -d'
alias dcd='dc down'

alias sf='bin/console'

alias prsync='rsync --delete -Cav --exclude=var/ --exclude=vendor/ --exclude=node_modules/'

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gs='git status -sb'
alias gp='git push'
alias gr='git pull -r'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias gl='git ll'
alias gla='git lola'

alias c='composer'
alias ct='composer test'
alias cs='composer cs'
alias csf='composer cs-fix'
alias composers='composer'

alias most_used_commands="history | awk '{a[\$2]++}END{for(i in a){print a[i] \"s \" i}}' | sort -rn | head -20"
