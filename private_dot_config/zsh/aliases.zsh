# File system
# alias ls='eza -lh --group-directories-first --icons'
# alias lsa='ls -a'
# alias lt='eza --tree --level=2 --long --icons --git'
# alias lta='lt -a'

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias g='git'
alias p='podman'
alias docker='podman'
alias yt='yt-dlp'
alias m='micro'
alias x='mise x --'
alias cz=chezmoi
alias erlv="erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), \"releases\", erlang:system_info(otp_release), \"OTP_VERSION\"])), io:fwrite(Version), halt().' -noshell"
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# Git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias gst='git status'
