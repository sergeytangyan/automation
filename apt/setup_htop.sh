#!/bin/bash

COMMAND1=htop
if [ -x "$(command -v $COMMAND1)" ]; then
    echo "'$COMMAND1' already installed"
else
    echo "Installing $COMMAND1"
    sudo apt update
    sudo apt install -y htop
fi

if [ ! -f ~/.config/htop ]; then
    mkdir -p ~/.config/htop
    cp -R ./dotfiles/.config/htop ~/.config/
fi
