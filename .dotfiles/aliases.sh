# interact with dot-files
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# enhanced ls -lAh
alias l='exa --long --all --header --git --group-directories-first'
alias ll='l --grid'

# alias ..='cd ..'
# alias ...='cd ../..'

alias g='git'
# alias gl='git log  --color --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset'\'' --abbrev-commit'
# alias gg='git status -s -b'
# alias gcb='git checkout -b'
# alias gb='git branch'
# alias gbr='git branch --remote'
# alias gco='git checkout'
# alias gd='git diff'
# alias gci='git checkout integration'
# alias gcm='git checkout master'
# alias gdi='git diff origin/integration'
# alias gdm='git diff origin/master'
# alias gri='git rebase -i integration'
# alias grm='git rebase -i master'
# alias glm..i='gl master..integration'

# reload zshrc
alias reload!='source ~/.zshrc'

# displays notification once a command completes
alias notify="osascript -e 'display notification \"Command Complete\"'"

# lock the screen
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# turn off display
alias afk='pmset displaysleepnow'
