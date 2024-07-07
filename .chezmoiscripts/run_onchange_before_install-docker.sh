#!/usr/bin/env bash

set -e

sudo apt install -y docker.io docker-buildx
sudo usermod -aG docker ${USER}

# Limit log size to avoid running out of disk
echo '{"log-driver":"local","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json > /dev/null

[[ -x ~/.docker/cli-plugins/docker-compose ]] || ~/.local/bin/eget docker/compose --to ~/.docker/cli-plugins/docker-compose -a linux-x86_64

# Install lazydocker to manage docker and docker-compose
[[ -x ~/.local/bin/lazydocker ]] || ~/.local/bin/eget jesseduffield/lazydocker --to ~/.local/bin/lazydocker -a Linux_x86_64
