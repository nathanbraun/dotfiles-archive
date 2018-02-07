source ~/dotfiles/.git-prompt.sh
PS1="\[\e[1;32m\]\u@\h\[\e[1;34m\] \w\[\e[0m\]\$(__git_ps1)\[\e[1;34m\] \$\[\e[0m\] "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
