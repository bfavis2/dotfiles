# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
# /etc/omarchy.conf is written by omarchy-dev-link. When absent, force the
# package default instead of preserving a stale inherited dev-link value before
# we decide which rc file to source.
if [[ -f /etc/omarchy.conf ]]; then
  source /etc/omarchy.conf
  export OMARCHY_PATH="${OMARCHY_PATH:-/usr/share/omarchy}"
else
  export OMARCHY_PATH=/usr/share/omarchy
fi
source "$OMARCHY_PATH/default/bash/rc"

# autostart zellij for all interactive shells
# eval "$(zellij setup --generate-auto-start bash)"

# alias nvim='NVIM_APPNAME="nvim-bfavis" \nvim'
# alias nvim='NVIM_APPNAME="nvim-lazyvim" \nvim'
alias nvim-bfavis='NVIM_APPNAME="nvim-bfavis" \nvim'
alias nvim-lazy='NVIM_APPNAME="nvim-lazyvim" \nvim'
alias nvim-min='NVIM_APPNAME="nvim-min" \nvim'

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
# if ! pgrep -u "$USER" ssh-agent >/dev/null; then
#   ssh-agent -t 1h >"$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [ ! -f "$SSH_AUTH_SOCK" ]; then
#   source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

# improved ssh agent caching
SSH_ENV="$XDG_RUNTIME_DIR/ssh-agent.env"
[ -z "$XDG_RUNTIME_DIR" ] && SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" >/dev/null
}

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" >/dev/null
  # check if the stored PID is still interactive
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent >/dev/null || {
    start_agent
  }
else
  start_agent
fi

. "$HOME/.local/share/../bin/env"

# opencode
export PATH=/home/bfavis/.opencode/bin:$PATH
