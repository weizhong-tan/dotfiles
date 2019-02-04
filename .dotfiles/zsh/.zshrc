export DOT_FILES=~/.dotfiles

# Aliases and functions
if [ -f "$DOT_FILES/common.sh" ]; then source "$DOT_FILES/common.sh"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt sharehistory
bindkey '^[[Z' reverse-menu-complete
export COMPLETION_WAITING_DOTS="true";

source ~/.zsh_plugins.sh

autoload -Uz compinit
compinit
# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
# if [[ -n ${ZDOTDIR:-${HOME}}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit -d ~/.zcompdump;
# else
# 	compinit -C;
# fi;
