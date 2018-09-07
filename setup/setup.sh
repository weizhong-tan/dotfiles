#!/usr/bin/env bash
source resources.sh

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

running "Select which bundled brew & brew-cask packages you want to install"
source installs/brew_installs
ok "feel free to add more brew packages!"

# globally install key npm pkgs
running "Select which bundled npm modules you want to install"
source installs/npm_installs
ok "feel free to add more npm modules!"

running "sourcing bashrc"
source ~/.bashrc
ok

yes_or_no "do you want to set sensible OSX defaults?"
if confirmed; then
  running "sourcing osx defaults"
  source .osx
  ok
fi

bot "whooo, all set! "
