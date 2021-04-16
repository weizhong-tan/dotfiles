export DEV_HOME="$HOME/development"
export DOT_FILES=~/.dotfiles

# Aliases and functions
if [ -f "$DOT_FILES/common.sh" ]; then source "$DOT_FILES/common.sh"; fi

# Adds colour by default to ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Interesting reading: https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
HISTSIZE=1000000         # history in memory
HISTFILESIZE=1000000000  # history on disk
shopt -s histappend      # save all history, not just last closed session

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# git branch autocomplete
source ~/.git-completion.bash
__git_complete gco _git_checkout
__git_complete gb _git_branch

# show git info in branch
source ~/.git-prompt.sh

# PS1 customization
reset=$(tput sgr0)   # resets colour
y0=$(tput setaf 226) # yellow 0
y1=$(tput setaf 220) # yellow 1
y2=$(tput setaf 214) # yellow 2
y3=$(tput setaf 208) # yellow 3
b1=$(tput setaf 39)  # blue
g1=$(tput setaf 10)  # green
m1=$(tput setaf 5)   # magenta
export PS1='\[$y0\]\D{%F %T} \[$y1\]\u\[$y2\]@\[$y3\]\h:\[$b1\]$(pwd)\[$g1\]$(__git_ps1 "(%s)") \n\[$m1\]ζ \[$reset\]'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wzt/google-cloud-sdk/path.bash.inc' ]; then source '/Users/wzt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wzt/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/wzt/google-cloud-sdk/completion.bash.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
