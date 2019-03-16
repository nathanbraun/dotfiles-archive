PS1="\[\e[1;32m\]\u@\h\[\e[1;34m\] \w\[\e[0m\]\$(__git_ps1)\[\e[1;34m\] \$\[\e[0m\] "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/git-sync"
