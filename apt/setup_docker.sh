#!/bin/bash

install_docker() {
    sudo apt update

    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt update
    apt-cache policy docker-ce

    sudo apt install -y docker-ce
    sudo chmod 666 /var/run/docker.sock
    # sudo systemctl status docker

    # sudo-less docker
    sudo usermod -aG docker ${USER}

    docker info
}

install_docker_compose() {
    mkdir -p ~/.docker/cli-plugins/
    curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    chmod +x ~/.docker/cli-plugins/docker-compose
    docker compose version
}

COMMAND1=docker
if [ -x "$(command -v $COMMAND1)" ]; then
    echo "'$COMMAND1' already installed"
else
    echo "Installing docker"
    install_docker
fi

if [ -f ~/.docker/cli-plugins/docker-compose ]; then
    echo "'Docker compose' already installed"
else
    echo "Installing docker compose"
    install_docker_compose
fi
