#!/usr/bin/env bash

set -e

sudo apt install -y bat ripgrep git-delta eza zoxide sd xclip jq fzf plocate ffmpeg aria2 fd-find btop

# Remove Btop entry for one that runs in wezterm
sudo rm -rf /usr/share/applications/btop.desktop

# Replacing this with btop
sudo rm -rf /usr/share/applications/org.gnome.SystemMonitor.desktop

ln -sf $(which batcat) ~/.local/bin/bat
ln -sf $(which fdfind) ~/.local/bin/fd

[[ -x ~/.local/bin/yt-dlp ]] || ~/.local/bin/eget yt-dlp/yt-dlp --to ~/.local/bin/yt-dlp -a yt-dlp_linux

if [[ ! -x ~/.local/bin/micro ]]; then
  ~/.local/bin/eget zyedidia/micro --to ~/.local/bin/micro -a static -a .tar.gz
  ~/.local/bin/micro -plugin install filemanager
  ~/.local/bin/micro -plugin install detectindent
fi

[[ -x ~/.local/bin/starship ]] || ~/.local/bin/eget starship/starship --to ~/.local/bin/starship -a x86_64 -a linux-gnu

[[ -x ~/.local/bin/trash ]] || ~/.local/bin/eget oberblastmeister/trashy --to ~/.local/bin/trash -a x86_64 -a linux-gnu
