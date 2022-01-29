# loads aliases and functions
for file in $DOT_FILES/{shell/aliases,shell/functions,aws,custom}.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# adds RSA or DSA identities to the authentication agent: ~/.ssh/id_rsa, ~/.ssh/id_dsa and ~/.ssh/identity
ssh-add

# python
export PATH="${PATH}:${HOME}/Library/Python/3.7/bin"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# https://github.com/Schniz/fnm
if hash fnm 2>/dev/null; then
    eval "$(fnm env)"
fi

if hash zoxide 2>/dev/null; then
    eval "$(zoxide init zsh --cmd j)"
fi

if hash rbenv 2>/dev/null; then
    eval "$(rbenv init -)"
fi

# https://github.com/dylanaraps/fff
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
