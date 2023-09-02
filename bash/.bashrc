# bashrc

# Load Oh My Posh
#eval "$(oh-my-posh init bash)"
eval "$(oh-my-posh init bash --config ~/.config/bash_theme.omp.json)" # TODO convert OMP theme to use catppuccin mocha colours

[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# # draw horiz line under prompt
# draw_line() {
#   local COLUMNS="$COLUMNS"
#   while ((COLUMNS-- > 0)); do
#     printf '\e[30m\u2500'
#   done
# }

# my prompt
PS1="\[\033[32m\]  \[\033[37m\]\[\033[34m\]\w \[\033[0m\]"
PS2="\[\033[32m\]  > \[\033[0m\]"

# Path and Variables
PATH=$PATH:~/.local/bin
PATH=$PATH:~/.cargo/bin

# bash history
HISTSIZE=
HISTFILESIZE=

# my aliases
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

# youtube-dl to download stuffs
alias yt='youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3'
alias ytv='youtube-dl --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'

# check mem
export FZF_DEFAULT_OPTS='
  --color fg:#CDD6F4
  --color bg+:#1E1E2E,fg+:#F38BA8,hl:#A6E3A1,hl+:#89B4FA,gutter:#CBA6F7
  --color pointer:#A6E3A1,info:#7F849C
  --border
  --color border:#A6E3A1'

source "$HOME/.config/fzf-tab-completion/bash/fzf-bash-completion.sh"
bind -x '"\t": fzf_bash_completion'

. "$HOME/.cargo/env"
