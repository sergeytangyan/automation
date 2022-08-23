function brew_install() {
    brew install $@
}

function apt_install() {
    apt install -y $@
}

function isDarwin() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        true
    else
        false
    fi
}

function isLinux() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        true
    else
        false
    fi
}

repeat() {
    i=1
    while [[ $i -le $2 ]]; do
        echo -n $1
        ((i = i + 1))
    done
    echo
}

function pprint() {
    MESSAGE="=== $1 ==="
    LENGTH=${#MESSAGE}

    repeat "=" $LENGTH
    echo $MESSAGE
    repeat "=" $LENGTH
    echo
}

function install() {
    pprint "installing $(echo $@)"

    if isLinux; then
        sudo apt update
        apt_install $@
    elif isDarwin; then
        brew update
        brew_install $@
    else
        echo >&2 "invalid os"
        exit 1
    fi
}

function install_if_missing() {
    INSTALLED_COMMAND=$1 # locally installed name
    LIBRARY=$2           # remote library name

    if [ -z "$2" ]; then
        LIBRARY=$1
    fi

    if [ -x "$(command -v $INSTALLED_COMMAND)" ]; then
        pprint "'$INSTALLED_COMMAND' already installed"
    else
        pprint "Installing '$INSTALLED_COMMAND'"
        install $LIBRARY
    fi
}
