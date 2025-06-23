# interact with dotfiles
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# enhanced ls -lAh
alias l='eza --long --all --header --git --group-directories-first'
alias ll='l --grid'

alias g='git'

# reload zshrc
alias reload!='source ~/.zshrc'

# displays notification once a command completes
alias notify="osascript -e 'display notification \"Command Complete\"'"

# lock the screen
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# turn off display
alias afk='pmset displaysleepnow'

# for typos
alias nom='npm'

# Updates antibody plugins cache
alias bundle_plugins='antibody bundle < ~/.dotfiles/zsh/zsh_plugins.zsh > ~/.dotfiles/zsh/zsh_plugins_generated.sh'

# ......
alias back='cd -'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
alias ............='cd ../../../../../../../../../../../'

# ZSH Global Aliases
alias -g L=' | less'
alias -g T=' | tail -20'
alias -g NUL=' > /dev/null 2>&1'

# I like to be safe...
alias rm='rm -i'

# derp derp
alias mkdirp='mkdir -p'

# vscode
alias c='code'

# alias psql=pgcli
