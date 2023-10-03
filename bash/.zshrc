# Load Oh My Posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/bash_theme.omp.json)"
fi

# Setup zsh history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# Load antigen
#source ~/.config/zsh/antigen.zsh
[[ -r ~/.znap/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/znap
source ~/.znap/znap/znap.zsh  # Start Znap

# Start compinit
autoload -Uz compinit # https://unix.stackexchange.com/questions/339954/zsh-command-not-found-compinstall-compinit-compdef
compinit

# fsf autocompletion
znap source Aloxaf/fzf-tab

# Fish like autocompletion
znap source marlonrichert/zsh-autocomplete

# Fish like autocompletion
znap source zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
# antigen apply

# Setup zoxide
eval "$(zoxide init zsh)"

# Path and Variables
PATH=$PATH:~/.local/bin
PATH=$PATH:~/.cargo/bin

# Alias
alias ls='logo-ls'
alias la='logo-ls -A'
alias ll='logo-ls -al'
alias lsg='logo-ls -D'
alias lag='logo-ls -AD'
alias llg='logo-ls -alD'
alias wal="feh --bg-fill"
alias ww='wget'
alias ree='redshift -P -O 3500'
alias vi='nvim'
alias vim='nvim'
alias del='sudo rm -r'
alias comp='sudo make install'
alias gl='git clone'
alias update='sudo apt update && sudo apt upgrade'
alias instal='sudo apt install'

. "$HOME/.cargo/env"
