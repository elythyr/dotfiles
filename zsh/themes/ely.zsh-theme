prompt_docker_host() {
  if [[ ! -z "$DOCKER_MACHINE_NAME" ]]; then
    print -n " \xF0\x9F\x90\xB3 %{$fg[blue]%}$DOCKER_MACHINE_NAME%{$reset_color%}"
  elif [[ ! -z "$DOCKER_HOST" ]]; then
    print -n " \xF0\x9F\x90\xB3 %{$fg[blue]%}$DOCKER_HOST%{$reset_color%}"
  fi
}

# Vim mode indicator
MODE_INDICATOR_VIINS=''
MODE_INDICATOR_VICMD='%F{10}❮%F{2}NORMAL❮%f'
MODE_INDICATOR_REPLACE='%F{9}❮%F{1}REPLACE❮%f'
MODE_INDICATOR_SEARCH='%F{13}❮%F{5}SEARCH❮%f'
MODE_INDICATOR_VISUAL='%F{12}❮%F{4}VISUAL❮%f'
MODE_INDICATOR_VLINE='%F{12}❮%F{4}V-LINE❮%f'

# RET_SYMBOL="➜"
RET_SYMBOL="❯"

local ret_status="%(?:%{$fg_bold[green]%}$RET_SYMBOL:%{$fg_bold[red]%}$RET_SYMBOL)%{$reset_color%}"
PROMPT='
%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
${ret_status} '
RPROMPT='$(prompt_docker_host) $(vi_mode_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# vim:ft=zsh ts=2 sw=2 sts=2
