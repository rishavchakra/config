if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    zoxide init fish | source

    macchina
end

alias vim nvim
alias vi nvim
alias v nvim

alias ls 'exa --icons'
alias neofetch 'neofetch | lolcat'

alias tmux-go 'tmux attach -t'
alias tmux-kill 'tmux kill-session'

alias lg lazygit

set -Ux LIBRARY_PATH /opt/homebrew/lib
