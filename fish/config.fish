if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim 'nvim'
alias vi 'nvim'
alias v 'nvim'

alias ls 'exa --icons'
alias neofetch 'neofetch | lolcat'

alias tmux-go 'tmux attach -t'
alias tmux-kill 'tmux kill-session'

alias lg 'lazygit'

set -Ux LIBRARY_PATH '/opt/homebrew/lib'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

starship init fish | source

zoxide init fish | source

macchina

# pnpm
set -gx PNPM_HOME "/Users/rishavc/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
