#!/bin/bash

CONFIG_FILE=~/.ssh/config
if [ ! -f $CONFIG_FILE ]; then
    cp ./dotfiles/.ssh/config ~/.ssh
else
    echo "'$CONFIG_FILE' already exists"
fi

PUB_FILE=~/.ssh/id_rsa.pub
if [ ! -f $PUB_FILE ]; then
    ssh-keygen -o
else
    echo "'$PUB_FILE' already exists"
fi

cat $PUB_FILE
