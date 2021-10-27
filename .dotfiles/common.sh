# loads aliases and functions
for file in $DOT_FILES/{aliases,functions,aws,custom}.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# adds RSA or DSA identities to the authentication agent: ~/.ssh/id_rsa, ~/.ssh/id_dsa and ~/.ssh/identity
ssh-add

# python
export PATH="${PATH}:${HOME}/Library/Python/3.7/bin"

# python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

if hash fnm 2>/dev/null; then
    eval "$(fnm env)"
fi
