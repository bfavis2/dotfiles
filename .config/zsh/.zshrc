# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

alias zshconfig="nvim ~/dotfiles/.config/zsh/.zshrc"
alias reloadzsh="source ~/.config/zsh/.zshrc"
alias c='clear' # clear terminal
alias ls='eza -lh --icons=auto' # long list
alias l='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias icat="kitty +kitten icat"
alias s="kitty +kitten ssh"
alias nvim='NVIM_APPNAME="nvim-bfavis" \nvim'
alias nvim-lazy='NVIM_APPNAME="nvim-lazyvim" \nvim'

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

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

eval "$(zellij setup --generate-auto-start zsh)"
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fastfetch
