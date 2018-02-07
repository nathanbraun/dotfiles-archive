#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# put in vi mode:
bindkey -v

# set editor
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

# add kj and jk to insert mode
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

#source zsh-snippets/snippets.plugin.zsh

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

export PATH=~/.dotfiles/bin:${PATH}

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
