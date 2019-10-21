prompt_docker_host() {
  if [[ ! -z "$DOCKER_MACHINE_NAME" ]]; then
    print -n " \xF0\x9F\x90\xB3 %{$fg[blue]%}$DOCKER_MACHINE_NAME%{$reset_color%}"
  elif [[ ! -z "$DOCKER_HOST" ]]; then
    print -n " \xF0\x9F\x90\xB3 %{$fg[blue]%}$DOCKER_HOST%{$reset_color%}"
  fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)%{$reset_color%}"
PROMPT='
%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
${ret_status} '
RPROMPT='$(prompt_docker_host)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# vim:ft=zsh ts=2 sw=2 sts=2
