#!/bin/bash

sudo apt-get install dconf-cli uuid-runtime

echo "===========================
REMEMBER: GRUVBOX-DARK = 72
==========================="
sleep 3s

export TERMINAL=gnome-terminal
bash -c "$(wget -qO- https://git.io/vQgMr)"
