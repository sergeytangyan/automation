#!/bin/bash

COMMAND1=nvim
if [ -x "$(command -v $COMMAND1)" ]; then
    echo "'$COMMAND1' already installed"
else
    echo "Installing $COMMAND1"
    sudo apt install -y neovim
fi

if [ ! -f ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
    cp -R ./dotfiles/.config/nvim ~/.config/
fi