# time color coding and return code taken from the dieter theme
# requires powerline for branch icon

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

PROMPT='${time} %{$reset_color%}%{${fg[blue]}%}${PWD/#$HOME/~} %{$reset_color%}$(git_prompt_info)$(git_prompt_status) %{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}‹\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[magenta]%}›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time_disabled
		return_code=$return_code_disabled
	else
		time=$time_enabled
		return_code=$return_code_enabled
	fi
	zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
