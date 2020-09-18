# loads aliases and functions
for file in $DOT_FILES/{aliases,functions}.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# adds RSA or DSA identities to the authentication agent: ~/.ssh/id_rsa, ~/.ssh/id_dsa and ~/.ssh/identity
ssh-add

# Set postgres path
export PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin:${HOME}/bin:/usr/local/bin"

# python
export PATH="${PATH}:${HOME}/Library/Python/3.7/bin"

# Setup Go path
if hash go 2>/dev/null; then
    export GOPATH="${HOME}/go"
    export PATH=$PATH:$(go env GOPATH)/bin
fi

# avn https://github.com/wbyoung/avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# load local custom files
[[ -s "$HOME/.custom" ]] && source "$HOME/.custom"

# python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
