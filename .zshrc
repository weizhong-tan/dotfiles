export DOT_FILES=~/.dotfiles

# Aliases and functions
if [ -f "$DOT_FILES/load.sh" ]; then source "$DOT_FILES/load.sh"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh_plugins.sh
setopt    sharehistory
zstyle ':completion:*' menu select
autoload -U compinit
compinit
