# Create `ipa` command. `ipa local` gives your
# local IP, `ipa remote` gives your external IP.
# `ipa` gives both.
ipa() {
    local cmd="$1"

    case "$cmd" in
        local)
            [[ $OSTYPE == darwin* ]] && ifconfig en0 | grep 'inet ' | awk '{print $2}'
            [[ $OSTYPE == linux* ]] && ifconfig wlp2s0 | awk '/\sinet\s/{print $2}'
            ;;
        remote)
            curl icanhazip.com
            ;;
        *)
            echo -n 'LOCAL:  '
            ipa local
            echo -n 'REMOTE: '
            ipa remote
    esac
}

gclean() {
    # remove branches deleted on remote
    echo 'git fetch --prune origin'
    git fetch --prune origin

    # deletes all merged branches from remote (except integration and master)
    git branch --merged | grep -v "integration\|master" > /tmp/merged-branches
    vi /tmp/merged-branches && xargs git branch -d < /tmp/merged-branches
}
