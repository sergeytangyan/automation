#!/bin/bash
source ./common/helper.sh

CONFIG_FILE=~/.ssh/config
if [ ! -f $CONFIG_FILE ]; then
    pprint "Creating '$CONFIG_FILE'"
    cp ./dotfiles/.ssh/config ~/.ssh
else
    pprint "'$CONFIG_FILE' already exists"
fi

PUB_FILE=~/.ssh/id_rsa.pub
if [ ! -f $PUB_FILE ]; then
    pprint "Creating new ssh key"
    ssh-keygen -o
else
    pprint "'$PUB_FILE' already exists"
fi
