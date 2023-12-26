# Dotfiles

This currently assumes an ubuntu distro and is a oneline chezmoi install.

## Pre-requisites

Install the following packages to get the most out of these dotfiles.

- zgenom - https://github.com/jandamm/zgenom
- direnv - https://github.com/direnv/direnv
- fzf - https://github.com/junegunn/fzf
- asdf - https://asdf-vm.com (with plugins: elixir, erlang, nodejs, php, ruby, golang, sqlite)
- podman - https://podman.io/docs/installation
- compose - https://docs.docker.com/compose/install/standalone
- flyctl - https://github.com/superfly/flyctl
- gh - https://github.com/cli/cli/blob/trunk/docs/install_linux.md

**Recommended font:** [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz)

## Installation

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply dre1080`
