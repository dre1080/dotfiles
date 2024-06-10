#!/bin/bash

{{ if eq .chezmoi.os "linux" }}
{{   if not (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
sudo apt install -y --no-install-recommends fontconfig xz-utils

fontName = 'JetBrainsMono Nerd Font'
isFontInstalled = $(fc-list :family=$fontName)

if [ -z "$isFontInstalled" ]; then
  mkdir -p $HOME/.local/share/fonts

  $HOME/.local/bin/lastversion download ryanoasis/nerd-fonts -y --format assets --filter JetBrainsMono.tar.xz

  tar -xf JetBrainsMono.tar.xz -C $HOME/.local/share/fonts --wildcards 'JetBrainsMonoNerdFont-*.ttf'

  rm JetBrainsMono.tar.xz

  fc-cache -f

  gsettings set org.gnome.desktop.interface monospace-font-name $fontName
fi
{{   end }}
{{ end }}
