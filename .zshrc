export DOT_FILES=~/.dotfiles

# Aliases and functions
if [ -f "$DOT_FILES/load.sh" ]; then source "$DOT_FILES/load.sh"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh_plugins.sh
setopt    sharehistory
zstyle ':completion:*' menu select
autoload -U compinit
compinit

# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

bindkey '^[[Z' reverse-menu-complete
