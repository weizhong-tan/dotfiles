#!/usr/bin/env zsh
export DOT_FILES=~/.dotfiles
source "$DOT_FILES/resources.sh"
source "$DOT_FILES/functions.sh"

bot "hello! welcome to your new computer"
bot "let's get going!"

bot "installing osx command line tools"
xcode-select --install

# set computer info
yes_or_no "Would you like to set computer info now?"
if confirmed; then
  set_computer_info
else
  bot "ok, but remember to set it later (set_computer_info)"
fi

# setup git credentials
yes_or_no "Would you like to set your git credentials now?"
if confirmed; then
  set_git_info
else
  bot "ok, but remember to do it before your first commit (set_git_info)!"
fi

###############################################################################
# global packages                                                             #
###############################################################################

# install brew
if hash brew 2>/dev/null; then
  printf "homebrew already installed"
else
  running "installing brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if [[ $? != 0 ]]; then
    error "unable to install homebrew -> quitting setup"
    exit 2
  fi
fi

running "updating to most recent brew version"
brew doctor
brew update
ok

# setup git credentials
yes_or_no "Install from Brewfile?"
if confirmed; then
  running "installing brew packages"
  brew bundle install --file "$DOT_FILES/brew/Brewfile"
  ok
fi

running "sourcing zshrc"
source ~/.zshrc
ok

###############################################################################
# osx                                                                         #
###############################################################################
yes_or_no "do you want to set sensible OSX defaults?"
if confirmed; then
  running "sourcing osx defaults"
  source "$DOT_FILES/.osx"
  ok
fi

bot "whooo, all set!"
