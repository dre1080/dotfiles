#!/usr/bin/env bash

set -e

[[ -x ~/.local/bin/mise ]] || curl mise.run | sh

# needed for elixir phoenix framework
sudo apt install -y inotify-tools

# Install default programming languages
languages=(erlang elixir bun sqlite node go php rust)

for language in $languages; do
 ~/.local/bin/mise use -g $language@latest
done
