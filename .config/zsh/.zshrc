# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(
	git
	1password
	aws
	docker
	you-should-use
#	zsh-vi-mode
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-autocomplete
)


# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias reloadzsh="source ~/.zshrc"
alias ls="eza --icons=always"
alias icat="kitty +kitten icat"
alias s="kitty +kitten ssh"
alias nvim='NVIM_APPNAME="nvim-bfavis" \nvim'
alias nvim-lazy='NVIM_APPNAME="nvim-lazyvim" \nvim'

eval $(thefuck --alias)
eval $(thefuck --alias fk)
# use zoxide instead of cd
# https://www.youtube.com/watch?v=aghxkpyRVDY&ab_channel=DreamsofAutonomy
eval "$(zoxide init --cmd cd zsh)"

# autocomplete keybind changing tab
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# fix the scrolling through history with arrow key issue
() {
  while (( ARGC )); do
    bindkey -M $1 '^[OA' up-line-or-history
    bindkey -M $1 '^[[A' up-line-or-history
    bindkey -M $1 '^[OB' down-line-or-history
    bindkey -M $1 '^[[B' down-line-or-history
    shift
  done
} emacs viins vicmd

eval "$(starship init zsh)"
