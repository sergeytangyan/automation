#!/bin/bash

# COMMAND1=gnome-extensions
# if [ -x "$(command -v $COMMAND1)" ]; then
#     echo "'$COMMAND1' already installed"
# else
#     echo "Installing $COMMAND1"
#     sudo apt update
#     sudo apt install -y gnome-shell-extensions
# fi

COMMAND2=gnome-tweaks
if [ -x "$(command -v $COMMAND2)" ]; then
    echo "'$COMMAND2' already installed"
else
    echo "Installing $COMMAND2"
    sudo apt -y install gnome-tweaks
fi
