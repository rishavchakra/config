if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    zoxide init fish | source

    macchina
end

alias v nvim

alias ls 'eza --icons'

alias tmux-go 'tmux attach -t'
alias tmux-kill 'tmux kill-session'

alias lg lazygit

alias p pnpm

alias pls sudo
alias please sudo

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" hook $argv | source
# <<< conda initialize <<<

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s /usr/local/opt/nvm/etc/bash_completion ] && \. /usr/local/opt/nvm/etc/bash_completion
