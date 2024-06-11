
# setup flyctl
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

if [[ $IS_WSL ]]; then
  export WIN_HOME=$(wslpath "$(wslvar USERPROFILE)")
  export PATH="$PATH:/mnt/c/Windows/system32"
fi

# setup rubygems
(( $+commands[gem] )) && export PATH="$(gem environment gemdir)/bin:$PATH"

# add mise shims to PATH
(( $+commands[mise] )) && export PATH="$HOME/.local/share/mise/shims:$PATH"
