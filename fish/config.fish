if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    zoxide init fish | source

    macchina
end

alias v nvim

alias ls 'eza --icons'
# alias neofetch 'neofetch | lolcat'

alias tmux-go 'tmux attach -t'
alias tmux-kill 'tmux kill-session'

alias lg lazygit

alias p pnpm

function pls
	if test "$argv" = !
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end

# source ~/.config/fish/kanagawa.fish

set -Ux LIBRARY_PATH /opt/homebrew/lib

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" hook $argv | source
# <<< conda initialize <<<

# pnpm
set -gx PNPM_HOME /Users/rishavc/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# opam configuration
source /Users/rishavc/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

set -gx AFL_PATH /Users/rishavc/Documents/Dartmouth/Security/PS3/AFLplusplus

# Node Version Manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
# [ -s /usr/local/opt/nvm/etc/bash_completion ] && \. /usr/local/opt/nvm/etc/bash_completion
