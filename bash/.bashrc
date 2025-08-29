# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# alias nvim='NVIM_APPNAME="nvim-bfavis" \nvim'
alias nvim='NVIM_APPNAME="nvim-lazyvim" \nvim'
alias nvim-bfavis='NVIM_APPNAME="nvim-bfavis" \nvim'
alias nvim-lazy='NVIM_APPNAME="nvim-lazyvim" \nvim'

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

# start ssh agent to cache pw
# eval "$(ssh-agent -s)"
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [ ! -f "$SSH_AUTH_SOCK" ]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi
