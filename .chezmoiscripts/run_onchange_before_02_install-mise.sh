#!/usr/bin/env bash

set -e

[[ -x ~/.local/bin/mise ]] || curl https://mise.run | sh

# Install erlang deps
sudo apt install -y autoconf m4 libncurses5-dev libwxgtk3.2-dev libwxgtk-webview3.2-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

# Install php deps
sudo apt install -y  bison gettext libgd-dev libcurl4-openssl-dev libedit-dev libicu-dev libjpeg-dev libmysqlclient-dev libonig-dev libpq-dev libreadline-dev libsqlite3-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev

# Install default programming languages
languages=(erlang elixir bun sqlite node go php)

for language in "${languages[@]}"; do
 ~/.local/bin/mise use -y -g "$language@latest"
done

# needed for elixir phoenix framework
sudo apt install -y inotify-tools
