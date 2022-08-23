#!/bin/bash
source ./common/helper.sh

# ------------------
install_if_missing curl
install_if_missing git
install_if_missing vim
install_if_missing tree

# ------------------
install_if_missing htop

if [ ! -d ~/.config/htop ]; then
    pprint "setting up 'htop'"
    mkdir -p ~/.config/htop
    cp -R ./dotfiles/.config/htop ~/.config/
fi

# ------------------
install_if_missing nvim neovim

if [ ! -d ~/.config/nvim ]; then
    pprint "setting up 'nvim'"
    mkdir -p ~/.config/nvim
    cp -R ./dotfiles/.config/nvim ~/.config/
fi

# ------------------
if isLinux; then
    pprint "Setting up alternatives"
    sudo update-alternatives --config editor
fi
