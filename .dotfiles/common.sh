# loads aliases and functions
for file in $DOT_FILES/{shell/aliases,shell/functions,aws,custom}.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# adds RSA or DSA identities to the authentication agent: ~/.ssh/id_rsa, ~/.ssh/id_dsa and ~/.ssh/identity
ssh-add

# fly.io
export FLYCTL_INSTALL="/Users/wzt/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# starship
export STARSHIP_CONFIG=$DOT_FILES/starship/starship.toml

# go
export GOPATH="$HOME/dev"

# ruby
# TODO: replace with tea
if hash rbenv 2>/dev/null; then
    eval "$(rbenv init -)"
fi

# tea
export TEA_MAGIC=prompt
