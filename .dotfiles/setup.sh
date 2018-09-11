#!/usr/bin/env bash
source "$DOT_FILES/resources.sh"

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

running "Select which bundled brew & brew-cask packages you want to install"
source "$DOT_FILES/installs/brew_installs"
ok "feel free to add more brew packages!"

# globally install key npm pkgs
running "Select which bundled npm modules you want to install"
source "$DOT_FILES/installs/npm_installs"
ok "feel free to add more npm modules!"

###############################################################################
# shell                                                                       #
###############################################################################
running "downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [[ $? != 0 ]]; then
  error "unable to install oh-my-zsh -> quitting setup"
  exit 2
fi
ok

# install powerline fonts to enable certain zsh themes
running "installing powerline fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
ok

bot "setting zsh as the user shell"
CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
  bot "setting newer homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
  sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
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

bot "whooo, all set! "
