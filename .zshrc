# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/rishavc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -Uz colors && colors
PS1="%B%{$fg[blue]%}[%{$fg[green]%}%n%{$fg[cyan]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(5~|%-1~/… /%2~|%3~)%{$fg[blue]%}]%{$reset_color%}%b "

alias grep='grep --color' # Compatible with busybox, but doesn't do anything
alias ls='ls -F -C --color'
alias diff='diff --color' # Not compatible with busybox
alias mkdir='mkdir -p -v'
alias rmdir='rmdir -p --ignore-fail-on-non-empty'
alias ip='ip -h -c=always' # Not compatible with busybox
alias v='nvim'
alias pls='sudo'
alias lg='lazygit'

alias t-go='tmux attach -t'
alias t-kill='tmux kill-session'

export SHELL="/usr/bin/zsh"
export EDITOR="/usr/bin/nvim"
export PAGER="/usr/bin/less"
export LESSHISTFILE="/dev/null"
export XDG_CONFIG_HOME="$HOME/.config"

path+=("$HOME/.local/bin")

. "$HOME/.cargo/env" 2> /dev/null

eval "$(zoxide init zsh)" 2> /dev/null

macchina 2> /dev/null

PATH="/home/rishavc/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/rishavc/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rishavc/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rishavc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rishavc/perl5"; export PERL_MM_OPT;
