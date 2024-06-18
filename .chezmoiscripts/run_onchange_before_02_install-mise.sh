#!/usr/bin/env bash

set -e

[[ -x ~/.local/bin/mise ]] || curl https://mise.run | sh

# Install default programming languages
languages=(erlang elixir bun sqlite node go php rust)

for language in $languages; do
 ~/.local/bin/mise use -g $language@latest
done

# needed for elixir phoenix framework
sudo apt install -y inotify-tools
