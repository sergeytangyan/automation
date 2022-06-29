#!/bin/bash

curl https://pyenv.run | bash
pyenv install --list | awk '{print $1}' | grep -v - | grep -v 'a\|b\|c\|m' | tail -1