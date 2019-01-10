function set_computer_info() {
    printf "$COL_MAGENTA Enter your computer name$COL_RESET: "
    read cpname

    sudo scutil --set ComputerName "$cpname"
    sudo scutil --set HostName "$cpname"
    sudo scutil --set LocalHostName "$cpname"
    defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$cpname"
}

function set_git_info() {
  printf "$COL_MAGENTA set your github username$COL_RESET: "
  read name
  printf "$COL_MAGENTA set your github email$COL_RESET: "
  read email

  git config --global user.name $name
  git config --global user.email $email

  # make sure it's correct
  git config --global user.name
  git config --global user.email

  git config --global include.path "$DOT_FILES/.gitconfig"
}

# Create `ipa` command. `ipa local` gives your
# local IP, `ipa remote` gives your external IP.
# `ipa` gives both.
function ipa() {
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

function gclean() {
    # remove branches deleted on remote
    echo 'git fetch --prune origin'
    git fetch --prune origin

    # deletes all merged branches from remote (except integration and master)
    git branch --merged | grep -v "develop\|master" > /tmp/merged-branches
    vi /tmp/merged-branches && xargs git branch -d < /tmp/merged-branches
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

function mostused() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}
