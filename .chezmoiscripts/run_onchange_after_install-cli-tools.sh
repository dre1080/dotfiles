#!/usr/bin/env bash

set -e

sudo apt install -y bat ripgrep git-delta eza zoxide sd xclip jq fzf plocate ffmpeg aria2 fd-find

ln -sf $(which batcat) ~/.local/bin/bat
ln -sf $(which fdfind) ~/.local/bin/fd

[[ -x ~/.local/bin/yt-dlp ]] || ~/.local/bin/eget yt-dlp/yt-dlp --to ~/.local/bin/yt-dlp -a yt-dlp_linux

if [[ ! -x ~/.local/bin/micro ]]; then
  ~/.local/bin/eget zyedidia/micro --to ~/.local/bin/micro -a static -a .tar.gz
  ~/.local/bin/micro -plugin install filemanager
  ~/.local/bin/micro -plugin install detectindent
fi

~/.local/bin/mise x rust -- cargo install topgrade rm-improved xcp starship du-dust bottom dysk
