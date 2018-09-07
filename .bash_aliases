alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias l='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'

alias gl='git log  --color --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias gg='git status -s -b'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbr='git branch --remote'
alias gco='git checkout'
alias gd='git diff'
alias gci='git checkout integration'
alias gcm='git checkout master'
alias gdi='git diff origin/integration'
alias gdm='git diff origin/master'
alias gri='git rebase -i integration'
alias grm='git rebase -i master'
alias glm..i='gl master..integration'

alias reload='source ~/.bash_profile'
alias notify="osascript -e 'display notification \"Command Complete\"'"

# ock the screen
alias lksc="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
