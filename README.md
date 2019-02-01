# dot-files

## Installing on to a new system

```sh
cd ~
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare git@github.com:weizhongtan/dot-files.git $HOME/.cfg
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
config config --local status.showUntrackedFiles no

# first-time installation setup
./dot-files/setup.sh
```

[source](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
