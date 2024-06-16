source $ZSH/plugins/zsh-defer/zsh-defer.plugin.zsh

plugins=(
  zsh-autocomplete/zsh-autocomplete.plugin.zsh
  zsh-autosuggestions/zsh-autosuggestions.zsh
  fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
)

for file in $plugins
do
  zsh-defer source $ZSH/plugins/$file
done
