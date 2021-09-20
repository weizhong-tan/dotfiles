# dotfiles

## Installing on to a new system

```sh
cd ~
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare git@github.com:weizhongtan/dotfiles.git $HOME/.cfg
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
config config --local status.showUntrackedFiles no

# first-time installation setup
~/.dotfiles/setup.sh
```

adapted from [source](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

## Todo:
- Ask to install each brew formula
- Add docs/automate git setup
- Fix OSX settings
- Add docs for zsh anitbody setup