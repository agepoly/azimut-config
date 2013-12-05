HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

autoload -Uz compinit
compinit

setopt appendhistory autocd extendedglob
setopt hist_ignore_all_dups hist_ignore_space
unsetopt beep notify
bindkey -v
autoload terminfo colors
colors
watch=all

## Completion
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:rm:*' ignore-line yes
# color for completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# menu for auto-completion
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Completion Menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
# Cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache

### Bind keys
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
# Delete
bindkey '^[[3~' delete-char
# PageUp/PageDown and Home/End
bindkey '^[[5~' history-search-backward
bindkey '^[[6~' history-search-forward
bindkey '^[[7~' beginning-of-line
bindkey '^[[4~' end-of-line
# GNU Screen !?!
bindkey '^[[1~' beginning-of-line
bindkey '^[[8~' end-of-line

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
case $TERM in (xterm*)
        bindkey '\eOH' beginning-of-line
        bindkey '\eOF' end-of-line
esac

alias ls='ls --color=auto'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias vi=vim

for f in /etc/DIR_COLORS ${HOME}/.dir_colors; do
    [ -f "$f" ] && eval `dircolors -b "$f"`
done

alias grep="grep --color=auto"

setopt transient_rprompt
RPS1="  %{$fg[blue]%}%D{%d/%m/%y %H:%M:%S}%{$terminfo[sgr0]%}"

PS2="%{$fg[cyan]%}%_>%{$terminfo[sgr0]%} "
PS3="%{$fg[cyan]%}?#%{$terminfo[sgr0]%} "

local nocolor="%{$terminfo[sgr0]%}"
local green="%{$nocolor$fg[green]%}"
local red="%{$nocolor$fg[red]%}"
local blue="%{$nocolor$fg[blue]%}"
local cyan="%{$nocolor$fg[cyan]%}"
local darkgreen="%{$nocolor$fg[green]%}"
local darkred="%{$nocolor$fg[red]%}"
local darkblue="%{$nocolor$fg[blue]%}"
local darkcyan="%{$nocolor$fg[cyan]%}"
local magenta="%{$nocolor$fg[magenta]%}"
PS1="${darkred}%n${nocolor}@${green}%m${nocolor}:${magenta}%~${nocolor}%#${nocolor} "

export EDITOR=vim

tmpHost=`hostname`
echo -ne "\033]0;AGEPoly - ${tmpHost}\007"

