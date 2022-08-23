#!/bin/bash
source ./common/helper.sh

if [[ -f "${HOME}/.nvm/nvm.sh" ]]; then
    pprint "'nvm' already installed"
    exit 1
fi

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

source ~/.nvm/nvm.sh &&
    nvm install --lts &&
    nvm use --lts
