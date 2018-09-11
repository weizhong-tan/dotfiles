export DEV_HOME="$HOME/development"

# Set postgres path
export PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin:${HOME}/bin:/usr/local/bin"

# Set nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup Go path
if hash go 2>/dev/null; then
	export GOPATH="${HOME}/go"
	export PATH=$PATH:$(go env GOPATH)/bin
fi

# Aliases and functions
for file in ~/.dotfiles/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

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

# adds RSA or DSA identities to the authentication agent: ~/.ssh/id_rsa, ~/.ssh/id_dsa and ~/.ssh/identity
ssh-add

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

# avn https://github.com/wbyoung/avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"
