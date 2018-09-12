# loads aliases and functions
for file in $DOT_FILES/{aliases,functions}.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# Set postgres path
export PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin:${HOME}/bin:/usr/local/bin"

# Set nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Setup Go path
if hash go 2>/dev/null; then
	export GOPATH="${HOME}/go"
	export PATH=$PATH:$(go env GOPATH)/bin
fi

# adds RSA or DSA identities to the authentication agent: ~/.ssh/id_rsa, ~/.ssh/id_dsa and ~/.ssh/identity
ssh-add

# avn https://github.com/wbyoung/avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"
